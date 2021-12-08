# preinstall/GNU/Linux/35_stop_cisco_amp.sh
# Stop cisco-ampp agent to avoid incident logging during patching due to
# certailn daemons that are stopped on purpose

service cisco-amp status >&2 || return

if (( PREVIEW )) ; then
    Log "Stopping Cisco AMP agent  [not done in preview]"
else
    LogPrint "Stopping Cisco AMP agent"
    service cisco-amp stop >&2
fi
