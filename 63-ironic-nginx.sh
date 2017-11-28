# Starts the nginx service, serving data from the previously initialized
# imagedata volume.
docker run -d \
           -v ironic-imagedata-volume:/imagedata \
           --name ironic-nginx \
           --rm \
           -p 8080:8080 \
           ironic-nginx
