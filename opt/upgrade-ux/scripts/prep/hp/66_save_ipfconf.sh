# 66_save_ipfconf.sh

[[ ! -f /etc/rc.config.d/ipfconf ]] && return   # bundle B9901AA (IPF) not installed

# save the original startup configuration file
cp -p /etc/rc.config.d/ipfconf   "$VAR_DIR/$DS/ipfconf.before"

# check if before patching ipf is enabled:
if (( $(ch_rc -l -p IPF_START /etc/rc.config.d/ipfconf) )); then
    # IPF is enabled
    LogPrint "WARNING: IP Filtering is enabled on system $lhost"
else
    LogPrint "IP Filtering is disabled on system $lhost"
    # make a mark of this fact as after patching is gets enabled by default on HP-UX 11.23
    # we must turn it back off to avoid SG panics
    echo "/sbin/init.d/ipfboot stop"                            > "$VAR_DIR/$DS/ipf-fix.script"
    echo "ch_rc -a -p IPF_START=0 /etc/rc.config.d/ipfconf"    >> "$VAR_DIR/$DS/ipf-fix.script"
    echo "ch_rc -a -p IPMON_START=0 /etc/rc.config.d/ipfconf"  >> "$VAR_DIR/$DS/ipf-fix.script"
    chmod 755 "$VAR_DIR/$DS/ipf-fix.script"
    LogPrint "Created IPF fix script to be executed automatically after patching"
fi

# check the current activity with ipfstat and save this also
[[ ! -x /sbin/ipfstat ]] && return  # cannot save output

/sbin/ipfstat > "$VAR_DIR/$DS/ipfstat.before"
