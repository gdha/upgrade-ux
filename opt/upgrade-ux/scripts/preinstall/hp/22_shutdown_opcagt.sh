# 22_shutdown_opcagt.sh

[[ ! -x /opt/OV/bin/OpC/opcagt ]] && return

if (( PREVIEW )) ; then
    Log "Stopping OV OpC agents [not done in preview]"
else
    LogPrint "Stopping OV OpC agents"
    /opt/OV/bin/OpC/opcagt -stop >&2
fi
