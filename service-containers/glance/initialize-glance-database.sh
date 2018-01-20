#!/bin/bash

/wait-for-it.sh --host=${CONTROL_HOST_IP} --port=3306 -t 60

cat > /tmp/create_database.sql <<-EOF
CREATE DATABASE IF NOT EXISTS glance CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF

mysql -u root -p$MYSQL_ROOT_PASSWORD -h ${CONTROL_HOST_IP} < /tmp/create_database.sql

glance-manage db_sync
