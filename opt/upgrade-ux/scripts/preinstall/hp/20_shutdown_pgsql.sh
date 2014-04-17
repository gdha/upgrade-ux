# 20_shutdown_pgsql.sh
if (( PREVIEW )) ; then
    Log "Stopping PostgreSQL process [not done in preview]"
else
    LogPrint "Stopping PostgreSQL process"
    [[ -x /sbin/init.d/psbdb ]] && /sbin/init.d/psbdb stop >&2
    [[ -x /sbin/init.d/sfmdb ]] && /sbin/init.d/sfmdb stop >&2
fi

