# install/GNU/Linux/29_exclude_packages.sh
# We read the content of the file $VAR_DIR/$DS/exclude.packages and mark it to exclude during the update

exclude_packages=""

[[ ! -f "$VAR_DIR/$DS/exclude.packages" ]] && return  # nothing needs to be marked for exclusion

if [[ -f "$VAR_DIR/$DS/exclude.packages.var" ]]  ; then
    # in PREVIEW mode the file exclude.packages.var will be created and in UPGARDE mode we will read this file
    exclude_packages=$( cat "$VAR_DIR/$DS/exclude.packages.var" )
    return
fi

cat "$VAR_DIR/$DS/exclude.packages" | while read pkg
do
    # Remove trailing wildcard symbol * from pkg name (if present)
    pkg_name=$( echo $pkg | sed -e 's/\*$//' )
    # As precaution check if this "bundle" is present before marking for exclusion
    # as software that is not installed would not be selected anyhow
    $RPM -qa --qf "%{name}-%{version}-%{release}\n" | grep -q $pkg_name && exclude_packages="$exclude_packages --exclude=$pkg"
    echo "$exclude_packages" > "$VAR_DIR/$DS/exclude.packages.var"
done

# only write a line to the log file when we can exclude something (test on zero length string give correct results)
test -z $exclude_packages || Log "We will add \"$exclude_packages\" to the update command(s)"
