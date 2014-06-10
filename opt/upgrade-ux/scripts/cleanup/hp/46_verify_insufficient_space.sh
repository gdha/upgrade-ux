# 46_verify_insufficient_space.sh
grep -q "insufficient" "$LOGFILE"
if [[ $? -eq 0 ]]; then
    LogPrint "$( SurroundingGrep 0 4 'insufficient' $LOGFILE )"
fi
