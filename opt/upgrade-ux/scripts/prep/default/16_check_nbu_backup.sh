# 16_check_nbu_backup.sh
########################
# simple test to see if we are using NetBackup and if yes, we have a recent backup?

[[ ! -x /usr/openv/netbackup/bin/bpps ]] && return   # no NBU sw installed - return

# bplist returns on Linux "EXIT STATUS 227: no entity was found". However, NBU is working fine.
# LANG=C /usr/openv/netbackup/bin/bplist -l >/dev/null

# bpps works rqual on HP-UX and Linux and is therefore a better test
LANG=C /usr/openv/netbackup/bin/bpps >/dev/null
if (( $? == 0 )) ; then
    Log "System is defined as NetBackup client and is being backup-ed"
else
    LogPrint "System is not properly configured within NetBackup; please verify"
fi
