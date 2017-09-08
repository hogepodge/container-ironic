docker build dnsmasq/. --tag dnsmasq:ipmi

docker build keystone/base/. --tag keystone-base:pike-centos
docker build keystone/api/. --tag keystone-api:pike-centos

docker build neutron/base/. --tag neutron-base:pike-centos
docker build neutron/database/. --tag neutron-database:pike-centos
docker build neutron/server/. --tag neutron-server:pike-centos
docker build neutron/linuxbridge-agent/. --tag neutron-linuxbridge-agent:pike-centos
docker build neutron/dhcp-agent/. --tag neutron-dhcp-agent:pike-centos
docker build neutron/metadata-agent/. --tag neutron-metadata-agent:pike-centos
docker build neutron/provider/. --tag neutron-provider:pike-centos

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
docker build ironic/agent/. --tag ironic-agent:pike-centos

docker build nova/base/. --tag nova-base:pike-centos
docker build nova/database/. --tag nova-database:pike-centos
docker build nova/api/. --tag nova-api:pike-centos
docker build nova/conductor/. --tag nova-conductor:pike-centos
docker build nova/scheduler/. --tag nova-scheduler:pike-centos
docker build nova/compute/. --tag nova-compute:pike-centos


docker build openstack-client/. --tag openstack-client:pike-centos
docker build service-endpoints/. --tag service-endpoints:pike-centos
