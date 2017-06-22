docker build keystone/base/. --tag keystone-base:centos
docker build keystone/api/. --tag keystone-api:centos
docker build glance/base/. --tag glance-base:centos
docker build glance/database/. --tag glance-database:centos
docker build glance/api/. --tag glance-api:centos
docker build openstack-client/. --tag openstack-client:centos
docker build service-endpoints/. --tag service-endpoints:centos
