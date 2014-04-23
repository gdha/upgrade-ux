# 10_check_current_status.sh
# purpose: read the content of file $STATUS_FILE which contain flags where we are in the upgrade process
# -------  as we may reboot and must be able to restart at the point where we left off
#          The status will be appending to the $STATUS_FILE. 
# the status of the last stage will be stored in variable CURRENT_STATUS
# at each phase in the process we will change the value of CURRENT_STATUS ($stage:[start|ended])
# flag looks like e.g.: 2014-03-20 13:23:59 prep:ended

CURRENT_STATUS=$( ReadCurrentStatus "$STATUS_FILE" )

if [[ "$CURRENT_STATUS" = "init:ended" ]]; then
    CURRENT_STATUS="$stage:start"
    SetCurrentStatus "$STATUS_FILE"
fi
LogPrint "Current status is $CURRENT_STATUS"
