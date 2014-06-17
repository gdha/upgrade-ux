# 99_update_status.sh
# purpose: update the content of file $STATUS_FILE which contain flags where we are in the upgrade process
# -------  as we may reboot and must be able to restart at the point where we left off
# the status of the last will be stored in variable CURRENT_STATUS
# at each phase in the process we will change the value of CURRENT_STATUS

# at the end of this stage change the current status in our variable CURRENT_STATUS 
# TODO: which criterium will be use to decide we have succeeded this stage successfully?

if [[ "$EnterNextStageAllowed" == "N" ]]; then
    Error "As the variable EnterNextStageAllowed is set to \"N\" we cannot proceed to the next stage"
else
    CURRENT_STATUS="$stage:ended"
    # write the current status to the $STATUS_FILE
    SetCurrentStatus "$STATUS_FILE"
fi

# CURRENT_STATUS=$( ReadCurrentStatus "$STATUS_FILE" )

Log "Current status is $CURRENT_STATUS"

