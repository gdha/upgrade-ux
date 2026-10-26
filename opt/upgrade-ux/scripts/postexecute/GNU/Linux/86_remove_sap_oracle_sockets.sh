# 86_remove_sap_oracle_sockets.sh
# If for some reason SAP Oracle was started as user 'oracle' before patching then
# it may block the startup of SAP listener after the reboot as the owner should not
# be user 'oracle', but something like 'oras30' where s30 is the lowercase SID value.
# When that happens we will get an error like:
#-> systemctl status sapdb-listener.service
# ● sapdb-listener.service - SAP Oracle Listener D30
#   Loaded: loaded (/etc/systemd/system/sapdb-listener.service; enabled; vendor preset: disabled)
#  Drop-In: /etc/systemd/system/sapdb-listener.service.d
#           └─sapdb-listener.conf
#   Active: failed (Result: exit-code) since Mon 2026-10-19 08:58:25 CEST; 1min 45s ago
#  Process: 4336 ExecStart=/etc/systemd/system/sapdb-listener.service.d/sapdb-listener.sh start (code=exited, status=1/FAILURE)
#  Process: 3827 ExecStartPre=/bin/sleep 3 (code=exited, status=0/SUCCESS)
#Oct 19 08:58:25 ITSGBHHLSP00463 sapdb-listener.sh[4501]: Log messages written to /oracle/D30/saptrace/diag/tnslsnr/ITSGBHHLSP00463/listener_d30/alert/log.xml
#Oct 19 08:58:25 ITSGBHHLSP00463 sapdb-listener.sh[4501]: Error listening on: (ADDRESS=(PROTOCOL=IPC)(KEY=D30.JNJ.COM))
#Oct 19 08:58:25 ITSGBHHLSP00463 sapdb-listener.sh[4501]: TNS-12555: TNS:permission denied
#Oct 19 08:58:25 ITSGBHHLSP00463 sapdb-listener.sh[4501]:  TNS-12560: TNS:protocol adapter error
#Oct 19 08:58:25 ITSGBHHLSP00463 sapdb-listener.sh[4501]:   TNS-00525: Insufficient privilege for operation
#Oct 19 08:58:25 ITSGBHHLSP00463 sapdb-listener.sh[4501]:    Linux Error: 1: Operation not permitted

function remove_sap_oracle_sockets {
    # The Oracle IPC key sockets are created below /var/tmp/.oracle and/or /tmp/.oracle
    # When SAP Oracle was started as user 'oracle' (instead of the 'ora<sid>' user) before
    # patching, these socket files are owned by 'oracle' and block the 'ora<sid>' user from
    # (re)creating them, resulting in the TNS-12555 permission denied error after a reboot.
    # We only remove the socket files that are owned by user 'oracle' so they get recreated
    # with the correct ownership when the listener starts.
    socket_dir=""
    socket_file=""
    removed=0

    for socket_dir in /var/tmp/.oracle /tmp/.oracle ; do
        [[ -d "$socket_dir" ]] || continue
        # Only act on socket files (not directories) owned by user 'oracle'
        while IFS= read -r socket_file ; do
            [[ -n "$socket_file" ]] || continue
            LogPrint "Remove stale SAP Oracle socket owned by 'oracle': $socket_file"
            rm -f "$socket_file" && removed=$(( removed + 1 ))
        done < <(find "$socket_dir" -mindepth 1 ! -type d -user oracle 2>/dev/null)
    done

    if (( removed == 0 )) ; then
        Log "No SAP Oracle socket files owned by user 'oracle' were found - nothing to remove"
    else
        Log "Removed $removed SAP Oracle socket file(s) owned by user 'oracle'"
    fi
}

if (( PREVIEW )) ; then
    : # do nothing and say nothing
else
    # An SAP Oracle DB system must have the /etc/oratab file
    if [[ -f /etc/oratab ]] ; then
       mount -v | grep -q '/usr/sap ' || return  # return when we do not have a mounted file system /usr/sap

       # Derive the lowercase SID(s) from the active entries in /etc/oratab.
       # Valid entries look like:  SID:ORACLE_HOME:<Y|N>  (comments start with '#')
       SAP_ORACLE_SIDS=$( grep -E '^[A-Za-z0-9]+:.*:.*' /etc/oratab 2>/dev/null \
                          | grep -v '^#' | cut -d: -f1 | sort -u | tr '[:upper:]' '[:lower:]' )
       if [[ -z "$SAP_ORACLE_SIDS" ]] ; then
          Log "No SAP Oracle SID found in /etc/oratab - nothing to do"
          return
       fi
       Log "Found SAP Oracle SID(s) in /etc/oratab: $( echo $SAP_ORACLE_SIDS | tr '\n' ' ' )"

       remove_sap_oracle_sockets
    fi
fi
