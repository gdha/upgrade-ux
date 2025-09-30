# 65_verify_nsswitch_conf.sh
# Verify if "mdns4_minimal" is present in the hosts: line. If yes, then abort upgrade-ux

[[ ! -f /etc/nsswitch.conf ]] && error "File /etc/nsswitch.conf is missong!"

grep hosts: /etc/nsswitch.conf | grep -q mdns4_minimal && error "Remove mdns4_minimal from hosts: line in /etc/nsswitch.conf"
