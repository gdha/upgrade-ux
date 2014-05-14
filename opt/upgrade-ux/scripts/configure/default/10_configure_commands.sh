# 10_configure_commands.sh
count=${#command[@]}
i=0
while (( $i < $count ))
do

    [[ -z "${command[i]}" ]] && continue   # command seems to be empty
    case "${command[i]}" in
        "uncomment_cfg2html_in_crontab" ) touch "$TMP_DIR/uncomment_cfg2html_in_crontab" ;;
	* ) ${command[i]}  ${options[i]} >&2 ;;
    esac
    i=$((i+1))

done
