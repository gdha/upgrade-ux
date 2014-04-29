# 37_verify_stape_monitor.sh
# stape_monitor may not be running an all servers

[[ "$OS_VERSION" = "11.31" ]] && return  # STM not anymore on HP-UX 11.31

ps -ef | grep stape_monitor | grep -v grep > $TMP_DIR/stape_monitor
[[ ! -s $TMP_DIR/stape_monitor ]] && return  # not running which is GOOD

# steps to disable montoring for stape
# we cannot script this (for the moment)
