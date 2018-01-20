FROM hogepodge/loci-ironic:pike-centos
MAINTAINER chris@openstack.org
EXPOSE 6385 3260 69 69/udp 8080 8080/udp
ADD /generate.ironic.conf /generate.ironic.conf
ADD /initialize-imagedata.sh /initialize-imagedata.sh
ADD /initialize-ironic-database.sh /initialize-ironic-database.sh
ADD /initialize-keystone.sh /initialize-keystone.sh
ADD /start-ironic-api.sh /start-ironic-api.sh
ADD /start-ironic-conductor.sh /start-ironic-conductor.sh
ADD /start-ironic-iscsid.sh /start-ironic-iscsid.sh
ADD /start-ironic-nginx.sh /start-ironic-nginx.sh
ADD /start-ironic-tftp.sh /start-ironic-tftp.sh
ADD /upload-agent.sh /upload-agent.sh
ADD /wait-for-it.sh /wait-for-it.sh
ADD /adminrc /adminrc
ADD /boot.ipxe /etc/ironic/boot.ipxe
ADD /nginx.conf /etc/nginx/nginx.conf
RUN yum update -y \
 && yum install -y qemu-img \
                   ipmi \
                   nginx \
                   gettext \
                   ipmitool \
                   psmisc \
                   graphviz \
                   iscsi-initiator-utils \
                   parted \
                   gdisk \
                   mariadb \
                   pip \
                   which \
                   tftp-server \
                   syslinux-tftp-boot \
                   xinetd \
                   ipxe-bootimgs \
                   nginx \
                   gcc \
                   python-devel \
                   wget \
                   curl \
 && yum install -y epel-release \
 && pip install --upgrade pip \
 && pip install python-openstackclient \
                python-swiftclient \
                python-ironicclient \
# && groupadd -g 42424 ironic  \
# && useradd -u 42424 -g ironic -M -d /var/lib/ironic -s /usr/sbin/nologin -c "ironic user" ironic \
 && mkdir /data \
 && mkdir /data/tmp \
 && mkdir /data/cache \
 && mkdir /data/httpboot \
 && mkdir /data/httpboot/pxelinux.cfg \
 && mkdir /data/httpboot/master_images \
 && mkdir /data/tftpboot \
 && mkdir /data/tftpboot/pxelinux.cfg \
 && mkdir /data/tftpboot/master_images \
 && yum clean all
COPY /httpboot /data/httpboot
COPY /tftpboot /data/tftpboot
