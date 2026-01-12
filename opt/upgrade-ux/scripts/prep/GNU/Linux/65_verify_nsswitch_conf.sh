# 65_verify_nsswitch_conf.sh
# Verify if "mdns4_minimal" is present in the hosts: line. If yes, then abort upgrade-ux

[[ ! -f /etc/nsswitch.conf ]] && error "File /etc/nsswitch.conf is missing!"

# The mdns_minimal module handles queries for the . local TLD only.
# Note the [NOTFOUND=return], which specifies that if mdns_minimal cannot find *. local,
# it will not continue to search for it in dns , myhostname , etc.
if [[ "$OS_MASTER_VENDOR" == "fedora" ]] ; then
    grep ^hosts: /etc/nsswitch.conf | grep -q mdns4_minimal && error "Remove the \"mdns4_minimal\" entry from hosts: line in /etc/nsswitch.conf"
fi
if [[ "$OS_MASTER_VENDOR" == "debian" ]] ; then
    grep ^hosts: /etc/nsswitch.conf | grep -q mdns4_minimal && LogPrint "WARNING: Found entry  \"mdns4_minimal\" on line \"hosts:\" in /etc/nsswitch.conf!
Please verify if this is correct."
fi
