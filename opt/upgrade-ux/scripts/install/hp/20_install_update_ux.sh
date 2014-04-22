# 20_install_update_ux.sh
# install the latest version of the update-ux script from HP
# the INI file must define as bundle[0]=Update-UX (if not bail out)
i=0  # must be first array element!
if [[ "${bundle[i]}" != "Update-UX" ]]; then
    Error "Please define \"Update-UX\" as bundle[$i] in $INI_FILE file"
fi

if (( PREVIEW )) ; then
    Log "${command[i]} -vp ${options[i]} ${source[i]} ${bundle[i]}"
    ${command[i]} -vp ${options[i]} ${source[i]} ${bundle[i]} >&2
else
    Log "${command[i]} -v ${options[i]} ${source[i]} ${bundle[i]}"
    ${command[i]} -v ${options[i]} ${source[i]} ${bundle[i]} >&2
fi

SwJob ${command[i]} >&2
