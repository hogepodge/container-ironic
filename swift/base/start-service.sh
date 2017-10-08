#!/bin/bash

set -x
memcached -u swift &
swift-account-server /etc/swift/account-server.conf -v &
swift-container-server /etc/swift/container-server.conf -v &
swift-object-server /etc/swift/object-server.conf -v &
swift-proxy-server /etc/swift/proxy-server.conf -v 
