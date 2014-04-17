# 25_check_serviceguard.sh
# verify if HP SG is active

[[ ! -x $CMVIEWCL ]] && return     # not a cluster

$CMVIEWCL -v 2>/dev/null > $VAR_DIR/cmviewcl.txt

CLNAME=$( head -3 $VAR_DIR/cmviewcl.txt | tail -1 | awk '{print $1}' )
CLstatus=$( head -3 $VAR_DIR/cmviewcl.txt | tail -1 | awk '{print $2}' )
SGversion=$( $SWLIST | grep -E '(T1905BA|T1905CA|B3935DA)' | awk '{print $2}' )
NodeStatus=$( $CMVIEWCL -f line -l node | grep status | cut -d= -f2 )

# what is the highest SG patch installed
if [[ -f $VAR_DIR/${HOSTNAME}_show_patches.before ]]; then
    SGpatch=$( grep -i serviceguard $VAR_DIR/${HOSTNAME}_show_patches.before | grep PHSS | tail -1 | awk '{print $1}' )
else
    SGpatch=$( $SWLIST -l patch | grep -i serviceguard | grep PHSS | tail -1 | awk '{print $1}' | cut -d. -f1 )
fi

SGminnr=${SGversion#A.11.}              # A.11.16.00 => 16.00
SGminnr=${SGminnr%.00}                  # 16.00 => 16
SGpatchnr=${SGpatch#PHSS_}              # PHSS_43094 => 43094


Log "Cluster $CLNAME (version $SGversion - latest patch $SGpatch) is ${CLstatus}"

if [[ "${NodeStatus}" = "up" ]]; then
    if (( PREVIEW )) ; then
        Log "The node ($HOSTNAME) cluster status (${NodeStatus}) should be \"down\" when running $PRODUCT"
    else
        LogPrint "The node ($HOSTNAME) cluster status (${NodeStatus}) should be \"down\" when running $PRODUCT"
	EnterNextStageAllowed="N"
    fi
fi
