#!/bin/bash

cat > /tmp/create_database.sql <<-EOF
CREATE DATABASE IF NOT EXISTS nova CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'localhost' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

CREATE DATABASE IF NOT EXISTS nova_api CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON nova_api.* TO 'nova'@'localhost' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON nova_api.* TO 'nova'@'%' \
  IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF

mysql -u root -p$MYSQL_ROOT_PASSWORD -h mariadb < /tmp/create_database.sql

/generate.nova.conf

nova-manage api_db sync
# nova-manage cell_v2 map_cell0
# nova-manage cell_v2 create_cell --name=cell1 --verbose
nova-manage db sync
# nova-manage cell_v2 list_cells
