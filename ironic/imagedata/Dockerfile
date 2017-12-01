FROM centos:7
MAINTAINER chris@openstack.org
RUN yum update -y  \
 && yum install -y tftp-server syslinux-tftpboot xinetd ipxe-bootimgs \
 && groupadd -g 42424 ironic  \
 && useradd -u 42424 -g ironic -M -d /var/lib/ironic -s /usr/sbin/nologin -c "ironic user" ironic \
 && mkdir /data \
 && mkdir /data/tmp \
 && mkdir /data/cache \
 && mkdir /data/httpboot \
 && mkdir /data/httpboot/pxelinux.cfg \
 && mkdir /data/httpboot/master_images \
 && mkdir /data/tftpboot \
 && mkdir /data/tftpboot/pxelinux.cfg \
 && mkdir /data/tftpboot/master_images

COPY /httpboot /data/httpboot
COPY /tftpboot /data/tftpboot


ADD /initialize-imagedata.sh /initialize-imagedata.sh
ENTRYPOINT ["/initialize-imagedata.sh"]
