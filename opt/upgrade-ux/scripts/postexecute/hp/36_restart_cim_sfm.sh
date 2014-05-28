# 26_restart_cim_sfm.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Verify HP-SIM related processes"
    [[ -x /usr/local/bin/restart_cim_sfm.sh ]] && /usr/local/bin/restart_cim_sfm.sh >&2
fi
