# 40_run_additional_cmds.sh
# if the INI file contains additional commands to run then do it hear
count=${#command[@]}
i=0
while (( $i < $count ))
do
    if (( PREVIEW )) ; then
        Log "Running ${command[i]} ${options[i]} [not done in preview]"
    else
        LogPrint "Running ${command[i]} ${options[i]}"
	${command[i]} ${options[i]} >&2
    fi
    i=$((i+1))
done
