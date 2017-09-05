# Initialize the Neutron provider network 
# This container script is not idempotent, so run it only once!
docker run --env-file ./config \
           --name neutron-provider \
           --link keystone:keystone \
            neutron-provider:pike-centos
