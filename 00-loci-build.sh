#/bin/bash
set -x
cd /tmp

STABLE=
OPENSTACK_RELEASE=master
IMAGE_DISTRO=centos
REPOSITORY=hogepodge

function loci_reqs_build () {
  git clone https://github.com/openstack/loci-requirements ./loci-requirements
  docker build --build-arg PROJECT_REF=${STABLE}${OPENSTACK_RELEASE} \
               --tag ${REPOSITORY}/loci-requirements:${OPENSTACK_RELEASE}-${IMAGE_DISTRO} ./loci-requirements/${IMAGE_DISTRO}/
  docker push ${REPOSITORY}/loci-requirements:${OPENSTACK_RELEASE}-${IMAGE_DISTRO}
}

function loci_build () {
    PROJECT="$1"
    LOCIREPO="$2"
    git clone https://github.com/${LOCIREPO}/loci-${PROJECT} ./loci-${PROJECT}
    docker build --build-arg PROJECT_REF=${STABLE}${OPENSTACK_RELEASE} \
                 --build-arg WHEELS=${REPOSITORY}/loci-requirements:${OPENSTACK_RELEASE}-${IMAGE_DISTRO} \
                 --tag ${REPOSITORY}/loci-${PROJECT}:${OPENSTACK_RELEASE}-${IMAGE_DISTRO} ./loci-${PROJECT}/${IMAGE_DISTRO}/
    docker tag ${REPOSITORY}/loci-${PROJECT}:${OPENSTACK_RELEASE}-${IMAGE_DISTRO} ${REPOSITORY}/loci-${PROJECT}:${OPENSTACK_RELEASE}-${IMAGE_DISTRO}
    docker push ${REPOSITORY}/loci-${PROJECT}:${OPENSTACK_RELEASE}-${IMAGE_DISTRO}
}


loci_reqs_build

loci_build keystone openstack
loci_build glance openstack
loci_build nova openstack
loci_build neutron openstack
loci_build cinder openstack
loci_build ironic openstack
