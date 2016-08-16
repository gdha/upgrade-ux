# 72_save_and_diff_nsswitch_conf.sh

[[ ! -f "$VAR_DIR/$DS/nsswitch.conf.before" ]] && return

# According issue #55 the /etc/nsswitch.conf is sometimes modified
# Therefore, we do the check and report if that is true

cp -p /etc/nsswitch.conf  "$VAR_DIR/$DS/nsswitch.conf.after"

cmp -s "$VAR_DIR/$DS/nsswitch.conf.after" "$VAR_DIR/$DS/nsswitch.conf.before"
if (( $? == 1 )); then
    LogPrint "The /etc/nsswitch.conf seems to be modified after patching:"
    sdiff -s "$VAR_DIR/$DS/nsswitch.conf.after" "$VAR_DIR/$DS/nsswitch.conf.before"
    # to have the diffs in the log file as well repeat with sending to  >&2
    sdiff -s "$VAR_DIR/$DS/nsswitch.conf.after" "$VAR_DIR/$DS/nsswitch.conf.before"  >&2
    Log "The original /etc/nsswitch.conf was saved as $VAR_DIR/$DS/nsswitch.conf.before"
fi

