# 82_enable_chef_client_in_crontab.sh
# In case we disabled chef-client we need to re-enable it in root's crontab

/bin/grep "chef-client " /var/spool/cron/root | /bin/grep -q "^#" || return

if (( PREVIEW )) ; then
    Log "Enable chef-client again in crontab of root [not done in preview]"
else
    LogPrint "Enable chef-client again in crontab of root"
    sed -i "/chef-client / s/^#//" /var/spool/cron/root
fi
