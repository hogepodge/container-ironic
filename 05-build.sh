docker build dnsmasq/. --tag dnsmasq:ipmi

docker build openstack-client/. --tag openstack-client:centos
docker build service-endpoints/. --tag service-endpoints:centos

docker build keystone/api/. --tag keystone-api:centos

docker build neutron/base/. --tag neutron-base:centos
docker build neutron/database/. --tag neutron-database:centos
docker build neutron/server/. --tag neutron-server:centos
docker build neutron/linuxbridge-agent/. --tag neutron-linuxbridge-agent:centos
docker build neutron/dhcp-agent/. --tag neutron-dhcp-agent:centos
docker build neutron/metadata-agent/. --tag neutron-metadata-agent:centos
docker build neutron/provider/. --tag neutron-provider:centos

docker build swift/base/. --tag swift-base:centos
docker build swift/config/. --tag swift-config:centos

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
docker build ironic/agent/. --tag ironic-agent:centos

docker build nova/base/. --tag nova-base:centos
docker build nova/database/. --tag nova-database:centos
docker build nova/api/. --tag nova-api:centos
docker build nova/conductor/. --tag nova-conductor:centos
docker build nova/scheduler/. --tag nova-scheduler:centos
docker build nova/compute/. --tag nova-compute:centos

