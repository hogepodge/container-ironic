#!/bin/bash

cat > /tmp/create_database.sql <<-EOF
CREATE DATABASE IF NOT EXISTS glance CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF

mysql -u root -p$MYSQL_ROOT_PASSWORD -h mariadb < /tmp/create_database.sql

/generate.glance-api.conf
/generate.glance-registry.conf
glance-manage db_sync
