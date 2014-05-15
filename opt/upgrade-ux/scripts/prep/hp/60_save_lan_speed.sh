# 60_save_lan_speed.sh

[[ -f "$VAR_TMP/$DS/lan_interfaces_speed.txt" ]]  &&  return  # we already have the file

(

for lan in $(/usr/sbin/lanscan -n )
do
    echo "NetMgntID \t\t\t= $lan"
    lanadmin -x $lan 2> /dev/null
    echo " "
done

) > "$VAR_DIR/$DS/lan_interfaces_speed.txt"
