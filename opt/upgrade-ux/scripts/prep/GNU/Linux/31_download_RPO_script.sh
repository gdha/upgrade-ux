# prep/GNU/Linux/31_download_RPO_script.sh

# We do this as sson as possible if we bail out we did not moved any repos yet

# This script is only meaningful for one particular customer
# Therefore, do not worry too much about what it is doing

[[ -f /etc/jnj-install.cfg ]] && source /etc/jnj-install.cfg
[[ -f /etc/jnj-install/config ]] && source /etc/jnj-install/config

# This is the location (http address) where we can find the script
# to configure the location yum repos (RHEL or SLES)
configvar=dmlurl

if [[ -z $(eval "echo \$$configvar") ]]; then
    LogPrint "No '$dmlurl' variable defined. We do 'not' add yum repos automatically."
    # we do a return so upgrade-ux works for all customers
    return
else
    Log "Downloading script GAB-RHEL-RPO.sh"
    # How sure are we that we have an updated GAB-RHEL-RPO.sh script available?
    # It could well be an old one
    wget --no-verbose ${dmlurl}/scripts/GAB-RHEL-RPO.sh -O $VAR_DIR/$DS/GAB-RHEL-RPO.sh >&2
fi

if [[ -s "$VAR_DIR/$DS/GAB-RHEL-RPO.sh" ]] ; then

    checksum=$( cksum "$VAR_DIR/$DS/GAB-RHEL-RPO.sh" | awk '{print $1}' )
    Log "Checksum of script GAB-RHEL-RPO.sh is $checksum"
    grep -q $YEAR "$VAR_DIR/$DS/GAB-RHEL-RPO.sh"
    if [ $? -eq 0 ] ; then
        # We found repo for this YEAR defined (still not sure of which quarter): TODO??
        LogPrint "Repositories we will define to do patch management with are:"
        grep $YEAR "$VAR_DIR/$DS/GAB-RHEL-RPO.sh" | grep "^name=" | cut -d= -f2
        grep $YEAR "$VAR_DIR/$DS/GAB-RHEL-RPO.sh" | grep "^name=" | cut -d= -f2 >&2
        # we think we have a good version of the script we can return now
        return
    else
        Log "WARNING: No repositories found for year $YEAR in downloaded version of GAB-RHEL-RPO.sh"
        # We continue after the if-block with the alternative method
    fi

fi

# Fail-safe location: we manually made sure the script was copied (ansible) to /usr/local/bin
if [[ -x /usr/local/bin/GAB-RHEL-RPO.sh ]] ; then
    Log "Found second copy : /usr/local/bin/GAB-RHEL-RPO.sh"
    cp -f $v /usr/local/bin/GAB-RHEL-RPO.sh "$VAR_DIR/$DS/GAB-RHEL-RPO.sh"
else
    Error "GAB-RHEL-RPO.sh does not contain patches for year $YEAR (ask SDDC team)"
fi

