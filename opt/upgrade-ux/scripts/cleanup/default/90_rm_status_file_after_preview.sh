# 90_rm_status_file_after_preview.sh
# after running in preview mode we better remove the status file before running in production

# we may only rm the preview file if the CURRENT_STATUS="cleanup:ended"
[[ "$CURRENT_STATUS" != "cleanup:ended" ]] && return

if (( PREVIEW_MODE )) ; then
    Log "Removing the ${STATUS_FILE##*/} (preview mode ended successfully)"
    rm -f $STATUS_FILE
fi
