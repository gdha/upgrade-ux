# 45_grep_error_in_logfile.sh
grep -q "ERROR:" "$LOGFILE"
if (( $? == 0 )); then
    LogPrint "!!!!! ERRORS found in the logfile - please verify !!!!!"
fi
