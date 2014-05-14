# 80_run_cmds_defined_in_ini.sh
# this script will executed the commands defined in the INI file

count=${#command[@]}
i=0

while (( $i < $count ))
do
    [[ -z "${command[i]}" ]] && continue   # command seems to be empty

    if (( PREVIEW )) ; then
        LogPrint "Executing: ${command[i]}  ${options[i]} [not in preview mode]"
	# ${command[i]}  ${options[i]}
    else
        LogPrint "Executing: ${command[i]}  ${options[i]}"
	${command[i]}  ${options[i]}
    fi
    i=$((i+1))
done
