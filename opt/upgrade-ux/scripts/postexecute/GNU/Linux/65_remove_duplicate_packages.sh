# postexecute/GNU/Linux/65_remove_duplicate_packages.sh
# The purpose is to list (and remove duplicates packages)

[[ ! -x /bin/package-cleanup ]] && return

if (( PREVIEW )) ; then
    
    Log "Show duplicate, or orphaned packages"
    package-cleanup --dupes -y >&2
else

    LogPrint "Clean up locally installed, duplicate, or orphaned packages"
    package-cleanup --cleandupes -y >&2
fi
