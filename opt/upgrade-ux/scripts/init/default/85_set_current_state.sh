# 85_set_current_state.sh
# when CURRENT_STATUS is at this point "init:start" then we may define "init:ended" and write it into the status file
if [ "$CURRENT_STATUS" = "init:start" ]; then
    CURRENT_STATUS="init:ended"
    SetCurrentStatus "$STATUS_FILE"
fi
