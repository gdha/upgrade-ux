# 40_report_failed_swinstall.sh
if [[ -f "$VAR_DIR/$DS/sw_installation_in_progress" ]]; then
    grep -q "rc=1" "$VAR_DIR/$DS/sw_installation_in_progress" || return  # all rc=0 so OK

    LogPrint "The following line(s) return an error - please inspect the logfile"
    grep  "rc=1" "$VAR_DIR/$DS/sw_installation_in_progress"
    grep  "rc=1" "$VAR_DIR/$DS/sw_installation_in_progress" >&2
fi

