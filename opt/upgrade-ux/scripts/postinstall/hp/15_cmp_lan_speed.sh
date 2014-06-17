# 15_cmp_lan_speed.sh

[[ -f "$VAR_TMP/$DS/lan_interfaces_speed.before" ]]  &&  return  # nothing to compare with

(

for lan in $(/usr/sbin/lanscan -n )
do
    echo "NetMgntID \t\t\t= $lan"
    lanadmin -x $lan 2> /dev/null
    echo " "
done

) > "$VAR_DIR/$DS/lan_interfaces_speed.after"

cmp -s "$VAR_TMP/$DS/lan_interfaces_speed.before" "$VAR_DIR/$DS/lan_interfaces_speed.after"
if (( $? == 1 )) ; then
    LogPrint "WARNING: lan speed seems to be different after the reboot!"
    sdiff -s "$VAR_TMP/$DS/lan_interfaces_speed.before" "$VAR_DIR/$DS/lan_interfaces_speed.after"
    sdiff -s "$VAR_TMP/$DS/lan_interfaces_speed.before" "$VAR_DIR/$DS/lan_interfaces_speed.after"  >&2
    LogPrint "===>> Fix this immediately!"
fi
