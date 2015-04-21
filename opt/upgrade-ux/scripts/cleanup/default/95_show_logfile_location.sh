# 95_show_logfile_location.sh
LogPrint "The logfile is saved as $LOGFILE"
# make the logfile readable for all users (otherwise only root has access)
chmod 644 $LOGFILE
