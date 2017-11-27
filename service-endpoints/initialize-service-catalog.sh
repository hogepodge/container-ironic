#!/bin/bash

function create_service_user() {
  SERVICE_NAME="$1"
  SERVICE_PASSWORD="$2"
  openstack user create --password ${SERVICE_PASSWORD} ${SERVICE_NAME}
  openstack role add --user ${SERVICE_NAME} --project service admin
}

function create_service() {
  SERVICE_NAME="$1"
  SERVICE_TYPE="$2"
  SERVICE_DESCRIPTION="$3"

  openstack service create --name ${SERVICE_NAME} \
                           --description ${SERVICE_DESCRIPTION} \
                           ${SERVICE_TYPE}
}

function create_service_endpoint() {
  SERVICE_TYPE="$1"
  ENDPOINT_TYPE="$2"
  ENDPOINT="$3" 
  REGION="$4"

  openstack endpoint create --region ${REGION} \
                            ${SERVICE_TYPE} \
                            ${ENDPOINT_TYPE} \
                            ${ENDPOINT}
}

function initialize_service() {
  SERVICE_NAME="$1"
  SERVICE_TYPE="$2"
  SERVICE_DESCRIPTION="$3"
  SERVICE_PASSWORD="$4"
  PUBLIC_ENDPOINT="$5"
  INTERNAL_ENDPOINT="$6"
  ADMIN_ENDPOINT="$7"
  REGION="$8"

  create_service_user ${SERVICE_NAME} ${SERVICE_PASSWORD}
  create_service ${SERVICE_NAME} ${SERVICE_TYPE} ${SERVICE_DESCRIPTION}
  create_service_endpoint ${SERVICE_TYPE} public ${PUBLIC_ENDPOINT} ${REGION}
  create_service_endpoint ${SERVICE_TYPE} internal ${INTERNAL_ENDPOINT} ${REGION}
  create_service_endpoint ${SERVICE_TYPE} admin ${ADMIN_ENDPOINT} ${REGION}
}

export OS_USERNAME=admin
export OS_PASSWORD=${KEYSTONE_ADMIN_PASSWORD}
export OS_TENANT_NAME=admin
export OS_AUTH_URL=http://${CONTROL_HOST_IP}:5000/v3
export OS_REGION_NAME=RegionOne
export OS_IDENTITY_API_VERSION=3

openstack project create service --description "General service project"

initialize_service "neutron" \
                   "network" \
                   "OpenStack Networking Service" \
                   ${SERVICE_PASSWORD} \
                   http://${CONTROL_HOST_IP}:9696 \
                   http://${CONTROL_HOST_PRIVATE_IP}:9696 \
                   http://${CONTROL_HOST_PRIVATE_IP}:9696 \
                   "RegionOne"

initialize_service "swift" \
                   "object-store" \
                   "OpenStack Object Storage" \
                   ${SERVICE_PASSWORD} \
                   http://${CONTROL_HOST_IP}:8888/v1/AUTH_%\(tenant_id\)s \
                   http://${CONTROL_HOST_PRIVATE_IP}:8888/v1/AUTH_%\(tenant_id\)s \
                   http://${CONTROL_HOST_PRIVATE_IP}:8888 \
                   "RegionOne"


initialize_service "glance" \
                   "image" \
                   "OpenStack Image Service" \
                   ${SERVICE_PASSWORD} \
                   http://${CONTROL_HOST_IP}:9292 \
                   http://${CONTROL_HOST_PRIVATE_IP}:9292 \
                   http://${CONTROL_HOST_PRIVATE_IP}:9292 \
                   "RegionOne"

initialize_service "nova" \
                   "compute" \
                   "OpenStack Compute Service" \
                   ${SERVICE_PASSWORD} \
                   http://${CONTROL_HOST_IP}:8774/v2.1 \
                   http://${CONTROL_HOST_PRIVATE_IP}:8774/v2.1 \
                   http://${CONTROL_HOST_PRIVATE_IP}:8774/v2.1 \
                   "RegionOne"

initialize_service "placement" \
                   "placement" \
                   "OpenStack Placement Service" \
                   ${SERVICE_PASSWORD} \
                   http://${CONTROL_HOST_IP}:8778 \
                   http://${CONTROL_HOST_PRIVATE_IP}:8778 \
                   http://${CONTROL_HOST_PRIVATE_IP}:8778 \
                   "RegionOne"

initialize_service "ironic" \
                   "baremetal" \
                   "OpenStack Bare Metal Service" \
                   ${SERVICE_PASSWORD} \
                   http://${CONTROL_HOST_IP}:6385 \
                   http://${CONTROL_HOST_PRIVATE_IP}:6385 \
                   http://${CONTROL_HOST_PRIVATE_IP}:6385 \
                   "RegionOne"

