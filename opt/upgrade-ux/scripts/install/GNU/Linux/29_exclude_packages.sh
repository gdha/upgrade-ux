# install/GNU/Linux/29_exclude_packages.sh
# We read the content of the file $VAR_DIR/$DS/exclude.packages and mark it to exclude during the update

exclude_bundles=""

[[ ! -f "$VAR_DIR/$DS/exclude.packages" ]] && return  # nothing needs to be marked for exclusion

cat "$VAR_DIR/$DS/exclude.packages" | while read pkg
do
    # Remove trailing wildcard symbol * from pkg name (if present)
    pkg_name=$( echo $pkg | sed -e 's/\*$//' )
    # As precaution check if this "bundle" is present before marking for exclusion
    # as software that is not installed would not be selected anyhow
    $RPM -qa --qf "%{name}-%{version}-%{release}\n" | grep -q $pkg_name && exclude_packages="$exclude_packages --exclude=$pkg"
done

# only write a line to the log file when we can exclude something (test on zero length string give correct results)
test -z $exclude_packages || Log "We will exclude \"$exclude_bundles\" from the update"
