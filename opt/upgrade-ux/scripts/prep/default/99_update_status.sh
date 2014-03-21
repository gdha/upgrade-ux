# 99_update_status.sh
# purpose: update the content of file $VAR_DIR/status which contain flags where we are in the upgrade process
# -------  as we may reboot and must be able to restart at the point where we left off
# the status of the last will be stored in variable CURRENT_STATUS
# at each phase in the process we will change the value of CURRENT_STATUS


echo "$(Stamp)$stage:ended" >> $VAR_DIR/status
# read the last line of the status file (as we will append our data)
CURRENT_STATUS=$(tail -1 $VAR_DIR/status | awk '{print $3}')

Log "Current status is $CURRENT_STATUS"

