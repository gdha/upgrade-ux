# 33_restart_apache.sh
if (( PREVIEW )) ; then
    return
fi


if [[ -f "$VAR_DIR/$DS/CVE-2015-4000" ]]; then
    # OpenSSL LogJam issue detected
    if [[ -x /sbin/init.d/hpws_apache ]]; then
	LogPrint "Restarting hpws_apache"
        /sbin/init.d/hpws_apache stop >&2
	sleep 2
	/sbin/init.d/hpws_apache start >&2
    fi
    if [[ -x /sbin/init.d/hpws22_apache ]]; then
	LogPrint "Restarting hpws22_apache"
        /sbin/init.d/hpws22_apache stop >&2
	sleep 2
	/sbin/init.d/hpws22_apache start >&2
    fi
fi

