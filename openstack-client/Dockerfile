FROM centos:7
RUN yum update -y; \
    yum install -y gcc python-devel; \
    yum install -y epel-release; \
    yum install -y python-pip; \
    yum clean all; \
    pip install --upgrade pip; \
    pip install python-openstackclient
ADD /adminrc /adminrc
