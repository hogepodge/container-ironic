#!/bin/bash
source /adminrc
openstack network create --share --provider-physical-network provider \
  --provider-network-type flat provider1
openstack subnet create --subnet-range ${PROVIDER_SUBNET} \
                        --gateway ${PROVIDER_GATEWAY} \
                        --network provider1 \
                        --allocation-pool start=${PROVIDER_POOL_START},end=${PROVIDER_POOL_END} \
                        --dns-nameserver ${PROVIDER_DNS_NAMESERVER} \
                        provider1-v4
