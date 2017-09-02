docker stop rabbitmq 
docker rm rabbitmq

docker stop mariadb 
docker rm mariadb

docker stop keystone 
docker rm keystone

docker stop glance-api 
docker rm glance-api
docker stop glance-registry
docker rm glance-registry

docker stop ironic-api
docker rm ironic-api
docker stop ironic-conductor
docker rm ironic-conductor

docker stop nova-api
docker rm nova-api

docker rm service-endpoints
docker volume rm mariadb-volume

