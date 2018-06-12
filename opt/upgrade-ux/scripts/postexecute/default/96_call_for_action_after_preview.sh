# postexecute/default/96_call_for_action_after_preview.sh
# Purpose of this script is to show all the logged 'ERROR' mesasages
# found the the LOGFILE

if (( PREVIEW )) ; then
    grep -q ERROR $LOGFILE || return  # no ERRORs found; silently return
    echo "******************************************************************************
WARNING - We found ERROR(s) during the PREVIEW run - please take care and retry

"
grep ERROR $LOGFILE
echo "******************************************************************************"
    
fi
