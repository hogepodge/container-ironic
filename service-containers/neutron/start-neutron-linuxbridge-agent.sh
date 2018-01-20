#!/bin/bash
set -x
/generate.configs.sh
until $(curl --output /dev/null --silent --head http://${CONTROL_HOST_IP}:9696); do
    printf 'wait on Neutron API'
    sleep 5
done
/initialize-provider-network.sh
neutron-linuxbridge-agent \
    --config-file /etc/neutron/neutron.conf \
    --config-file /etc/neutron/plugins/ml2/ml2_conf.ini \
    --config-file /etc/neutron/plugins/ml2/linuxbridge_agent.ini \
    --config-file /etc/neutron/dhcp_agent.ini
