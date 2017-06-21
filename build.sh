docker build keystone/keystone_base/. --tag keystone_base:centos
docker build keystone/keystone_api/. --tag keystone_api:centos
docker build glance/base/. --tag glance_base:centos
docker build glance/database/. --tag glance_database:centos
docker build glance/api/. --tag glance_api:centos
docker build client/. --tag openstackclient:centos
docker build bootstrap/. --tag bootstrap:centos
