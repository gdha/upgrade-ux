# 29_start_sendmail.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start sendmail"
    [[ -x /sbin/init.d/sendmail ]] && /sbin/init.d/sendmail start >&2
fi
