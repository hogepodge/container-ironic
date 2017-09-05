#!/bin/bash

# Create the initial database user
cat > /tmp/create_database.sql <<-EOF
CREATE DATABASE IF NOT EXISTS keystone CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' \
       IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' \
       IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF

mysql -u root -p$MYSQL_ROOT_PASSWORD -h ${CONTROL_HOST} < /tmp/create_database.sql

echo ${CONTROL_HOST}

# generate the keystone and httpd configuration files
/generate.keystone.conf
/generate.httpd.conf

cat /etc/httpd/conf/httpd.conf

# link the wsgi config to the web server
ln -sf /wsgi-keystone.conf /etc/httpd/conf.d/

# Bootstrap keystone
keystone-manage db_sync
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
keystone-manage credential_setup --keystone-user keystone --keystone-group keystone
keystone-manage bootstrap --bootstrap-password $KEYSTONE_ADMIN_PASSWORD \
  --bootstrap-admin-url http://${CONTROL_HOST}:35357/v3/ \
  --bootstrap-internal-url http://${CONTROL_HOST}:5000/v3/ \
  --bootstrap-public-url http://${CONTROL_HOST}:5000/v3/ \
  --bootstrap-region-id RegionOne

# Start apache
httpd -k start -D FOREGROUND
