# 62_sg_autostart_cmcld.sh

# The variable $SGAUTOSTART contains the file name of the serviceguard cluster configuration

[[ ! -f $SGAUTOSTART ]] && return    # no serviceguard available

# in the prep phase we check the variable AUTOSTART_CMCLD

if (( $( grep ^AUTOSTART_CMCLD $SGAUTOSTART | awk -F= '{print $2}') )) ; then  # if (( 1 ))
    # node is part of an active cluster
    if (( PREVIEW )) ; then
        LogPrint "The cluster node should have AUTOSTART_CMCLD=0 (in $SGAUTOSTART) [not in preview mode]"
    else
	LogPrint "The cluster node should have AUTOSTART_CMCLD=0 (in $SGAUTOSTART)"
    fi
else
    Log "The cluster node will not start after reboot (AUTOSTART_CMCLD=0) (see $SGAUTOSTART)"
fi
