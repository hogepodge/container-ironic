#!/bin/bash
set -x
truncate -s 50G swift-storage
mkfs.xfs swift-storage
sudo LOOPDEVICE=`losetup --show -f swift-storage`

