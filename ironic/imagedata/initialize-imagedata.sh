#!/bin/sh
mkdir -p /imagedata/httpboot
mkdir -p /imagedata/tftpboot
cp -r  /data/httpboot/* /imagedata/httpboot/.
cp -r  /data/tftpboot/* /imagedata/tftpboot/.
chown -R ironic:root /imagedata
