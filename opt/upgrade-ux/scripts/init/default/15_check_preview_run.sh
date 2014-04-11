# 06_check_preview_run.sh
# we will enforce a preview run (even when we forgot it with '-p' option!)
# we want, at all cost, to avoid any unplesant surprises
if (( PREVIEW_MODE )) ; then
    date > $PREVIEW_FILE
    LogPrint "Running in \"preview mode\""
    Log "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
elif [[ ! -f $PREVIEW_FILE ]]; then
    date > $PREVIEW_FILE
    PREVIEW_MODE=1
    LogPrint "Running in \"preview mode\""
    Log "=-=-=-=-=-=-=-=-=-=-=-=-="
else
    Log "Last preview run was executed on $(cat $PREVIEW_FILE)"
    # check if PREVIEW_FILE contain tag "preview ended successfully" = reset CURRENT_STATUS to "init:start"
    grep -q "preview ended successfully" $PREVIEW_FILE
    if [[ $? -eq 0 ]]; then
        CURRENT_STATUS="init:start"
	SetCurrentStatus "$STATUS_FILE"
    fi
    LogPrint "Running in \"upgrade mode\""
    Log "=-=-=-=-=-=-=-=-=-=-=-=-="
fi
