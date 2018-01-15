#!/bin/bash
set -x
/generate.glance-api.conf
/generate.glance-registry.conf
/generate.glance-swift.conf
/initialize-keystone.sh
/initialize-glance-database.sh
