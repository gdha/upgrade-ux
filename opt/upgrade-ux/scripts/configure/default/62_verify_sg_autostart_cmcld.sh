# 62_verify_sg_autostart_cmcld.sh

if [[ -f /etc/cmcluster.conf ]]; then
    . /etc/cmcluster.conf
    # adding the paths to serviceguard executables to the path
    PATH=$PATH:$SGSBIN:$SGLBIN
    export PATH
fi


# The variable $SGAUTOSTART contains the file name of the serviceguard cluster configuration

[[ ! -f $SGAUTOSTART ]] && return    # no serviceguard available

# in the configure phase we check the variable AUTOSTART_CMCLD (we get here after the patching
# and reboot when we restart upgrade-ux to finish with postinstall and configure)
# If AUTOSTART_CMCLD=0 then we give a warning to make it 1 again if this is a cluster node

clustername=$( cmviewcl -f line -l cluster | grep ^name= | awk -F= '{print $2}' )

[[ -z "$clustername" ]] && return  # no clustername found; not a cluster?

if (( $( grep ^AUTOSTART_CMCLD $SGAUTOSTART | awk -F= '{print $2}') )) ; then  # if (( 1 ))
    # node is part of an active cluster
    Log "The cluster node has AUTOSTART_CMCLD=1 (in $SGAUTOSTART) [OK]"
else
    LogPrint "Warning: The cluster node will not start automatically (AUTOSTART_CMCLD=0) (see $SGAUTOSTART)"
fi
