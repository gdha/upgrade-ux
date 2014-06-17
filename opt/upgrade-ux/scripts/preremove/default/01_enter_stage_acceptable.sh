# 01_enter_stage_acceptable.sh
# We need to verify before entering this stage of CURRENT_STATUS="prep:ended"
# and EnterNextStageAllowed=""

if [ "$EnterNextStageAllowed" = "N" ]; then
    Error "As the variable EnterNextStageAllowed is set to \"N\" we cannot proceed stage $stage"
fi

# clear EnterNextStageAllowed to be sure
EnterNextStageAllowed=

if [ "$CURRENT_STATUS" = "prep:ended" ]; then
    # nice we will now update our stage to "preremove:start"
    CURRENT_STATUS="$stage:start"
    SetCurrentStatus "$STATUS_FILE"  # write it to our STATUS_FILE
elif [ "$CURRENT_STATUS" = "preremove:start" ]; then
    # ok we restarted the upgrade-ux
    Log "Seems we restarted $PRODUCT and are still in status $CURRENT_STATUS"
else
    Error "$CURRENT_STATUS is not in the correct state to start with stage $stage"
fi
