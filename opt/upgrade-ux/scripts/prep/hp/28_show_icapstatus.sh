# 28_show_icapstatus.sh
# save the output of icapstatus before patching
[[ ! -x /usr/sbin/icapstatus ]] && return

[[ -f "$ICAPSTATUS_BEFORE" ]] && return   # we already have the file

/usr/sbin/icapstatus -s 2>/dev/null > "$TMP_DIR/icapstatus_snapshot.txt"

if [[ -s "$TMP_DIR/icapstatus_snapshot.txt" ]]; then
    # we remove the line that contains a date and hour (easier to compare after reboot)
    /usr/sbin/icapstatus | grep -v "Local nPartition Status" > "$ICAPSTATUS_BEFORE"
    # save the snapshot info as well
    cp "$TMP_DIR/icapstatus_snapshot.txt" "$VAR_DIR/$DS/${HOSTNAME}_icapstatus_snapshot.before"
fi
