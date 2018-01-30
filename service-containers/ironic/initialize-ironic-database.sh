#!/bin/bash

/wait-for-it.sh --host=mariadb --port=3306 -t 60

# because we can't actually trust MariaDB to be ready
sleep 5

cat > /tmp/create_database.sql <<-EOF
CREATE DATABASE IF NOT EXISTS ironic CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON ironic.* TO 'ironic'@'localhost' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON ironic.* TO 'ironic'@'%' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF

mysql -u root -p$MYSQL_ROOT_PASSWORD -h ${CONTROL_HOST_IP} < /tmp/create_database.sql

/generate.ironic.conf

ironic-dbsync
