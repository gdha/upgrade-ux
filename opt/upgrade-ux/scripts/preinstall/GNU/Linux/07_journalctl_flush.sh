# 07_journalctl_flush.sh
# Flush the journals to /var/log/journal

if test /bin/journalctl ; then
    if (( PREVIEW )) ; then
        Log "Running journalctl --flush [not in preview mode]"
    else
        Log "Running journalctl --flush"
        journalctl --flush >&2
    fi
fi
