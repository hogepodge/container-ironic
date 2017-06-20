#!/bin/bash

function fail {
  echo $1 >&2
  exit 1
}

function retry {
  local n=1
  local max=5
  local delay=15
  while true; do
    "$@" && break || {
      if [[ $n -lt $max ]]; then
        ((n++))
        echo "Command failed. Attempt $n/$max:"
        sleep $delay;
      else
        fail "The command has failed after $n attempts."
      fi
    }
  done
}

# Create the initial database user
cat > /tmp/create_database.sql <<-EOF
CREATE DATABASE IF NOT EXISTS keystone CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' \
       IDENTIFIED BY '$MYSQL_KEYSTONE_PASSWORD';
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' \
       IDENTIFIED BY '$MYSQL_KEYSTONE_PASSWORD';
EOF
retry mysql -u root -p$MYSQL_ROOT_PASSWORD -h mariadb < /tmp/create_database.sql

# generate the keystone and httpd configuration files
/generate.keystone.conf
/generate.httpd.conf
ln -s /wsgi-keystone.conf /etc/httpd/conf.d/

# Bootstrap keystone
keystone-manage db_sync
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
keystone-manage credential_setup --keystone-user keystone --keystone-group keystone
keystone-manage bootstrap --bootstrap-password $KEYSTONE_ADMIN_PASSWORD \
  --bootstrap-admin-url http://localhost:35357/v3/ \
  --bootstrap-internal-url http://localhost:5000/v3/ \
  --bootstrap-public-url http://localhost:5000/v3/ \
  --bootstrap-region-id RegionOne

# Start apache
httpd -k start -D FOREGROUND
