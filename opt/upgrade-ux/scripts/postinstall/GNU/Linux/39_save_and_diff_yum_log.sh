# 39_save_and_diff_yum_log.sh

# we will always save a copy when we are almost done (to be sure)
cp /var/log/yum.log "$VAR_DIR/$DS/yum.log.after"

# if we do not have a 'before' copy we cannot compare (should never be the case)
[[ ! -f "$VAR_DIR/$DS/yum.log.before" ]] && return

cmp -s "$VAR_DIR/$DS/yum.log.after" "$VAR_DIR/$DS/yum.log.before"
if ((  $? == 1 )); then
    # Log to logfile only (otherwise too much info on the screen going by)
    Log "The differences in yum.log are:"
    diff "$VAR_DIR/$DS/yum.log.after" "$VAR_DIR/$DS/yum.log.before"  | grep '^<' | cut -c2- >&2
fi
