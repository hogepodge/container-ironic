FROM openstack-client:centos
ADD /wait-for-it.sh /wait-for-it.sh
ADD /upload-agent.sh /upload-agent.sh
RUN yum install -y which curl
ENTRYPOINT ["/wait-for-it.sh", "control:9292", "-t", "30", "--", "/upload-agent.sh"]
