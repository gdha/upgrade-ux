# 15_shutdown_sendmail.sh
if (( PREVIEW )) ; then
    Log "Stopping sendmail processes [not done in preview]"
else
    LogPrint "Stopping sendmail processes"
    [[ -x /sbin/init.d/sendmail ]] && /sbin/init.d/sendmail stop >&2
fi

