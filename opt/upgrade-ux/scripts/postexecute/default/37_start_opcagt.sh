# 37_start_opcagt.sh
if (( PREVIEW )) ; then
    :
else
    LogPrint "Start OV OpC agents"
    [[ -x /opt/OV/bin/OpC/opcagt ]] && /opt/OV/bin/OpC/opcagt -start >&2
fi
