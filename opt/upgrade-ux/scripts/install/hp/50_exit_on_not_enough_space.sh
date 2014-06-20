# 50_exit_on_not_enough_space.sh
grep -q "insufficient" "$LOGFILE"
if (( $? == 0 )); then
    LogPrint "$( SurroundingGrep 0 4 'insufficient' $LOGFILE )"
    Error "Please fix above issue and retry again"
fi

