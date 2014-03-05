# clean-workflow.sh
#
WORKFLOW_purgelogs_DESCRIPTION="purge the LOG [$LOG_DIR] directory"
set -A WORKFLOWS ${WORKFLOWS[@]} "purgelogs"

function WORKFLOW_purgelogs  {
    LogPrint "Purging old log files from the LOG directory"

    LogPrint "The following file(s) were deleted from the LOG directory $LOG_DIR :"
    find $LOG_DIR -name "${PROGRAM%.*}-*-LOGFILE.log" -type f -mtime +1 -print -exec rm {} \; >&2

}
