# 50_run_cleanup.sh
if (( PREVIEW )) ; then
    Log "Run cleanup process [preview]"
    [[ -x /usr/sbin/cleanup ]] && echo | /usr/sbin/cleanup -p -c 2
else
    LogPrint "Run cleanup process"
    [[ -x /usr/sbin/cleanup ]] && echo | /usr/sbin/cleanup -c 2
fi

