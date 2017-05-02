# 38_save_satellite_info.sh

[[ ! -f /etc/sysconfig/rhn/systemid ]] && return   # no RH Satellite subscription; nothing to do

# save a copy of the Satellite systemid file
cp -p /etc/sysconfig/rhn/systemid "$VAR_DIR/$DS/systemid.before"

# Show the current Satellite Channel to which we are subscribed
rhn-channel -b > "$VAR_DIR/$DS/satellite.subscribed.channel"
