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
					 service-ironic

$(SERVICE_CONTAINERS):
	$(build) --tag $(DOCKERHUB_NAMESPACE)/$@:$(OPENSTACK_RELEASE)-centos \
		service-containers/$(subst service-,$(EMPTY),$@)

NOVA_TARGETS = nova-base \
			   nova-database \
			   nova-api \
			   nova-conductor \
			   nova-scheduler \
			   nova-compute \
			   nova-placement

TARGETS = $(NOVA_TARGETS)

all: $(TARGETS)

$(TARGETS):
	$(build) $(subst _,-,$(subst -,/,$@)) --tag $@:centos

##### Base Services
# Commands to start the base services
#
# make start-base-services : starts all of the base services
# make start-rabbitmq
# make start-mariadb
#
# make stop-base-services : stops all of the base services
# make stop-rabbitmq
# make stop-mariadb
#
# make clean-base-services : stops and cleans all base service data
# make clean-mariadb

start-base-services: start-rabbitmq start-mariadb

stop-base-services: stop-rabbitmq stop-mariadb

clean-base-services: clean-mariadb clean-rabbitmq

start-rabbitmq:
	$(run) -d \
		--env-file ./config \
		--hostname control \
		--name rabbitmq \
		--restart unless-stopped \
		-p=5672:5672 \
		rabbitmq:3

stop-rabbitmq:
	$(stop) rabbitmq

clean-rabbitmq: stop-rabbitmq
	$(remove) rabbitmq

start-mariadb:
	docker volume create --name mariadb-volume
	$(run) -d \
		-v mariadb-volume:/var/lib/mysql \
        --env-file ./config \
        --hostname mariadb \
        --name mariadb \
        --restart unless-stopped \
        -p=3306:3306 \
        mariadb:10.1.22 --max-connections=2000

stop-mariadb:
	$(stop) mariadb

clean-mariadb: stop-mariadb
	$(remove) mariadb
	docker volume rm mariadb-volume

build-dnsmasq:
	$(build) dnsmasq/. --tag dnsmasq:ipmi

start-dnsmasq:
	$(run) -d \
		--env-file ./config \
        --name dnsmasq-ipmi \
        -p 53:53 \
        -p 53:53/udp \
        --cap-add=NET_ADMIN \
        --net=host \
        dnsmasq:ipmi

stop-dnsmasq:
	$(stop) dnsmasq-ipmi

clean-dnsmasq: stop-dnsmasq
	$(remove) dnsmasq-ipmi
