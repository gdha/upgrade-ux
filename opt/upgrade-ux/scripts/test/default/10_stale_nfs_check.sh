Timeout 10 df -P
rc=$?
(( rc > 0 )) && LogPrint "stale NFS mount points found" || LogPrint "no stale NFS mount points found"

