# 20_install_bundles.sh

count=${#bundle[@]}
i=0

while (( $i < $count ))
do

    if (( PREVIEW )) ; then
        LogPrint "${command[i]} -p -v ${options[i]} ${source[i]} ${bundle[i]}"
	${command[i]} -p -v ${options[i]} ${source[i]} ${bundle[i]}
	rc=$?
    else
        LogPrint "${command[i]} -v ${options[i]} ${source[i]} ${bundle[i]}"
        ${command[i]} -v ${options[i]} ${source[i]} ${bundle[i]}
	rc=$?
    fi

    if [[ $rc -gt 0 ]]; then
        LogPrint "Error detected: ${command[i]} -v ${options[i]} ${source[i]} ${bundle[i]}"
    fi

    if [[ "${command[i]}" = "$SWINSTALL" ]]; then
	SwJob ${command[i]} >&2
    fi
    i=$((i+1))
done
