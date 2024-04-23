# postexecute/GNU/Linux/25_start_ctmagent.sh
if (( PREVIEW )) ; then
    :
else
    [[ -f /opt/TIDAL/BMC/installsoftware/ctm/exe/p_ctmag ]] || return  # no Ctrl-M present so silently return
    LogPrint "Start Control M daemon"
    service ctmagent status || service ctmagent start >&2
fi
