# 20_hpsim_healthcheck.sh

if (( YEAR >= 2018 )) ; then
    # IRS is in use so no need for HPSIM related tasks anymore
    return
fi

[[ ! -f /usr/local/bin/HPSIM-HealthCheck.sh ]] &&  return

LogPrint "Executing: /usr/local/bin/HPSIM-HealthCheck.sh"
/usr/local/bin/HPSIM-HealthCheck.sh >&2

