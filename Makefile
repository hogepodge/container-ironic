

build = docker build

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
