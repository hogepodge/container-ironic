#!/bin/bash
set -x
cp -R /var/lib/openstack/etc/neutron /etc/neutron
/generate.linuxbridge_agent.ini
/generate.neutron.conf
/generate.metadata_agent.ini
