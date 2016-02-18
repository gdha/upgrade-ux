# 66_save_ipfconf.sh

[[ ! -f /etc/rc.config.d/ipfconf ]] && return   # bundle B9901AA (or IPFilter) not installed

# save the original startup configuration file
cp -p /etc/rc.config.d/ipfconf   "$VAR_DIR/$DS/ipfconf.before"

# check "before" patching if ipfilter was already enabled:
if (( $(ch_rc -l -p IPF_START /etc/rc.config.d/ipfconf) )); then
    # IPF is enabled (must be done by user on purpose)
    LogPrint "WARNING: IP Filtering is enabled on system $HOSTNAME"
else
    LogPrint "IP Filtering is disabled on system $HOSTNAME"
    # make a script as "after" patching IPFilter gets enabled by default on HP-UX 11.23
    # we must turn it back off to avoid SG problems
    echo "/sbin/init.d/ipfboot stop"                            > "$VAR_DIR/$DS/ipf-fix.script"
    echo "ch_rc -a -p IPF_START=0 /etc/rc.config.d/ipfconf"    >> "$VAR_DIR/$DS/ipf-fix.script"
    echo "ch_rc -a -p IPMON_START=0 /etc/rc.config.d/ipfconf"  >> "$VAR_DIR/$DS/ipf-fix.script"
    echo "[[ -s /etc/opt/ipf/ipf.conf ]] && cp -p /etc/opt/ipf/ipf.conf /etc/opt/ipf/ipf.conf.\$(date +%Y%m%d)" >> "$VAR_DIR/$DS/ipf-fix.script"
    echo "[[ -s /etc/opt/ipf/ipf.conf ]] && > /etc/opt/ipf/ipf.conf" >> "$VAR_DIR/$DS/ipf-fix.script"
    chmod 755 "$VAR_DIR/$DS/ipf-fix.script"
    LogPrint "Created IPF fix script to be executed automatically after patching"
fi

# check the current activity with ipfstat and save this also
[[ -x /sbin/ipfstat ]] && /sbin/ipfstat 2>/dev/null >"$VAR_DIR/$DS/ipfstat.before"                # HP-UX 11.23/31

