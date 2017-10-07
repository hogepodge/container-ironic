# Upload the Ironic agent images.
docker run --env-file ./config \
           --name ironic-agent \
            ironic-agent:centos
