#!/bin/bash
/initialize-imagedata.sh
/initialize-ironic-database.sh
/initialize-keystone.sh
/generate.ironic.conf
ironic-api
