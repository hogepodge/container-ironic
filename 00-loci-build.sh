#/bin/bash
set -x

SUCCESS = []
FAILURE = []

git clone https://git.openstack.org/openstack/loci.git /tmp/loci
cd /tmp/loci
docker build -t hogepodge/base:centos dockerfiles/centos
docker push hogepodge/base:centos

PROJECTS=("requirements" "cinder" "glance" "heat" "horizon" "ironic" "keystone" "neutron" "nova" "swift")

for project in "${PROJECTS[@]}"
do
  result = docker build \
      https://git.openstack.org/openstack/loci.git \
      --build-arg PROJECT=$project \
      --build-arg FROM=hogepodge/base:centos \
      --build-arg WHEELS=hogepodge/requirements:centos \
      --tag hogepodge/$project:centos

  if $result -eq 1; then
      SUCCESS=("${SUCCESS[@]}" $project)
      docker push hogepodge/$project:centos
  else
      FAILURE=("${FAILURE[@]}" $project)
  fi
done

echo "success"
echo $SUCCESS
echo "failure"
echo $FAILURE
