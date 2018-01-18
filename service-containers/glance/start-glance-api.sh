#!/bin/bash
set -x
/initialize-keystone.sh
/initialize-glance.sh
glance-api
