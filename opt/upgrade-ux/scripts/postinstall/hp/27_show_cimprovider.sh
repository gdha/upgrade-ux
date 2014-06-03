# 27_show_cimprovider.sh
# show all cimproviders which do not have the OK flag (informative)
[[ ! -x /opt/wbem/bin/cimprovider ]] && return  # if not there we do not care (in this stage)

# need to check if cimserver is running - see issue #9
ps -ef | grep cimservermain | grep -vq grep
if [[ $? -eq 1 ]] ; then
    # start cimserver
    Log "Note: cimserver was not running - starting it now"
    [[ -x /opt/wbem/sbin/cimserver ]] && /opt/wbem/sbin/cimserver  >&2
fi

/opt/wbem/bin/cimprovider -ls > "$VAR_DIR/$DS/${HOSTNAME}_cimprovider.after"

grep -v "^MODULE" "$VAR_DIR/$DS/${HOSTNAME}_cimprovider.after" | grep -vq "OK"
if (( $? == 0 )) ; then
    LogPrint "Some cim provider agents have another status then OK:"
    grep -v "^MODULE" "$VAR_DIR/$DS/${HOSTNAME}_cimprovider.after" | grep -v "OK"
    grep -v "^MODULE" "$VAR_DIR/$DS/${HOSTNAME}_cimprovider.after" | grep -v "OK" >&2
fi
