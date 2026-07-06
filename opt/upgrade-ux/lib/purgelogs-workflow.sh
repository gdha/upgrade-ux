# clean-workflow.sh
#
WORKFLOW_purgelogs_DESCRIPTION="purge the LOG [$LOG_DIR] directory"
set -A WORKFLOWS ${WORKFLOWS[@]} "purgelogs"

function WORKFLOW_purgelogs  {
    LogPrint "Purging old log files from the LOG directory"

    # Security: guard against an empty LOG_DIR which would cause find to search /
    if [[ -z "$LOG_DIR" || ! -d "$LOG_DIR" ]]; then
        LogPrint "ERROR: LOG_DIR='$LOG_DIR' is empty or does not exist - aborting purge"
        return 1
    fi

    LogPrint "The following file(s) were deleted from the LOG directory $LOG_DIR :"
    find "$LOG_DIR" -name "${PROGRAM%.*}-*.log" -type f -mtime +1 -print -exec rm {} \; >&2

}
