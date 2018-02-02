#!/bin/bash

/initialize-imagedata.sh

# Ironic needs everything, so wait for everything

# Glance 
until $(curl --output /dev/null --silent --head http://${CONTROL_HOST_IP}:9292); do
    printf '.'
    sleep 5
done

# Swift 
until $(curl --output /dev/null --silent --head http://${CONTROL_HOST_IP}:8888); do
    printf '.'
    sleep 5
done

# Neutron
until $(curl --output /dev/null --silent --head http://${CONTROL_HOST_IP}:9696); do
    printf '.'
    sleep 5
done

/initialize-keystone.sh
/initialize-ironic-database.sh
/assign-temp-url-key.sh

/upload-agent.sh

ironic-api
