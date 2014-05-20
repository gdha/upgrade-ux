# 29_check_global_patch_bundles.sh
# this is a typically script for one customer only
# check the global patch bundles already installed and verify if the one of last year is installed

$SWLIST | grep gpb > "$TMP_DIR/${HOSTNAME}_global_patch_bundles.before"
if [[ -s "$TMP_DIR/${HOSTNAME}_global_patch_bundles.before" ]]; then
    mv "$TMP_DIR/${HOSTNAME}_global_patch_bundles.before" "$VAR_DIR/$DS/${HOSTNAME}_global_patch_bundles.before"
    Log "Saved overview of all installed global patch bundles as $VAR_DIR/$DS/${HOSTNAME}_global_patch_bundles.before"
fi

if [[ -f "$VAR_DIR/$DS/${HOSTNAME}_global_patch_bundles.before" ]]; then
    LastYear=$(( YEAR - 1 ))
    grep -q $LastYear "$VAR_DIR/$DS/${HOSTNAME}_global_patch_bundles.before"
    if (( $? > 0 )) ; then
	if (( PREVIEW )) ; then
            LogPrint  "WARNING: I am afraid the global patch bundle of last year ($LastYear) was not yet installed"
	else
            LogPrint "ERROR: I am afraid the global patch bundle of last year ($LastYear) was not yet installed"
	fi
    fi
fi
