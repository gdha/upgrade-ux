# 30_install_bundles.sh

[[ "$CURRENT_STATE" == "$stage:ended" ]] && return  # after reboot perhaps

count=${#bundle[@]}
i=0

# we need to retrieve the correct OEM version of HP-UX as we need it for update-ux
OEMVER=$( $SWLIST -l bundle -a os_release | grep HPUX11i | awk '{print $1}' )
LogPrint "System $lhost has HP-UX version $OEMVER installed"

while (( i < count ))
do
    if [[ "${command[i]}" == "/usr/sbin/update-ux" ]]; then
        my_bundle="${OEMVER} ${bundle[i]}"
    else
        my_bundle="${bundle[i]}"
    fi

    # if version[i] is not empty we should add ",r=version[i]" to my_bundle
    if [[ ! -z "${version[i]}" ]]; then
        my_bundle="$my_bundle,r=${version[i]}"
    fi

    if (( PREVIEW )) ; then
        LogPrint "${command[i]} -p -v ${options[i]} ${source[i]} $my_bundle"
	printf "${command[i]} -p -v ${options[i]} ${source[i]} $my_bundle" >> "$VAR_DIR/$DS/sw_installation_in_progress"
	${command[i]} -p -v ${options[i]} ${source[i]} "$my_bundle"
	rc=$?
    else
        LogPrint "${command[i]} -v ${options[i]} ${source[i]} $my_bundle"
	printf "${command[i]} -v ${options[i]} ${source[i]} $my_bundle" >> "$VAR_DIR/$DS/sw_installation_in_progress"
        ${command[i]} -v ${options[i]} ${source[i]} "$my_bundle"
	rc=$?
    fi

    printf " rc=$rc\n" >> "$VAR_DIR/$DS/sw_installation_in_progress"
    if (( rc > 0 )); then
        LogPrint "Error detected: ${command[i]} -v ${options[i]} ${source[i]} $my_bundle"
    fi

    # if command=swinstall the run SwJob; if command=update-ux show update-ux.log
    if [[ "${command[i]}" == "$SWINSTALL" ]]; then
	SwJob ${command[i]} >&2
    elif [[ "${command[i]}" == "/usr/sbin/update-ux" ]]; then
	#TODAY=$(date | awk '{print $1, $2, $3}')
        #echo $(SurroundingGrep 0 1000 "$TODAY" /var/adm/sw/update-ux.log) >&2
        tail -20 /var/opt/swm/swm.log >&2
    fi
    i=$((i+1))
done
