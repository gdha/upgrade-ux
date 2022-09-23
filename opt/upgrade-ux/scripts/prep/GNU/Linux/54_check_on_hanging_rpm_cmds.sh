# prep/GNU/Linux/54_check_on_hanging_rpm_cmds.sh
# We have seen cases where lots of rpm commands seem to hang for a long time most likely
# due to a rpmdb corruption. If that is the case then we may NOT proceed, but first
# fix the rpmdb again.

[[ ! -x $RPM ]] && return  # makes only sense if rpm binary is being used

count_rpm_cmds=$(ps ax | grep rpm | grep -v grep | grep -v 54_check_on_hanging_rpm_cmds | wc -l)
# The count_rpm_cmds should be 0 in most cases which means no hanging rpm commands
# Sometime count_rpm_cmds=1 when a /usr/lib/rpm/rpmdb_verify Packages is running [OK]
# However, if count_rpm_cmds>2 then we might have a problem.
# Using e.g. timeout 5 rpm -q bash
# will not help as it would also hang infinite (timeout would not work in this case)

if [[ $count_rpm_cmds -gt 2 ]]; then
  LogPrint "Too many rpm commands are currently busy - might be hanging on a corrupt rmpdb:"
  ps ax | grep rpm | grep -v grep | grep -v 54_check_on_hanging_rpm_cmds >&2
  Error "To avoid any further issues please investigate the rpmdb before continuing"
else
  Log "No hanging rpm commands detected [OK]"
fi
