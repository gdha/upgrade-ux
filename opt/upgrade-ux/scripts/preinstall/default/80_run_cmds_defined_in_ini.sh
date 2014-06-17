# 80_run_cmds_defined_in_ini.sh
# this script will executed the commands defined in the INI file

count=${#command[@]}
i=0

while (( i < count ))
do
    if [[ -z "${command[i]}" ]]; then
        i=$((i+1))
        continue   # command seems to be empty
    fi

    if (( PREVIEW )) ; then
        LogPrint "Executing: ${command[i]}  ${options[i]} [not in preview mode]"
	# ${command[i]}  ${options[i]}
    else
	if [[ -x "${command[i]}" ]]; then
            LogPrint "Executing: ${command[i]}  ${options[i]}"
	    ${command[i]}  ${options[i]}
	else
            Log "Command ${command[i]} not found [skipping]"
	fi
    fi
    i=$((i+1))
done
