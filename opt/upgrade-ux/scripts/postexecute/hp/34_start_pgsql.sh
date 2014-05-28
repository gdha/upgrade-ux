# 34_start_pgsql.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start PostgreSQL for HP-SIM"
    [[ -x /sbin/init.d/psbdb ]] && /sbin/init.d/psbdb start >&2
    [[ -x /sbin/init.d/sfmdb ]] && /sbin/init.d/sfmdb start >&2
fi
