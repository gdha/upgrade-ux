# 72_verify_ntpd_in_netdaemons.sh
# This is for HP-UX 11.31 only - see issue #56
# Before patching NTP version is 11.31 and after patching it becomes C.4.2.6.7.0
# In fact it is NOT a problem of patching, but OVO osspi script is still looking
# for xntpd daemon running or not and after patching the daemons is ntpd
# which results in many OVO alerts saying xntpd is not running (it is of course)
#
# After discussing this with the teams we decided it would be better that the name
# xntpd would be visible in the process tables and that can be easily fixed.

[[ "$OS_VERSION"  != "11.31" ]]  && return   # no need to check

[[ ! -f "$VAR_DIR/$DS/netdaemons.before" ]]  && cp -p /etc/rc.config.d/netdaemons  "$VAR_DIR/$DS/netdaemons.before"

if [[ "$(ch_rc -l -p XNTPD_NAME $VAR_DIR/$DS/netdaemons.before)"  =  "xntpd" ]] ; then
    Log "Found XNTPD_NAME=xntpd in /etc/rc.config.d/netdaemons [OK]"
    return
fi

# If we are here then the entry XNTPD_NAME should be modified or added
cp -p "$VAR_DIR/$DS/netdaemons.before" "$VAR_DIR/$DS/netdaemons.after"

# check if the keyword is present (sometimes it is not)
grep -q XNTPD_NAME "$VAR_DIR/$DS/netdaemons.after"
if (( $? == 1 )) ; then
    # entry is missing; so add it
    echo "export XNTPD_NAME=xntpd" >> "$VAR_DIR/$DS/netdaemons.after"
    Log "\"export XNTPD_NAME=xntpd\" added in /etc/rc.config.d/netdaemons"
else
    # if we get here then we need to replace ntpd with xntpd in /etc/rc.config.d/netdaemons
    Log "Found XNTPD_NAME=ntpd in /etc/rc.config.d/netdaemons - we will change it into xntpd"
    ch_rc -a -p XNTPD_NAME='xntpd' "$VAR_DIR/$DS/netdaemons.after"
fi

cp -p "$VAR_DIR/$DS/netdaemons.after" /etc/rc.config.d/netdaemons
Log "The following was modified in /etc/rc.config.d/netdaemons:" >&2
sdiff -s /etc/rc.config.d/netdaemons "$VAR_DIR/$DS/netdaemons.before"

Log "NTP daemon name before restart was:"
ps -ef|grep ntpd|grep -v grep >&2

Log "Restarting the ntpd process:"
/sbin/init.d/ntpd stop >&2
/sbin/init.d/ntpd start >&2

Log "NTP daemon name after restart is:"
ps -ef|grep ntpd|grep -v grep >&2

