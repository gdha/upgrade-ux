# 12_upgrade_allowed.sh
#######################
# according the CURRENT_STATUS read previously we can decide if upgrade is allowed or?
if (( PREVIEW )) ; then
    return   # we have -p enabled on command line
fi

# first time run $PREVIEW_FILE does not yet exist
if [[ -f $PREVIEW_FILE ]]; then
    tail -16 "$STATUS_FILE" | grep -q "preview ended successfully"
    rc=$?
else
    rc=1  # first run => force preview if not given
fi

if (( $rc > 0 )); then
    PREVIEW=1
    LogPrint "Preview mode activated as it was not ended successfully (yet)"
fi
