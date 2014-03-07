# 16_check_nbu_backup.sh
########################
# simple test to see if we are using NetBackup and if yes, we have a recent backup?

[[ ! -x /usr/openv/netbackup/bin/bplist ]] && return   # no NBU sw installed - return

LANG=C /usr/openv/netbackup/bin/bplist -l >/dev/null
if [[ $? -eq 0 ]]; then
    Log "System is defined as NetBackup client and is being backup-ed"
else
    LogPrint "System is not properly configured within NetBackup; please verify"
fi
