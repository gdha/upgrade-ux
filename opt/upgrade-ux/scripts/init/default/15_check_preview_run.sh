# 06_check_preview_run.sh
# we will enforce a preview run (even when we forgot it with '-p' option!)
# we want, at all cost, to avoid any unplesant surprises
if (( PREVIEW )) ; then
    date > $PREVIEW_FILE
    LogPrint "Running in \"preview mode\""
    Log "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    CURRENT_STATUS="init:start"
    SetCurrentStatus "$STATUS_FILE"
elif [[ ! -f $PREVIEW_FILE ]]; then
    date > $PREVIEW_FILE
    PREVIEW=1
    LogPrint "Running in \"preview mode\""
    Log "=-=-=-=-=-=-=-=-=-=-=-=-="
    CURRENT_STATUS="init:start"
    SetCurrentStatus "$STATUS_FILE"
else
    Log "Last preview run was executed on $(cat $PREVIEW_FILE)"
    # check if STATUS_FILE contain tag "preview ended successfully" = reset CURRENT_STATUS to "init:start"
    # CURRENT_STATUS="preview:ended" as forced by cleanup/default/90_preview_ended_successfully.sh ??
    #tail -15 $STATUS_FILE | grep -q "preview ended successfully"
    #if [[ $? -eq 0 ]]; then
    if [ "$CURRENT_STATUS" = "preview:ended" ]; then
        CURRENT_STATUS="init:start"
	SetCurrentStatus "$STATUS_FILE"
    fi
    LogPrint "Running in \"upgrade mode\""
    Log "=-=-=-=-=-=-=-=-=-=-=-=-="
fi
