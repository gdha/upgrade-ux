# install/GNU/Linux/29_exclude_packages.sh
# We read the content of the file $VAR_DIR/$DS/exclude.packages and mark it to exclude during the update

exclude_packages=""

[[ ! -f "$VAR_DIR/$DS/exclude.packages" ]] && return  # nothing needs to be marked for exclusion

# Issue #145: we will always refill the variable $exclude_packages (in preview and upgrade mode)
#if [[ -f "$VAR_DIR/$DS/exclude.packages.var" ]]  ; then
#    # in PREVIEW mode the file exclude.packages.var will be created and in UPGRADE mode we will read this file
#    exclude_packages=$( cat "$VAR_DIR/$DS/exclude.packages.var" )
#    return
#fi

cat "$VAR_DIR/$DS/exclude.packages" | while read pkg
do
    # Remove trailing wildcard symbol * from pkg name (if present)
    pkg_name=$( echo $pkg | sed -e 's/\*$//' )
    # As precaution check if this "bundle" is present before marking for exclusion
    # as software that is not installed would not be selected anyhow
    if [[ "$OS_MASTER_VENDOR" == "fedora" ]] ; then
        $RPM -qa --qf "%{name}-%{version}-%{release}\n" | grep -q $pkg_name && exclude_packages="$exclude_packages --exclude=$pkg"
        echo "$exclude_packages" > "$VAR_DIR/$DS/exclude.packages.var"
    elif [[ "$OS_MASTER_VENDOR" == "debian" ]] ; then
        apt show $pkg_name >/dev/null 2>&1 && apt-mark hold $pkg_name
    fi
done

# only write a line to the log file when we can exclude something (test on zero length string give correct results)
# On Enterprise Linux alike we use:
test -z $exclude_packages || Log "We will add \"$exclude_packages\" to the update command(s)"

# On Debian alike we use:
if [[ "$OS_MASTER_VENDOR" == "debian" ]] ; then
    Log "Output of command \"apt-mark showhold\":"
    apt-mark showhold  >&2
fi
