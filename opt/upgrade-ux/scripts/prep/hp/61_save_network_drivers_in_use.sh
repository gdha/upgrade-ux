# 61_save_network_drivers_in_use.sh

[[ ! -x /usr/sbin/nwmgr ]]  &&  return   # must be HP-UX 11.31

[[ -f "$VAR_DIR/$DS/network.drivers" ]]  &&  return  # we already have the list

/usr/sbin/nwmgr  | grep UP | grep -v hp_apa | awk '{print $4}' | sort -u > "$VAR_DIR/$DS/network.drivers"

