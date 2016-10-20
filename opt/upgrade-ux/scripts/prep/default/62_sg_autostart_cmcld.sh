# 62_sg_autostart_cmcld.sh

# The variable $SGAUTOSTART contains the file name of the serviceguard cluster configuration
# The sourcing has been done via script 05__source_cmcluster_conf.sh

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

# we will save a copy of the $SGAUTOSTART file
[[ -f "$VAR_DIR/$DS/$(basename $SGAUTOSTART).before" ]]  && return  # once if enough
cp -p $SGAUTOSTART "$VAR_DIR/$DS/$(basename $SGAUTOSTART).before"
