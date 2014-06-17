# 20_install_bundles.sh

count=${#bundle[@]}
i=0

while (( i < count ))
do

    my_bundle="${bundle[i]}"

    # if version[i] is not empty we should add ",r=version[i]" to my_bundle
    if [[ ! -z "${version[i]}" ]]; then
        my_bundle="$my_bundle,r=${version[i]}"
    fi

    if (( PREVIEW )) ; then
        LogPrint "${command[i]} -p -v ${options[i]} ${source[i]} $my_bundle"
	${command[i]} -p -v ${options[i]} ${source[i]} $my_bundle
	rc=$?
    else
        LogPrint "${command[i]} -v ${options[i]} ${source[i]} $my_bundle"
        ${command[i]} -v ${options[i]} ${source[i]} $my_bundle
	rc=$?
    fi

    if (( rc > 0 )) ; then
        LogPrint "Error detected: ${command[i]} -v ${options[i]} ${source[i]} $my_bundle"
    fi

    if [[ "${command[i]}" == "$SWINSTALL" ]]; then
	SwJob ${command[i]} >&2
    fi
    i=$((i+1))
done
