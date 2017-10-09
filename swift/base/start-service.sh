#!/bin/bash
set -x
if [ -e /srv/account.builder ]; then
  echo "Ring files already exist in /srv, copying them to /etc/swift..."
  cp /srv/*.builder /etc/swift/
  cp /srv/*.gz /etc/swift/
fi

if [ ! -e /srv/node ]; then
  mkdir /srv/node
fi

chown -R swift:swift /srv

if [ ! -e /etc/swift/account.builder ]; then
  cd /etc/swift

  echo "No existing ring files, creating them..."

  swift-ring-builder object.builder create 7 1 1
  swift-ring-builder object.builder add 172.16.16.16:6010/sdb1 1
  swift-ring-builder object.builder rebalance

  swift-ring-builder container.builder create 7 1 1
  swift-ring-builder container.builder add 172.16.16.16:6011/sdb1 1
  swift-ring-builder container.builder rebalance

  swift-ring-builder account.builder create 7 1 1
  swift-ring-builder account.builder add r1z1-127.0.0.1:6012/sdb1 1
  swift-ring-builder account.builder rebalance

  echo "Copying ring files to /srv to save them if it's a docker volume..."
  cp *.gz /srv
  cp *.builder /srv
fi

if [ ! -z "${SWIFT_USER_PASSWORD}" ]; then
    echo "Setting passwords in /etc/swift/proxy-server.conf"
    PASS=`pwgen 12 1`
    sed -i -e "s/user_admin_admin = admin .admin .reseller_admin/user_admin_admin = ${SWIFT_USER_PASSWORD} .admin .reseller_admin/g" /etc/swift/proxy-server.conf
    sed -i -e "s/user_test_tester = testing .admin/user_test_tester = ${SWIFT_USER_PASSWORD} .admin/g" /etc/swift/proxy-server.conf
    sed -i -e "s/user_test2_tester2 = testing2 .admin/user_test2_tester2 = ${SWIFT_USER_PASSWORD} .admin/g" /etc/swift/proxy-server.conf
    sed -i -e "s/user_test_tester3 = testing3/user_test_tester3 = ${SWIFT_USER_PASSWORD}/g" /etc/swift/proxy-server.conf
    grep "user_test" /etc/swift/proxy-server.conf
fi

echo "Starting supervisord..."
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

sleep 3

echo "Starting to tail /var/log/syslog...(hit ctrl-c if you are starting the container in a bash shell)"

tail -n 0 -f /var/log/syslog
