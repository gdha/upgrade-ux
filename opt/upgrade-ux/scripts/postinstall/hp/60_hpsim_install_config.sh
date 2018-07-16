# 60_hpsim_install_config.sh

if (( YEAR >= 2018 )) ; then
    # IRS is in use so no need for HPSIM related tasks anymore
    return
fi

[[ ! -f /usr/local/bin/HPSIM-Check-RSP-readiness.sh ]] && return

LogPrint "Executing: /usr/local/bin/HPSIM-Check-RSP-readiness.sh"
if (( PREVIEW )) ; then
    /usr/local/bin/HPSIM-Check-RSP-readiness.sh >&2
else
    /usr/local/bin/HPSIM-Check-RSP-readiness.sh -i >&2
fi
