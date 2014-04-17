# 90_preview_ended_successfully.sh
# after running in preview mode with success (add a tag to the preview file)

[[ "$CURRENT_STATUS" != "postexecute:ended" ]] && return

if (( PREVIEW )) ; then
    LogPrint "Preview mode ended successfully"
    echo "$(date)  (preview ended successfully)" > "$PREVIEW_FILE"
fi
