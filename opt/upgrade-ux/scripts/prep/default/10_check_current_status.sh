# 10_check_current_status.sh
# purpose: read the content of file $STATUS_FILE which contain flags where we are in the upgrade process
# -------  as we may reboot and must be able to restart at the point where we left off
# the status of the last stage will be stored in variable CURRENT_STATUS (appending)
# at each phase in the process we will change the value of CURRENT_STATUS ($stage:[start|ended])
# flag looks like e.g.: 2014-03-20 13:23:59 prep:ended

ReadCurrentStatus "$STATUS_FILE"
LogPrint "Current status is $CURRENT_STATUS"

