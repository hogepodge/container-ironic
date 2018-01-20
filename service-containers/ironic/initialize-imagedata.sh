#!/bin/sh
set -x
mkdir -p /imagedata/httpboot
mkdir -p /imagedata/tftpboot
mkdir -p /imagedata/tmp
cp -r  /data/httpboot/* /imagedata/httpboot/.
cp -r  /data/tftpboot/* /imagedata/tftpboot/.
cp -r /var/lib/tftpboot/* /imagedata/tftpboot/.
cp /usr/share/ipxe/{undionly.kpxe,ipxe.efi} /imagedata/tftpboot
chown -R ironic:root /imagedata
