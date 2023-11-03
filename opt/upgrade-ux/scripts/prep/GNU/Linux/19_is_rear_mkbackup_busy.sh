# 19_is_rear_mkbackup_busy.sh
# Purpose of the script is to detect if "rear mkbackup" is currently running
# If that us true we better exit upgrade-ux and or wait till 'rear mkbackup' is finished,
# or investigate if the 'rear mkbackup' process is not hanging due a stale NFS issue

(( PREVIEW )) && return  # do not exit in preview mode

Log "Checking is 'rear' mkbackup' is running?"
ps ax | grep -v grep | grep 'rear mkbackup' >&2 && Error "Relax-and-Recover is currently running, therefore, we quit."
