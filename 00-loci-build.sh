#/bin/bash
set -x

git clone https://git.openstack.org/openstack/loci.git /tmp/loci
cd /tmp/loci
docker build -t hogepodge/base:centos dockerfiles/centos
docker push hogepodge/base:centos

PROJECTS=("requirements" "cinder" "glance" "heat" "horizon" "ironic" "keystone" "neutron" "nova" "swift")

for project in "${PROJECTS[@]}"
do
  docker build \
      https://git.openstack.org/openstack/loci.git \
      --build-arg PROJECT=$project \
      --build-arg FROM=hogepodge/base:centos \
      --build-arg WHEELS=hogepodge/requirements:centos \
      --tag hogepodge/$project:centos
  docker push hogepodge/$project:centos
done

