docker build keystone/base/. --tag keystone-base:pike-centos
docker build keystone/api/. --tag keystone-api:pike-centos

docker build glance/base/. --tag glance-base:pike-centos
docker build glance/database/. --tag glance-database:pike-centos
docker build glance/api/. --tag glance-api:pike-centos
docker build glance/registry/. --tag glance-registry:pike-centos

docker build ironic/base/. --tag ironic-base:pike-centos
docker build ironic/database/. --tag ironic-database:pike-centos
docker build ironic/api/. --tag ironic-api:pike-centos
docker build ironic/conductor/. --tag ironic-conductor:pike-centos
docker build ironic/imagedata/. --tag ironic-imagedata
docker build ironic/tftp/. --tag ironic-tftp:pike-centos
docker build ironic/nginx/. --tag ironic-nginx

docker build nova/base/. --tag nova-base:pike-centos
docker build nova/database/. --tag nova-database:pike-centos
docker build nova/api/. --tag nova-api:pike-centos

docker build openstack-client/. --tag openstack-client:pike-centos
docker build service-endpoints/. --tag service-endpoints:pike-centos
