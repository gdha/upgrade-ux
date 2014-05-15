# 25_kill_cmenqord.sh
# on HP-UX 11.31 with SGeSAP ERS daemon cmenqord running we must be sure
# we kill the daemon before patching otherwise unpredictable things happen

UNIX95= ps -ef | grep cmenqord | grep -v -q grep > "$TMP_DIR/cmenqord"

if [[ -s "$TMP_DIR/cmenqord" ]]; then

    if (( PREVIEW )) ; then
        Log "Kill the cmenqord daemon [not in preview mode]"
    else
        Log "Kill the cmenqord daemon"
        KillProc cmenqord
    fi

fi
