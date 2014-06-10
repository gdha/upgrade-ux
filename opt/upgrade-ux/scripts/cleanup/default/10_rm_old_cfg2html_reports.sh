# 10_rm_old_cfg2html_reports.sh
[[ ! -d /var/log/cfg2html ]]  &&  return  # no cfg2html log dir; just return

Log "Removing old cfg2html data files (> 30 days old)"
/usr/bin/find /var/log/cfg2html  -type f -xdev -mtime +30 -print -exec rm -f {} \; >&2
