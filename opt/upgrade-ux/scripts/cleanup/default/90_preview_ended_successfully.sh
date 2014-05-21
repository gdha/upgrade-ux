# 90_preview_ended_successfully.sh
# after running in preview mode with success (add a tag to the preview file)

[[ "$CURRENT_STATUS" != "postexecute:ended" ]] && return

if (( PREVIEW )) ; then
    LogPrint "Preview mode ended successfully"
    echo "$(date)  (preview ended successfully)" > "$PREVIEW_FILE"
    # next line will be read by init/default/15_check_preview_run.sh to decide for upgrade mode
    echo "$(Stamp)preview:ended   (preview ended successfully)" >> "$STATUS_FILE"
else
    LogPrint "Upgrade mode ended successfully"
    echo "$(Stamp)upgrade:ended   (upgrade ended successfully)" >> "$STATUS_FILE"
fi
