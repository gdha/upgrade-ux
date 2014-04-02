# 28_show_icapstatus.sh
# save the output of icapstatus before patching
[[ ! -x /usr/sbin/icapstatus ]] && return

[[ -f "$VAR_TMP/${HOSTNAME}_icapstatus_before.${DS}" ]] && return   # we already have the file

/usr/sbin/icapstatus -s 2>/dev/null > "$TMP_DIR/icapstatus_snapshot.txt"

if [[ -s "$TMP_DIR/icapstatus_snapshot.txt" ]]; then
    /usr/sbin/icapstatus > "$VAR_TMP/${HOSTNAME}_icapstatus_before.${DS}"
    # save the snapshot info as well
    cp "$TMP_DIR/icapstatus_snapshot.txt" "$VAR_TMP/${HOSTNAME}_icapstatus_snapshot.${DS}"
fi
