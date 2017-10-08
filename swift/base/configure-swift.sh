#!/bin/bash

set -x
chown -R swift:swift /srv/node
/generate.swift-account-server.conf
/generate.swift-container-server.conf
/generate.swift-object-server.conf
/generate.swift-proxy-server.conf
/generate.rsyncd.conf
/generate.account-ring
/generate.container-ring
/generate.object-ring
