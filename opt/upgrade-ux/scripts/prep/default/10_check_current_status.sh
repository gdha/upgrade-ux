# 10_check_current_status.sh
# purpose: read the content of file $VAR_DIR/status which contain flags where we are in the upgrade process
# -------  as we may reboot and must be able to restart at the point where we left off
# the status of the last stage will be stored in variable CURRENT_STATUS (appending)
# at each phase in the process we will change the value of CURRENT_STATUS ($stage:[start|ended])
# flag looks like e.g.: 2014-03-20 13:23:59 prep:ended

if [[ ! -f $VAR_DIR/status ]]; then
    # first time we ever run this tool
    Log "Initialize $VAR_DIR/status with status \"$stage:start\""
    echo "$(Stamp)$stage:start" > $VAR_DIR/status
    CURRENT_STATUS="$stage:start"
else
    # read the last line of the status file (as we will append our status file)
    CURRENT_STATUS=$(tail -1 $VAR_DIR/status | awk '{print $3}')
fi

LogPrint "Current status is $CURRENT_STATUS"

