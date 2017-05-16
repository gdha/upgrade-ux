# postexecute/GNU/Linux/60_save_satellite_info.sh

# save and compare the subscribed rhn satellite channels

if (( rhn_satellite_subscription )) ; then
    # only required if we have a valid rhn subscription
    rhn-channel -b > "$VAR_DIR/$DS/satellite.subscribed.channel.after"
    [[ ! -f "$VAR_DIR/$DS/satellite.subscribed.channel.before" ]] && return  # nothing to compare with
    cmp -s "$VAR_DIR/$DS/satellite.subscribed.channel.before" "$VAR_DIR/$DS/satellite.subscribed.channel.after"
    if (( $? == 1 )); then
        LogPrint "Redhat Satellite Subscription was modified:"
        sdiff -s "$VAR_DIR/$DS/satellite.subscribed.channel.before" "$VAR_DIR/$DS/satellite.subscribed.channel.after"
        sdiff -s "$VAR_DIR/$DS/satellite.subscribed.channel.before" "$VAR_DIR/$DS/satellite.subscribed.channel.after" >&2
    fi
fi
