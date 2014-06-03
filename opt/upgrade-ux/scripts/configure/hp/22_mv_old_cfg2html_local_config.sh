# 22_mv_old_cfg2html_local_config.sh
# CFG2HTML C.06.00 kept it local config file as /etc/cfg2html/local.conf, however, CFG2HTML C.06.21 (and higher)
# uses a new location /opt/cfg2html/etc/local.conf.
# The cfg2html main script reads first /opt/cfg2html/etc/local.conf and thereafter /etc/cfg2html/local.conf which
# could lead to conflicts (in our case as we moved to another NAS volume)

[[ ! -f /etc/cfg2html/local.conf ]] && return  # no problem, just return

if [[ -f /opt/cfg2html/etc/local.conf ]]; then
    # if we do not have the NEW config file we may not move the older one
    mv /etc/cfg2html/local.conf /etc/cfg2html/local.conf.$(date '+%Y-%m-%d')
    Log "Renamed the old cfg2html local.conf file as /etc/cfg2html/local.conf.$(date '+%Y-%m-%d')"
fi
