# 26_restart_cim_sfm.sh

if (( YEAR >= 2018 )) ; then
    # IRS is in use so no need for HPSIM related tasks anymore
    return
fi

if (( PREVIEW )) ; then
    :
else
    LogPrint "Verify HP-SIM related processes"
    [[ -x /usr/local/bin/restart_cim_sfm.sh ]] && /usr/local/bin/restart_cim_sfm.sh >&2
fi
