# 27_show_cimprovider.sh
# show all cimproviders which do not have the OK flag (informative)
[[ ! -x /opt/wbem/bin/cimprovider ]] && return  # if not there we do not care (in this stage)

/opt/wbem/bin/cimprovider -ls > "$VAR_DIR/${HOSTNAME}_cimprovider_before.${DS}"

grep -v "^MODULE" "$VAR_DIR/${HOSTNAME}_cimprovider_before.${DS}" | grep -vq "OK"
if (( $? == 0 )) ; then
    LogPrint "Some cim provider agents have another status then OK:"
    grep -v "^MODULE" "$VAR_DIR/${HOSTNAME}_cimprovider_before.${DS}" | grep -v "OK"
fi
