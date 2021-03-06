#!/bin/bash
/generate.configs.sh
/initialize-keystone.sh
/initialize-neutron-database.sh
neutron-server \
    --config-file /etc/neutron/neutron.conf \
    --config-file /etc/neutron/plugins/ml2/ml2_conf.ini \
    --config-file /etc/neutron/plugins/ml2/linuxbridge_agent.ini \
    --config-file /etc/neutron/dhcp_agent.ini
