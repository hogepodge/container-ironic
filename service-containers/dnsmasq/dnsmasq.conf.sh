cat > /etc/dnsmasq.conf <<-EOF
# allow config volume for additional options
#conf-dir=/etc/dnsmasq.d

# explicitly declare which interfaces dnsmasq will run on
# this is to keep dnsmasq from competing with other
# dhcp and dns services on the public network
# the values below are for the out-of-band (oob) and data networks
interface=$IPMI_INTERFACE
bind-interfaces

# Assign the dhcp range for the oob and data networks
dhcp-range=$IPMI_RANGE

# Boot for Etherboot gPXE. The idea is to send two different
# filenames, the first loads gPXE, and the second tells gPXE what to
# load. The dhcp-match sets the gpxe tag for requests from gPXE.
dhcp-userclass=set:gpxe,"gPXE"
dhcp-boot=tag:gpxe,/ipxe.pxe

EOF

DHCP_HOST_ENTRIES=`env | grep  "DHCP_HOST_[0-9]\+" | sed 's/DHCP_HOST_[0-9]\+=//'`

cat >> /etc/dnsmasq.conf <<-EOF
${DHCP_HOST_ENTRIES}
EOF

cat /etc/dnsmasq.conf
