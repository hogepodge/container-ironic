#!/bin/bash
/generate.configs.sh
neutron-metadata-agent \
    --config-file /etc/neutron/neutron.conf \
    --config-file /etc/neutron/plugins/ml2/ml2_conf.ini \
    --config-file /etc/neutron/plugins/ml2/linuxbridge_agent.ini \
    --config-file /ets/neutron/dhcp_agent.ini \
    --config-file /etc/neutron/metadata_agent.ini
