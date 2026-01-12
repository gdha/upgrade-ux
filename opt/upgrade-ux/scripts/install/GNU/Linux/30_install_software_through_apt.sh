# install/GNU/Linux/30_install_software_through_yum.sh

[[ ! -x $APT ]] && return   # Not Debian-alike system

[ "$CURRENT_STATE" = "$stage:ended" ] && return  # after reboot perhaps

### in out INI file we have something like:
#        command[0]      =       $APT-GET
#        options[0]      =       ""
#        source[0]       =       ""
#        bundle[0]       =       "upgrade"
#        version[0]      =       ""

# the source[] and version[] will always be empty on Linux

# On Debian exclude_packages="" as we hold the excluded packages via apt-mark 
exclude_packages=""

count=${#bundle[@]}
i=0

while (( i < count ))
do
    if (( PREVIEW )) ; then
        LogPrint "${command[i]} ${options[i]} --assume-no ${bundle[i]} ${exclude_packages}"
        printf "${command[i]} ${options[i]} --assume-no ${bundle[i]} ${exclude_packages}" >> "$VAR_DIR/$DS/sw_installation_in_progress"
        ${command[i]} ${options[i]} --assume-no ${bundle[i]} ${exclude_packages}
        ${command[i]} ${options[i]} --assume-no ${bundle[i]} ${exclude_packages} >&2
        rc=$?
    else
        LogPrint "${command[i]} ${options[i]} --assume-yes ${bundle[i]} ${exclude_packages}"
        printf "${command[i]} ${options[i]} --assume-yes ${bundle[i]} ${exclude_packages}" >> "$VAR_DIR/$DS/sw_installation_in_progress"
        ${command[i]} ${options[i]} --assume-no  ${bundle[i]} ${exclude_packages} >&2   # to catch the updates in the logfile
        ${command[i]} ${options[i]} --assume-yes ${bundle[i]} ${exclude_packages}       # to actually install the updates without manual intervention
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
    ((i=i+1))
done

