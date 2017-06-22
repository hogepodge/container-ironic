# Initialize the service endpoints.
# This container script is not idempotent, so run it only once!
docker run --env-file ./config \
           --name service-endpoints \
           --link keystone:keystone \
            service-endpoints:centos
