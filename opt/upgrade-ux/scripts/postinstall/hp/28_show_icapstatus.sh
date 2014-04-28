# 28_show_icapstatus.sh
# save the output of icapstatus after patching
[[ ! -x /usr/sbin/icapstatus ]] && return

[[ -f "$ICAPSTATUS_AFTER" ]] && return   # we already have the file

/usr/sbin/icapstatus -s 2>/dev/null > "$TMP_DIR/icapstatus_snapshot.txt"

if [[ -s "$TMP_DIR/icapstatus_snapshot.txt" ]]; then
    /usr/sbin/icapstatus | grep -v "Local nPartition Status" > "$ICAPSTATUS_AFTER"
    # save the snapshot info as well
    cp "$TMP_DIR/icapstatus_snapshot.txt" "$VAR_DIR/${HOSTNAME}_icapstatus_snapshot_after.${DS}"
fi
