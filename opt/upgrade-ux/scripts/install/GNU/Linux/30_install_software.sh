# install/GNU/Linux/30_install_software.sh

[ "$CURRENT_STATE" = "$stage:ended" ] && return  # after reboot perhaps

### in out INI file we have something like:
#        command[0]      =       $YUM
#        options[0]      =       "--disableplugin=fastestmirror"
#        source[0]       =       ""
#        bundle[0]       =       "list-sec"
#        version[0]      =       ""

# the source[] and version[] will always be empty on Linux

count=${#bundle[@]}
i=0

while (( i < count ))
do
    if (( PREVIEW )) ; then
        LogPrint "${command[i]} ${options[i]} --assumeno ${bundle[i]}"
        printf "${command[i]} ${options[i]} --assumeno ${bundle[i]}" >> "$VAR_DIR/$DS/sw_installation_in_progress"
        ${command[i]} ${options[i]} --assumeno ${bundle[i]}
        ${command[i]} ${options[i]} --assumeno ${bundle[i]} >&2
        rc=$?
    else
        LogPrint "${command[i]} ${options[i]} ${bundle[i]}"
        printf "${command[i]} ${options[i]} --assumeyes ${bundle[i]}" >> "$VAR_DIR/$DS/sw_installation_in_progress"
        ${command[i]} ${options[i]} --assumeno ${bundle[i]} >&2   # to catch the updates in the logfile
        ${command[i]} ${options[i]} --assumeyes ${bundle[i]}      # to actually install the updates without manual intervention
        rc=$?
    fi

    # Returns  exit  value  of  100 if there are packages available for an update.
    # Returns 0 if no packages are available for update.
    # Returns 1  if  an  error occurred.
    printf " rc=$rc\n" >> "$VAR_DIR/$DS/sw_installation_in_progress"
    case $rc in
      100) Log "Packages available for an update" ;;
        *) LogPrint "Return code is $rc for: ${command[i]} ${options[i]} ${bundle[i]}" ;;
    esac
    i=$((i+1))
done

