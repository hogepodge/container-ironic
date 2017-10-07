#/bin/bash
set -x
cd /tmp

function base_build () {
   rm -rf /tmp/loci
   git clone https://github.com/openstack/loci.git /tmp/loci
   docker build /tmp/loci/dockerfiles/centos \
                --tag hogepodge/openstackbase:centos
   docker push hogepodge/openstackbase:centos
}

function loci_build () {
    PROJECT="$1"
    docker build /tmp/loci \
                 --tag hogepodge/${PROJECT}:centos \
                 --build-arg FROM=hogepodge/openstackbase:centos \
                 --build-arg DISTRO=centos \
                 --build-arg PROJECT=${PROJECT} \
                 --build-arg WHEELS=hogepodge/requirements:centos --no-cache
    docker push hogepodge/${PROJECT}:centos
    # https://github.com/openstack/loci.git \
}

#base_build
#loci_build requirements
#loci_build keystone
loci_build glance openstack
loci_build nova openstack
loci_build neutron openstack
loci_build cinder openstack
loci_build ironic openstack
