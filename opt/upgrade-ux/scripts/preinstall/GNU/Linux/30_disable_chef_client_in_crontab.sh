# 30_disable_chef_client_in_crontab.sh
# We already disabled the crond daemon before, but it gets restarted automatically
# Therefore, we better disable during patching chef-client from running if present

[[ ! -f /var/spool/cron/root ]] && return  # no cron for root, so just return

type -p chef-client 2>/dev/null && CHEFCLIENT="chef-client"
type -p scm-client  2>/dev/null && CHEFCLIENT="scm-client"
type -p cinc-client 2>/dev/null && CHEFCLIENT="cinc-client"
[[ -z "$CHEFCLIENT" ]] && return  # if nor chef-client, scm-client or cinc-client found just return

# we return if chef-client is not found in the crontab of root:
/bin/grep -v "^#" /var/spool/cron/root | /bin/grep -q "$CHEFCLIENT" || return

if (( PREVIEW )) ; then
    Log "Disable $CHEFCLIENT from running via crontab [not done in preview]"
else
    LogPrint "Disable $CHEFCLIENT from running via crontab"
    sed -i '/'"$CHEFCLIENT "'/ s/^/#/' /var/spool/cron/root
fi
