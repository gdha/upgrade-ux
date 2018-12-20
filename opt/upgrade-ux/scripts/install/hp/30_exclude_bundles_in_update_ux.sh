# install/hp/30_exclude_bundles_in_update_ux.sh
# We read the content of the file $VAR_DIR/$DS/exclude.packages and mark it to exclude during the update-ux installation

exclude_bundles=""

[[ ! -f "$VAR_DIR/$DS/exclude.packages" ]] && return  # nothing needs to be marked for exclusion

cat "$VAR_DIR/$DS/exclude.packages" | while read bundle
do
    # As precaution check if this "bundle" is present before marking for exclusion
    # as software that is not installed would not be selected anyhow
    $SWLIST $bundle >/dev/null 2>/dev/null && exclude_bundles="$exclude_bundles !$bundle"
done

Log "We will exclude \"$exclude_bundles\" from the update"
