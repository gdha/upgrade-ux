# 08_save_shutdownlog.sh
# this script must be executed before 09_reboot_required.sh as we can check if a reboot was performed
[[ ! -f /etc/shutdownlog ]] && return

if [[ -f "$VAR_DIR/$DS/shutdownlog.before" ]]; then
    cp -p /etc/shutdownlog "$VAR_DIR/$DS/shutdownlog.after"
    cmp -s "$VAR_DIR/$DS/shutdownlog.after" "$VAR_DIR/$DS/shutdownlog.before"
    if [[ $? -eq 1 ]]; then
        LogPrint "Last shutdown: $(tail -1 $VAR_DIR/$DS/shutdownlog.after)"
	touch "$VAR_DIR/$DS/.rebooted"
    fi
else
    tail -1 /etc/shutdownlog | grep -q "$(date '+%a %b %d, %Y.')"            # e.g. Tue May 27, 2014.
    if [[ $? -eq 0 ]]; then
        _SHOUR=$(tail -1 /etc/shutdownlog | awk '{print $1}' | cut -d: -f1)  # e.g. 10 (shutdown hour)
	_CHOUR=$(date '+%H')                                                 # e.g. 04 (current hour)
	_sHOUR=$(expr $_SHOUR + 0)                                           # to get rid of leading 0
	_cHOUR=$(expr $_CHOUR + 0)                                           # to get rid of leading 0
	if (( $_cHOUR == $_sHOUR )) || (( $_sHOUR == $((_cHOUR - 1)) )) ; then
            # last reboot was on the same hour or max 1 hour back (in case we crossed hour boundaries)
	    LogPrint "Last shutdown: $(tail -1 /etc/shutdownlog)"
	    touch "$VAR_DIR/$DS/.rebooted"
	fi
    fi
fi
