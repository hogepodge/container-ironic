#### Required environment variables
# DOCKERHUB_NAMESPACE: the name of the dockerhub repository to push images to
#
####

OPENSTACK_RELEASE=pike
DOCKERHUB_NAMESPACE=hogepodge
EMPTY:=

build = docker build
run = docker run
push = docker push $(DOCKERHUB_NAMESPACE)
stop = docker stop
remove = docker rm

##### Kernel Modules
# Load kernel modules necessary for Cinder and Neutron
#
# make kernel-modules
#####

kernel-modules:
	sudo modprobe iscsi_tcp
	sudo modprobe ip6_tables
	sudo modprobe ebtables

##### Swift Storage Directory
# Make the loopback device to hold swift storage data
#
# Assumption is that loop0 is the device this lands on
#
# make swift-storage 
####

swift-storage:
	truncate -s 50G swift-storage
	mkfs.xfs swift-storage
	sudo LOOPDEVICE=`losetup --show -f swift-storage`

##### Loci Containers
# Building the Loci packages and push them to Docker Hub.
#
# make loci: build and push all of the Loci images
#####

LOCI_PROJECTS = loci-requirements \
				loci-cinder \
				loci-glance \
				loci-heat \
				loci-horizon \
				loci-ironic \
				loci-keystone \
				loci-neutron \
				loci-nova \
				loci-swift \

loci-build-base:
	rm -rf /tmp/loci
	git clone https://git.openstack.org/openstack/loci.git /tmp/loci
	$(build) -t $(DOCKERHUB_NAMESPACE)/base:centos /tmp/loci/dockerfiles/centos
	$(push)/base:centos

$(LOCI_PROJECTS):
	$(build) https://git.openstack.org/openstack/loci.git \
		--build-arg PROJECT=$(subst loci-,$(EMPTY),$@) \
		--build-arg PROJECT_REF=stable/$(OPENSTACK_RELEASE) \
		--build-arg FROM=$(DOCKERHUB_NAMESPACE)/base:centos \
		--build-arg WHEELS=$(DOCKERHUB_NAMESPACE)/loci-requirements:$(OPENSTACK_RELEASE)-centos \
		--tag $(DOCKERHUB_NAMESPACE)/$@:$(OPENSTACK_RELEASE)-centos --no-cache
	$(push)/$@:$(OPENSTACK_RELEASE)-centos

loci: loci-build-base $(LOCI_PROJECTS)

#### Service Containers
# Building the all-in-one service containers with configuration and startup scripts
#
# make service-containers
####

SERVICE_CONTAINERS = service-keystone \
					 service-glance \
					 service-swift \
					 service-neutron \
					 service-ironic \
					 service-nova 

$(SERVICE_CONTAINERS):
	$(build) --tag $(DOCKERHUB_NAMESPACE)/$@:$(OPENSTACK_RELEASE)-centos \
		service-containers/$(subst service-,$(EMPTY),$@)
