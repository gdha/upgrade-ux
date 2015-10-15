# 33_start_hpsmh.sh
if (( PREVIEW )) ; then
    :
else
    if [[ -f "$VAR_DIR/$DS/CVE-2015-4000" ]]; then
        # OpenSSL LogJam issue detected - restart required
	LogPrint "Re-start HP System Mgmt Homepage"
	[[ -x /sbin/init.d/hpsmh ]] && /sbin/init.d/hpsmh stop >&2
	sleep 3  # to allow graceful stop
	[[ -x /sbin/init.d/hpsmh ]] && /sbin/init.d/hpsmh start >&2
    else
        LogPrint "Start HP System Mgmt Homepage"
        [[ -x /sbin/init.d/hpsmh ]] && /sbin/init.d/hpsmh start >&2
    fi
fi
