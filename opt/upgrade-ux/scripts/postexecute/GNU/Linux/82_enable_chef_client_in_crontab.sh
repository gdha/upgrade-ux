# 82_enable_chef_client_in_crontab.sh
# In case we disabled chef-client we need to re-enable it in root's crontab

[[ ! -f /var/spool/cron/root ]] && return

type -p chef-client >/dev/null 2>&1 && CHEFCLIENT="chef-client"
type -p scm-client  >/dev/null 2>&1 && CHEFCLIENT="scm-client"
type -p cinc-client >/dev/null 2>&1 && CHEFCLIENT="cinc-client"
[[ -z "$CHEFCLIENT" ]] && return  # if nor chef-client, scm-client or cinc-client found just return

/bin/grep "$CHEFCLIENT " /var/spool/cron/root | /bin/grep -q "^#" || return

if (( PREVIEW )) ; then
    Log "Enable $CHEFCLIENT again in crontab of root [not done in preview]"
else
    LogPrint "Enable $CHEFCLIENT again in crontab of root"
    sed -i '/'"$CHEFCLIENT "'/ s/^#//' /var/spool/cron/root
fi
