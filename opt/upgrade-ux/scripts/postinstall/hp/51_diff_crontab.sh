# 51_diff_crontab.sh
# if we do not have both files to compare just return
[[ ! -f "$VAR_DIR/$DS/crontab.before" ]] && return
[[ ! -f "$VAR_DIR/$DS/crontab.after" ]]  && return

cmp -s "$VAR_DIR/$DS/crontab.before" "$VAR_DIR/$DS/crontab.after"
if (( $? == 1 )); then
    LogPrint "Following crontab entries are new or modified:"
    sdiff -s "$VAR_DIR/$DS/crontab.before" "$VAR_DIR/$DS/crontab.after"
    sdiff -s "$VAR_DIR/$DS/crontab.before" "$VAR_DIR/$DS/crontab.after" >&2
fi
