# 54_diff_tz.sh
# if we do not have both files to compare just return
[[ ! -f "$VAR_DIR/$DS/tz.before" ]] && return
[[ ! -f /etc/default/tz ]]          && return

cmp -s /etc/default/tz "$VAR_DIR/$DS/tz.before"
if (( $? == 1 )); then
    LogPrint "Timezone entry was modified:"
    sdiff -s /etc/default/tz "$VAR_DIR/$DS/tz.before" >&2
    LogPrint "Copy back the original one:"
    cp -p "$VAR_DIR/$DS/tz.before" /etc/default/tz
    cat /etc/default/tz  >&2
fi

