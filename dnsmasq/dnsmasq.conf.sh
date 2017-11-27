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

#dhcp-match=set:ipxe,175 # iPXE sends a 175 option.
#dhcp-boot=tag:!ipxe,/undionly.kpxe
#dhcp-boot=$BOOT_IPXE_ENDPOINT

dhcp-host=ac:1f:6b:12:64:10,192.168.20.11
dhcp-host=0c:c4:7a:ca:3a:4b,192.168.20.12
dhcp-host=0c:c4:7a:9a:3c:64,192.168.20.13
