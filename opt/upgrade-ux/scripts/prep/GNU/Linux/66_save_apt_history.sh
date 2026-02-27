# 66_save_apt_history.sh
# If found we will save the last 3 /var/log/history.log* files

[[ ! -d /var/log/apt ]] && return  # if the directory does not exist return

log "Save the 3 most recent history.log files in directory $VAR_DIR/$DS"

if [[ -f /var/log/apt/history.log ]] ; then
    cp /var/log/apt/history.log "$VAR_DIR/$DS/"
elif [[ -f /var/log/apt/history.log.1.gz ]] ; then
    cp /var/log/apt/history.log.1.gz "$VAR_DIR/$DS/"
elif [[ -f /var/log/apt/history.log.2.gz ]] ; then
    cp /var/log/apt/history.log.2.gz "$VAR_DIR/$DS/"
fi
