# 12_upgrade_allowed.sh
#######################
# according the CURRENT_STATUS read previously we can decide if upgrade is allowed or?

if (( PREVIEW_MODE )) ; then
    return   # we have -p enabled on command line
fi

#prev_stage=$( echo $CURRENT_STATUS | cut -d: -f1 )
#prev_status=$( echo $CURRENT_STATUS | cut -d: -f2 )

grep -q "preview ended successfully" $PREVIEW_FILE
if [[ $? -ne 0 ]]; then
    PREVIEW_MODE=1
    LogPrint "Preview mode activated as it was not ended successfully (yet)"
fi
