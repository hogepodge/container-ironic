#!/bin/bash
/generate.configs.sh
until $(curl --output /dev/null --silent --head --insecure http://${CONTROL_HOST_IP}:9696); do
    printf 'wait on swift'
    sleep 5
done
neutron-metadata-agent \
    --config-file /etc/neutron/neutron.conf \
    --config-file /etc/neutron/plugins/ml2/ml2_conf.ini \
    --config-file /etc/neutron/plugins/ml2/linuxbridge_agent.ini \
    --config-file /etc/neutron/dhcp_agent.ini \
    --config-file /etc/neutron/metadata_agent.ini
