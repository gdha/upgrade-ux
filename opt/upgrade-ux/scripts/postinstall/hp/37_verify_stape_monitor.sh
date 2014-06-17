# 37_verify_stape_monitor.sh
# stape_monitor may not be running an all servers

[ "$OS_VERSION" = "11.31" ] && return  # STM not supported anymore on HP-UX 11.31

ps -ef | grep stape_monitor | grep -v grep > $TMP_DIR/stape_monitor
[[ ! -s $TMP_DIR/stape_monitor ]] && return  # not running which is GOOD

# steps to disable montoring for stape
[[ ! -x /etc/opt/resmon/lbin/monconfig ]] && return

Log "Disable monitoring"
/etc/opt/resmon/lbin/monconfig <<EOF
K
Y
Q
EOF

Log "Disable stape monitoring"
if [[ -f /usr/sbin/stm/uut/bin/tools/monitor/dm_stape ]]; then
    [[ ! -d /usr/sbin/stm/uut/bin/tools/monitor/org ]] && mkdir /usr/sbin/stm/uut/bin/tools/monitor/org
    mv /usr/sbin/stm/uut/bin/tools/monitor/dm_stape /usr/sbin/stm/uut/bin/tools/monitor/org
fi

if [[ -f /etc/opt/resmon/dictionary/dm_stape.dict ]]; then
    [[ ! -d /etc/opt/resmon/dictionary/org ]] && mkdir /etc/opt/resmon/dictionary/org
    mv /etc/opt/resmon/dictionary/dm_stape.dict /etc/opt/resmon/dictionary/org
fi

if [[ -f /var/stm/data/tools/monitor/dm_stape.hwa ]]; then
    [[ ! -d /var/stm/data/tools/monitor/org ]] && mkdir /var/stm/data/tools/monitor/org
    mv /var/stm/data/tools/monitor/dm_stape.hwa /var/stm/data/tools/monitor/org
fi

Log "Enable monitoring"
/etc/opt/resmon/lbin/monconfig <<EOF
E
Q
EOF

