#!/bin/bash

/wait-for-it.sh --host=mariadb --port=3306 -t 60

# because we can't actually trust MariaDB to be ready
sleep 10

cat > /tmp/create_database.sql <<-EOF
CREATE DATABASE IF NOT EXISTS glance CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF

mysql -u root -p$MYSQL_ROOT_PASSWORD -h ${CONTROL_HOST_IP} < /tmp/create_database.sql

glance-manage db_sync
