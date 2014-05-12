# 10_save_syslog.sh

[[ ! -f /var/adm/syslog/syslog.log ]] && return

# save only syslog entries from today - format: Apr 24
cat /var/adm/syslog/syslog.log | grep "^$(date '+%b %d')" > $VAR_DIR/$DS/syslog.of.today
