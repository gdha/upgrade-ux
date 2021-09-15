# postexecute/GNU/Linux/31_start_flexera.sh
# Start Flexera (or ManageSoft mgsusageag agent)

[[ ! -f /etc/init.d/mgsusageag ]] && return  # not present

if (( PREVIEW )) ; then
   :
else
   LogPrint "Start ManageSoft mgsusageag agent"
   [[ -x /etc/init.d/mgsusageag ]] && /etc/init.d/mgsusageag start >&2
fi
