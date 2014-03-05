#!/sbin/sh
# upgrade-ux configure

########

    UTILS="/usr/lbin/sw/control_utils"
    if [[ ! -f $UTILS ]]
    then
        /usr/bin/echo "ERROR: Cannot find $UTILS"
        exit 1
    fi
    . $UTILS
    exitval=$SUCCESS                           # Anticipate success

################################################################################


######################################
####            M A I N           ####
######################################


exit $exitval
