#### Required environment variables
# DOCKERHUB_NAMESPACE: the name of the dockerhub repository to push images to
#
####

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

##### LOCI Build
# Building the Loci packages and push them to Docker Hub.
#
# make loci: build and push all of the Loci images
#####

LOCI_PROJECTS = requirements \
				cinder \
				glance \
				heat \
				horizon \
				ironic \
				keystone \
				neutron \
				nova \
				swift \

loci-build-base:
	rm -rf /tmp/loci
	git clone https://git.openstack.org/openstack/loci.git /tmp/loci
	$(build) -t $(DOCKERHUB_NAMESPACE)/base:centos /tmp/loci/dockerfiles/centos
	$(push)/base:centos

$(LOCI_PROJECTS):
	$(build) https://git.openstack.org/openstack/loci.git \
		--build-arg PROJECT=$@ \
		--build-arg PROJECT_REF=stable/pike \
		--build-arg FROM=$(DOCKERHUB_NAMESPACE)/base:centos \
		--build-arg WHEELS=$(DOCKERHUB_NAMESPACE)/requirements:centos \
		--tag $(DOCKERHUB_NAMESPACE)/$@:centos --no-cache
	$(push)/$@:centos

loci: loci-build-base $(LOCI_PROJECTS)


KEYSTONE_TARGETS = keystone-api
keystone: $(KEYSTONE_TARGETS)

NEUTRON_TARGETS = neutron-base \
				  neutron-database \
				  neutron-server \
				  neutron-linuxbridge_agent \
				  neutron-dhcp_agent \
				  neutron-metadata_agent \
				  neutron-provider
neutron: $(NEUTRON_TARGETS)

SWIFT_TARGETS = swift-base
swift: $(SWIFT_TARGETS)

GLANCE_TARGETS = glance-base \
				 glance-database \
				 glance-api \
				 glance-registry
glance: $(GLANCE_TARGETS)

IRONIC_TARGETS = ironic-base \
				 ironic-database \
				 ironic-api \
				 ironic-iscsi \
				 ironic-conductor \
				 ironic-imagedata \
				 ironic-tftp \
				 ironic-nginx \
				 ironic-agent
ironic: $(IRONIC_TARGETS)

NOVA_TARGETS = nova-base \
			   nova-database \
			   nova-api \
			   nova-conductor \
			   nova-scheduler \
			   nova-compute \
			   nova-placement

TARGETS = $(KEYSTONE_TARGETS)
TARGETS += $(NEUTRON_TARGETS)
TARGETS += $(SWIFT_TARGETS)
TARGETS += $(GLANCE_TARGETS)
TARGETS += $(IRONIC_TARGETS)
TARGETS += $(NOVA_TARGETS)

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
