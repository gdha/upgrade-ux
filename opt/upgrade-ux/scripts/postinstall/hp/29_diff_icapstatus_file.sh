# 29_diff_icapstatus_file.sh
[[ ! -f "$ICAPSTATUS_AFTER" ]] && return  # most likely no icap anyway
[[ ! -f "$ICAPSTATUS_BEFORE" ]] && return  # no diff possible; so say nothing

cmp -s "$ICAPSTATUS_BEFORE" "$ICAPSTATUS_AFTER"
if (( $? == 1 )); then
    LogPrint "The icapstatus output shows differences (see log file)"
    sdiff -s "$ICAPSTATUS_BEFORE" "$ICAPSTATUS_AFTER" >&2
fi
