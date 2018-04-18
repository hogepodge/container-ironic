docker run \
    --rm \
    --env-file config \
    -it \
    -v $PWD/images:/images \
    hogepodge/openstack-client:pike-centos bash
