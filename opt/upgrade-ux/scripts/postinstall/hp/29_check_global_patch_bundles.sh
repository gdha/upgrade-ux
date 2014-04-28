# 29_check_global_patch_bundles.sh
# this is a typically script for one customer only
# check the global patch bundles already installed and verify if the one of last year is installed

$SWLIST | grep gpb > "$TMP_DIR/${HOSTNAME}_global_patch_bundles_after.${DS}"
if [[ -s "$TMP_DIR/${HOSTNAME}_global_patch_bundles_after.${DS}" ]]; then
    mv "$TMP_DIR/${HOSTNAME}_global_patch_bundles_after.${DS}" "$VAR_DIR/${HOSTNAME}_global_patch_bundles_after.${DS}"
    Log "Saved overview of all installed global patch bundles as $VAR_DIR/${HOSTNAME}_global_patch_bundles_after.${DS}"
fi

if [[ -f "$VAR_DIR/${HOSTNAME}_global_patch_bundles_after.${DS}" ]]; then
    ThisYear=$( date +%Y )
    grep -q $ThisYear "$VAR_DIR/${HOSTNAME}_global_patch_bundles_after.${DS}"
    if (( $? > 0 )) ; then
	if (( PREVIEW )) ; then
            LogPrint  "WARNING: I am afraid the global patch bundle of this year ($ThisYear) was not (yet) installed"
	else
            LogPrint "ERROR: I am afraid the global patch bundle of this year ($ThisYear) was not yet installed"
	fi
    fi
fi
