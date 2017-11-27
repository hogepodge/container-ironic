docker run \
    --rm \
    --env-file config \
    -it \
    -v $PWD/images:/images \
    openstack-client:centos bash
