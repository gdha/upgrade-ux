# 35_sshd_config_sftp_fix.sh

[[ ! -f /opt/ssh/etc/sshd_config ]]  &&  return   # no sshd_config found on the place we expected

[[ "$OS_VERSION" != "11.11" ]]       && return    # is only meant for HP-UX 11.11

[[ ! -f "$VAR_DIR/$DS/sshd_config.before" ]] && cp /opt/ssh/etc/sshd_config "$VAR_DIR/$DS/sshd_config.before"

##    #-> /opt/ssh/sbin/sshd (on HP-UX 11.11 only)
##    /opt/ssh/etc/sshd_config: line 132: Bad configuration option: LogSftp
##    /opt/ssh/etc/sshd_config: line 133: Bad configuration option: SftpLogFacility
##    /opt/ssh/etc/sshd_config: line 134: Bad configuration option: SftpLogLevel
##    /opt/ssh/etc/sshd_config: terminating, 3 bad configuration options
##    Fix: comment out above options

grep -v ^\#  "$VAR_DIR/$DS/sshd_config.before" | grep -q -E '(SftpLog|LogSftp)'
if [[ $? -eq 0 ]]; then
    # we must put these lines in comment
    rm -f "$VAR_DIR/$DS/sshd_config.after"
    cat "$VAR_DIR/$DS/sshd_config.before" | while read LINE
    do
        SFTP=$( echo "$LINE" | awk '{print $1}' )
	case "$SFTP" in
            "LogSftp"|"SftpLogFacility"|"SftpLogLevel") 
	         echo "\# $LINE" >> "$VAR_DIR/$DS/sshd_config.after"   ;;
	    * )  echo "$LINE" >> "$VAR_DIR/$DS/sshd_config.after"      ;;
	esac
    done
fi

[[ ! -f "$VAR_DIR/$DS/sshd_config.after" ]] && return  # file does not exist; so it was already ok

if (( PREVIEW )) ; then
    Log "Following lines must be disabled in /opt/ssh/etc/sshd_config [not in preview mode]"
    grep Sftp "$VAR_DIR/$DS/sshd_config.after" >&2
else
    LogPrint "Following lines will be disabled in /opt/ssh/etc/sshd_config"
    grep Sftp "$VAR_DIR/$DS/sshd_config.after" >&2
    cp "$VAR_DIR/$DS/sshd_config.after" /opt/ssh/etc/sshd_config
    Log "Updated the /opt/ssh/etc/sshd_config file"
fi
