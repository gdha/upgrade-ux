# 50_adapt_sg_autostart_cmcld.sh
# Script is intented to deal with issue #61
# We already have a similar script in place configure/default/62_verify_sg_autostart_cmcld.sh
# which prints a warning in the log file. However, as nobody reads the logs afterwards...
if [[ -f /etc/cmcluster.conf ]]; then
    . /etc/cmcluster.conf
fi

# The variable $SGAUTOSTART contains the file name of the serviceguard cluster configuration

[[ ! -f $SGAUTOSTART ]] && return    # no serviceguard available
# script prep/default/62_sg_autostart_cmcld.sh created the "$VAR_DIR/$DS/cmcluster.before"
[[ ! -f "$VAR_DIR/$DS/$(basename $SGAUTOSTART).before" ]] && return

# in the configure phase we check the variable AUTOSTART_CMCLD (we get here after the patching
# and reboot when we restarted upgrade-ux to finish with postinstall and configure)
# If AUTOSTART_CMCLD=0 then we will make it 1 if we are dealing with a cluster

clustername=$( cmviewcl -f line -l cluster | grep ^name= | awk -F= '{print $2}' )
[[ -z "$clustername" ]] && return  # no clustername found; not a cluster?

cl_status=$( cmviewcl -f line -l cluster | grep ^status= | awk -F= '{print $2}' )

if (( $( grep ^AUTOSTART_CMCLD $SGAUTOSTART | awk -F= '{print $2}') )) ; then  # if (( 1 ))
    : # setting is correct (1)
else
    # The cluster node will not start automatically due to AUTOSTART_CMCLD=0 setting in $SGAUTOSTART file
    LogPrint "Cluster $clustername status is currently \"$cl_status\""
    if (( PREVIEW )) ; then
        LogPrint "Changing variable AUTOSTART_CMCLD to 1 in $SGAUTOSTART [not in preview mode)"
    else
        LogPrint "Changing variable AUTOSTART_CMCLD to 1 in $SGAUTOSTART"
        sed -e 's/^AUTOSTART_CMCLD=0/AUTOSTART_CMCLD=1/' < "$VAR_DIR/$DS/$(basename $SGAUTOSTART).before" > "$VAR_DIR/$DS/$(basename $SGAUTOSTART).after"
        # when cmcluster.before had AUTOSTART_CMCLD=1 it won't be changed, so we can safely copy file cmcluster.after to $SGAUTOSTART
        cp "$VAR_DIR/$DS/$(basename $SGAUTOSTART).after" $SGAUTOSTART
        chown bin:bin $SGAUTOSTART  # apply correct ownership
        chmod 544 $SGAUTOSTART      # apply correct security mode
    fi
fi
