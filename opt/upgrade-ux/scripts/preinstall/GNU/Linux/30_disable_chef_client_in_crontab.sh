# 30_disable_chef_client_in_crontab.sh
# We already disabled the crond daemon before, but it gets restarted automatically
# Therefore, we better disable during patching chef-client from running if present

# we return if chef-client is not found in the crontab of root:
/bin/grep -v "^#" /var/spool/cron/root | /bin/grep -q "chef-client " || return

if (( PREVIEW )) ; then
    Log "Disable chef-client from running via crontab [not done in preview]"
else
    LogPrint "Disable chef-client from running via crontab"
    sed -i "/chef-client / s/^/#/" /var/spool/cron/root
fi
