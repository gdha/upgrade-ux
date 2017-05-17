# prep/GNU/Linux/41_configure_yum_repos.sh

# This script is only meaningful for one particular customer
# Therefore, do not worry too much about what it is doing

[[ -f /etc/jnj-install.cfg ]] && source /etc/jnj-install.cfg
[[ -f /etc/jnj-install/config ]] && source /etc/jnj-install/config

# This is the location (http address) where we can find the script
# to configure the location yum repos (RHEL or SLES)

if [[ -s "$VAR_DIR/$DS/GAB-RHEL-RPO.sh" ]] ;
    Log "Executing script GAB-RHEL-RPO.sh"
    bash "$VAR_DIR/$DS/GAB-RHEL-RPO.sh" >&2
fi
