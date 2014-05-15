# 60_hpsim_install_config.sh

[[ ! -f /usr/local/bin/HPSIM-Check-RSP-readiness.sh ]] && return

LogPrint "Executing: /usr/local/bin/HPSIM-Check-RSP-readiness.sh"
if (( PREVIEW )) ; then
    /usr/local/bin/HPSIM-Check-RSP-readiness.sh >&2
else
    /usr/local/bin/HPSIM-Check-RSP-readiness.sh -i >&2
fi
