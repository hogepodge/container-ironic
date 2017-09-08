#!/bin/bash
# Get the tinyipa images and upload to Glance

source /adminrc

curl -o tinyapi-stable-pike.tar.gz \
  http://tarballs.openstack.org/ironic-python-agent/tinyipa/tinyipa-stable-pike.tar.gz

tar -xvzf tinyapi-stable-pike.tar.gz

openstack image create \
  --shared \
  --id 11111111-1111-1111-1111-111111111110 \
  --disk-format aki \
  --container-format aki \
  --file tinyipa-stable-pike.vmlinuz \
  tinyipa.vmlinuz

openstack image create \
  --shared \
  --id 11111111-1111-1111-1111-111111111111 \
  --disk-format ari \
  --container-format ari \
  --file tinyipa-stable-pike.gz \
  tinyipa.ramdisk
