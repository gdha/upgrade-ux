# postexecute/GNU/Linux/85_update_major_release_in_config.sh
# script is only useful for one specific customer
[[ ! -f /etc/jnj-install/config ]] && return

# grep VERSION_ID /etc/os-release
# VERSION_ID="7.5"

if (( PREVIEW )) ; then
    : # do nothing and say nothing
else
    if [[ -f /etc/os-release ]] ; then
        kernel_ver=$( grep VERSION_ID /etc/os-release | cut -d= -f 2 | sed -e 's/"//g' )
    elif [[ -f /etc/redhat-release ]] ; then
        kernel_ver=$( awk '{print $7'} /etc/redhat-release )
    else
        return
    fi
    majnr=$( echo $kernel_ver | cut -c1-1 )  # 7
    LogPrint "Update dmlurl in config"
    sed -i.$(date +%F) -e "/^dmlurl=/s/RHEL${majnr}.*/RHEL${majnr}\/${kernel_ver}.00/g" /etc/jnj-install/config
fi

