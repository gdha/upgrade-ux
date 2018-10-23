# prep/default/61_exclude_software_packages.sh
# This script will inspect if the file $ETC_DIR/exclude.packages contain any listed software package (HP-UX software depot name or for Linux RPM name)
# If the file does contain a package it will create a file under $VAR_DIR/$DS/exclude.packages
# This file $VAR_DIR/$DS/exclude.packages, if it exists, will be used in the "install" phase to exclue any package during the installation

[[ ! -f "$ETC_DIR/exclude.packages" ]] && return  # nothing to exclude; so just return

# Remove all comment and blank lines before counting
if [[ $( grep -v ^\# "$ETC_DIR/exclude.packages" | sed -e '/^$/d' | wc -l ) -gt 0 ]] ; then
    grep -v ^\# "$ETC_DIR/exclude.packages" | sed -e '/^$/d' > "$VAR_DIR/$DS/exclude.packages"
fi
