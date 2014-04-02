# 29_check_global_patch_bundles.sh
# this is a typically script for one customer only
# check the global patch bundles already installed and verify if the one of last year is installed

$SWLIST | grep gpb > "$TMP_DIR/${HOSTNAME}_global_patch_bundles.${DS}"
if [[ -s "$TMP_DIR/${HOSTNAME}_global_patch_bundles.${DS}" ]]; then
    mv "$TMP_DIR/${HOSTNAME}_global_patch_bundles.${DS}" "$VAR_DIR/${HOSTNAME}_global_patch_bundles.${DS}"
    Log "Saved overview of all installed global patch bundles as $VAR_DIR/${HOSTNAME}_global_patch_bundles.${DS}"
fi

if [[ -f "$VAR_DIR/${HOSTNAME}_global_patch_bundles.${DS}" ]]; then
    ThisYear=$( date +%Y )
    LastYear=$(( ThisYear - 1 ))
    grep -q $LastYear "$VAR_DIR/${HOSTNAME}_global_patch_bundles.${DS}"
    if (( $? > 0 )) ; then
	if (( PREVIEW_MODE )) ; then
            LogPrint  "WARNING: I am afraid the global patch bundle of last year ($LastYear) was not yet installed"
	else
            Error "I am afraid the global patch bundle of last year ($LastYear) was not yet installed"
	fi
    fi
fi
