# 38_save_satellite_info.sh

# We assume there is no rhn satellite subscription to start with
rhn_satellite_subscription=0

[[ ! -f /etc/sysconfig/rhn/systemid ]] && return   # no RH Satellite subscription; nothing to do

# save a copy of the Satellite systemid file
cp -p /etc/sysconfig/rhn/systemid "$VAR_DIR/$DS/systemid.rhn"

# Show the current Satellite Channel to which we are subscribed and set rhn_satellite_subscription=1
rhn-channel -b > "$VAR_DIR/$DS/satellite.subscribed.channel.before" && rhn_satellite_subscription=1
