#!/bin/bash
# Get the tinyipa images and upload to Glance

set -x

source /adminrc

curl -o tinyapi-stable-queens.tar.gz \
  http://tarballs.openstack.org/ironic-python-agent/tinyipa/tinyipa-stable-queens.tar.gz

tar -xvzf tinyapi-stable-queens.tar.gz

openstack image create \
  --shared \
  --id 11111111-1111-1111-1111-111111111110 \
  --disk-format aki \
  --container-format aki \
  --file tinyipa-stable-queens.vmlinuz \
  tinyipa.vmlinuz

openstack image create \
  --shared \
  --id 11111111-1111-1111-1111-111111111111 \
  --disk-format ari \
  --container-format ari \
  --file tinyipa-stable-queens.gz \
  tinyipa.ramdisk

rm tinyipa-stable-queens.vmlinuz tinyipa-stable-queens.gz tinyapi-stable-queens.tar.gz
