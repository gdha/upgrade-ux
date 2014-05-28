# 20_hpsim_healthcheck.sh

[[ ! -f /usr/local/bin/HPSIM-HealthCheck.sh ]] &&  return

LogPrint "Executing: /usr/local/bin/HPSIM-HealthCheck.sh"
/usr/local/bin/HPSIM-HealthCheck.sh >&2

