# 55_hpsim_cleanup_subscriptions.sh
# to remove old HPSIM/HP WEBES subscriptions from HP SIM servers
[[ ! -x /usr/local/bin/cleanup_subscriptions.sh ]] && return

if (( PREVIEW )) ; then
    /usr/local/bin/cleanup_subscriptions.sh -d  >&2
else
    /usr/local/bin/cleanup_subscriptions.sh     >&2
fi
