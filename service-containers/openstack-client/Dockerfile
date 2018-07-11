FROM centos:7
RUN yum update -y; \
    yum install -y gcc python-devel wget curl; \
    yum install -y epel-release; \
    yum install -y python-pip; \
    yum clean all; \
    pip install python-openstackclient python-ironicclient python-neutronclient
ADD /adminrc /adminrc
ADD /glancerc /glancerc
ADD /ironicrc /ironicrc
