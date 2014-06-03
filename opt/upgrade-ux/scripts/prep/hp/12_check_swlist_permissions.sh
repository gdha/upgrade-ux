# 12_check_swlist_permissions.sh
# see issue #10

$SWLIST -l depot -s $SDSERVER > "$TMP_DIR/depot.list"
[[ $? -ne 0 ]] && Error "We cannot read the depot list from the SD server $SDSERVER"

# as test we will try to read the last listed depot from the SDSERVER to verify security or network is ok
$SWLIST -s ${SDSERVER}:$(tail -1 "$TMP_DIR/depot.list" | sed -e 's/^.* //') >/dev/null
[[ $? -ne 0 ]] && Error "RPC exception: \"Connection request timed out (dce / rpc)\""
# the above error may indicate to a too strict firewall rule-set
