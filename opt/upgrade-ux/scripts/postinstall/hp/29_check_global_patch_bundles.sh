# 29_check_global_patch_bundles.sh
# this is a typically script for one customer only
# check the global patch bundles already installed and verify if the one of last year is installed

# in case you mistypes the name of the patch bundle (it happen to me)
$SWLIST | grep -E '(gpb|gbp)' > "$TMP_DIR/${HOSTNAME}_global_patch_bundles.after"
if [[ -s "$TMP_DIR/${HOSTNAME}_global_patch_bundles.after" ]]; then
    mv "$TMP_DIR/${HOSTNAME}_global_patch_bundles.after" "$VAR_DIR/$DS/${HOSTNAME}_global_patch_bundles.after"
    Log "Saved overview of all installed global patch bundles as $VAR_DIR/$DS/${HOSTNAME}_global_patch_bundles.after"
fi

if [[ -f "$VAR_DIR/$DS/${HOSTNAME}_global_patch_bundles.after" ]]; then
    grep -q $YEAR "$VAR_DIR/$DS/${HOSTNAME}_global_patch_bundles.after"
    if (( $? > 0 )) ; then
	if (( PREVIEW )) ; then
            #LogPrint  "WARNING: I am afraid the global patch bundle of year $YEAR was not (yet) installed"
            : # no sense in preview mode
	else
            LogPrint "ERROR: I am afraid the global patch bundle of year $YEAR was not yet installed"
	fi
    fi
fi
