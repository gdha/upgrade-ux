# 29_check_global_patch_bundles.sh
# this is a typically script for one customer only
# check the global patch bundles already installed and verify if the one of last year is installed

$SWLIST | grep gpb > "$TMP_DIR/${HOSTNAME}_global_patch_bundles_before.${DS}"
if [[ -s "$TMP_DIR/${HOSTNAME}_global_patch_bundles_before.${DS}" ]]; then
    mv "$TMP_DIR/${HOSTNAME}_global_patch_bundles_before.${DS}" "$VAR_DIR/${HOSTNAME}_global_patch_bundles_before.${DS}"
    Log "Saved overview of all installed global patch bundles as $VAR_DIR/${HOSTNAME}_global_patch_bundles_before.${DS}"
fi

if [[ -f "$VAR_DIR/${HOSTNAME}_global_patch_bundles_before.${DS}" ]]; then
    ThisYear=$( date +%Y )
    LastYear=$(( ThisYear - 1 ))
    grep -q $LastYear "$VAR_DIR/${HOSTNAME}_global_patch_bundles_before.${DS}"
    if (( $? > 0 )) ; then
	if (( PREVIEW )) ; then
            LogPrint  "WARNING: I am afraid the global patch bundle of last year ($LastYear) was not yet installed"
	else
            #Error "I am afraid the global patch bundle of last year ($LastYear) was not yet installed"
	    # if we are not that fast to install all patches in the same year...
            LogPrint "ERROR: I am afraid the global patch bundle of last year ($LastYear) was not yet installed"
	fi
    fi
fi
