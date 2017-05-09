# 39_save_and_diff_yum_log.sh

# we will always save a copy when we are almost done (to be sure)
cp /var/log/yum.log "$VAR_DIR/$DS/yum.log.after"

# if we do not have a 'before' copy we cannot compare (should never be the case)
[[ ! -f "$VAR_DIR/$DS/yum.log.before" ]] && return

cmp -s "$VAR_DIR/$DS/yum.log.after" "$VAR_DIR/$DS/yum.log.before"
if ((  $? == 1 )); then
    LogPrint "The difference in yum.log is:"
    diff "$VAR_DIR/$DS/yum.log.after" "$VAR_DIR/$DS/yum.log.before"  | grep '^>' | cut -c2-
    diff "$VAR_DIR/$DS/yum.log.after" "$VAR_DIR/$DS/yum.log.before"  | grep '^>' | cut -c2- >&2
fi
