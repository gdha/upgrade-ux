# 22_diff_swlist.sh
# compare the swlist.before with the swlist.after
[[ ! -f "$VAR_DIR/$DS/${HOSTNAME}_swlist.before" ]]  &&  return
[[ ! -f "$VAR_DIR/$DS/${HOSTNAME}_swlist.after"  ]]  &&  return

if (( PREVIEW )) ; then
    Log "Comparing software bundles [not in preview mode]"
else
    cmp -s "$VAR_DIR/$DS/${HOSTNAME}_swlist.before" "$VAR_DIR/$DS/${HOSTNAME}_swlist.after"
    if (( $? == 1 )) ; then
        LogPrint "The following software bundles were modified after the upgrade:"
	sdiff -s "$VAR_DIR/$DS/${HOSTNAME}_swlist.before" "$VAR_DIR/$DS/${HOSTNAME}_swlist.after"
	sdiff -s "$VAR_DIR/$DS/${HOSTNAME}_swlist.before" "$VAR_DIR/$DS/${HOSTNAME}_swlist.after" >&2
    fi
fi
