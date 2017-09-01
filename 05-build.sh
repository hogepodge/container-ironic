docker build keystone/base/. --tag keystone-base:centos
docker build keystone/api/. --tag keystone-api:centos

docker build glance/base/. --tag glance-base:centos
docker build glance/database/. --tag glance-database:centos
docker build glance/api/. --tag glance-api:centos
docker build glance/registry/. --tag glance-registry:centos

docker build ironic/base/. --tag ironic-base:centos
docker build ironic/database/. --tag ironic-database:centos
docker build ironic/api/. --tag ironic-api:centos
docker build ironic/conductor/. --tag ironic-conductor:centos
docker build ironic/imagedata/. --tag ironic-imagedata
docker build ironic/tftp/. --tag ironic-tftp:centos
docker build ironic/nginx/. --tag ironic-nginx

docker build nova/base/. --tag nova-base:centos

docker build openstack-client/. --tag openstack-client:centos
docker build service-endpoints/. --tag service-endpoints:centos
