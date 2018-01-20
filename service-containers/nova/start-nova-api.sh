#!/bin/bash
/initialize-nova-database.sh
/initialize-keystone.sh
nova-api
