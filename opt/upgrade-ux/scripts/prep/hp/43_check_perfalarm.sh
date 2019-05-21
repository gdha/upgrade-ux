# 43_check_perfalarm.sh
# Verify before patching if there are errors found in the /var/opt/perf/alarmdef file
# Why? So that we cannot blame this update bundle of breaking perfalrm daemon due to patching
# See also https://github.com/gdha/upgrade-ux/issues/111

rc=0
[[ ! -f /opt/perf/bin/utility ]] && return  # we need this executable to perform the check

/opt/perf/bin/utility  -xc 2>$VAR_DIR/$DS/alarmdef.err >$VAR_DIR/$DS/alarmdef.output
rc=$?

if (( rc > 0 )) ; then
 Log "WARNING: /var/opt/perf/alarmdef contains errors - see below"
 cat $VAR_DIR/$DS/alarmdef.err >> $LOGFILE
fi
