build = docker build
push = docker push hogepodge/

##### LOCI Build
# Begin by building the Loci packages and pushing them to Docker Hub.
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
	git clone https://git.openstack.org/openstack/loci.git /tmp/loci
	$(build) -t hogepodge/base:centos /tmp/loci/dockerfiles/centos
	$(push)/base:centos

$(LOCI_PROJECTS):
	$(build) https://git.openstack.org/openstack/loci.git \
		--build-arg PROJECT=$@ \
		--build-arg PROJECT_REF=stable/pike \
		--build-arg FROM=hogepodge/base:centos \
		--build-arg WHEELS=hogepodge/requirements:centos \
		--tag hogepodge/$@:centos --no-cache
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
