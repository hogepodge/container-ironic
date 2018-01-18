#!/bin/bash
set -x
/generate.glance-api.conf
/generate.glance-registry.conf
/generate.glance-swift.conf
/initialize-glance-database.sh
