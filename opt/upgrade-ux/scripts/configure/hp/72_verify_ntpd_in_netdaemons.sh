# 72_verify_ntpd_in_netdaemons.sh
# This is for HP-UX 11.31 only - see issue #56 and #65
# Before patching NTP version is 11.31 and after patching it becomes C.4.2.6.7.0
# In fact it is NOT a problem of patching, but OVO osspi script is still looking
# for xntpd daemon running or not and after patching the daemons is ntpd
# which results in many OVO alerts saying xntpd is not running (it is of course)
#
# After discussing this with the teams we decided it would be better that the name
# xntpd would be visible in the process tables and that can be easily fixed.

[[ "$OS_VERSION"  != "11.31" ]]  && return   # no need to check

[[ ! -f "$VAR_DIR/$DS/netdaemons.before" ]]  && cp -p /etc/rc.config.d/netdaemons  "$VAR_DIR/$DS/netdaemons.before"

# is the following test conclusive enough?
if [[ "$(ch_rc -l -p XNTPD_NAME $VAR_DIR/$DS/netdaemons.before)"  =  "xntpd" ]] ; then
    Log "Found XNTPD_NAME=xntpd in /etc/rc.config.d/netdaemons [OK]"
    return
fi

if (( PREVIEW )) ; then
    Log "Entry XNTPD_NAME=ntpd needs to become XNTPD_NAME=xntpd in /etc/rc.config.d/netdaemons [not in preview mode]"
else
    Log "By restarting the ntdp the XNTPD_NAME entry will be automatically added to /etc/rc.config.d/netdaemons"
    /sbin/init.d/ntpd stop >&2
    # by adding the option xntpd we tell the start-up script to start xntpd instead of ntpd
    # but still it will add a line "export XNTPD_NAME=ntpd" in the netdaemons file
    /sbin/init.d/ntpd start >&2
    # And, the /etc/rc.config.d/netdaemons file will be modified by the daemon itself (maybe)
    # Replace the 'XNTPD_NAME=ntpd' by 'XNTPD_NAME=xntpd' with sed (we trust this tool better)
    Log "Modify keyword 'XNTPD_NAME=ntpd' into 'XNTPD_NAME=xntpd' in $VAR_DIR/$DS/netdaemons.after"
    sed -e 's/XNTPD_NAME=ntpd/XNTPD_NAME=xntpd/g' < /etc/rc.config.d/netdaemons >"$VAR_DIR/$DS/netdaemons.after"
    Log "Copy $VAR_DIR/$DS/netdaemons.after to /etc/rc.config.d/netdaemons"
    cp "$VAR_DIR/$DS/netdaemons.after" /etc/rc.config.d/netdaemons
    chown bin:bin /etc/rc.config.d/netdaemons
    chmod 444 /etc/rc.config.d/netdaemons
fi

Log "NTP daemon name currenly running is:"
ps -ef|grep ntpd|grep -vE '(grep|ntpd_in_netdaemons)' >&2

if (( PREVIEW )) ; then
    cp -p /etc/rc.config.d/netdaemons "$VAR_DIR/$DS/netdaemons.after"
    Log "Copy /etc/rc.config.d/netdaemons to $VAR_DIR/$DS/netdaemons.after"
else
    Log "Restarting the ntpd process (again):"
    /sbin/init.d/ntpd stop >&2
    /sbin/init.d/ntpd start >&2
    Log "NTP daemon name after restart is:"
    ps -ef|grep ntpd|grep -vE '(grep|ntpd_in_netdaemons)' >&2
fi

cmp -s "$VAR_DIR/$DS/netdaemons.after" "$VAR_DIR/$DS/netdaemons.before"
if (( $? == 1 )); then
    Log "The following was modified in $VAR_DIR/$DS/netdaemons.after:" >&2
    sdiff -s "$VAR_DIR/$DS/netdaemons.after" "$VAR_DIR/$DS/netdaemons.before"  >&2
fi
