# 30_define_sdserver.sh
# This script is company bounded more or less and defines the central Software Depot (SD) Server
# In our INI file we use a variable SDSERVER which is being set by this script
# For sanity reason we built in a ping test to warn the end-user if the SDSERVER is not available
# so he/she can defines it manually in the site.conf or local.conf file

if [[ -z "$SDSERVER" ]]; then

    secdig=$(/usr/bin/netstat -rn | /usr/bin/awk '/default/ && /UG/ { print $2 | "/usr/bin/tail -1" }' | /usr/bin/cut -d. -f2)

    case $secdig in
    +([0-9]))
        if (( secdig == 0 )); then
            SDSERVER=10.0.54.159  # lab (bl870ci2)
	elif (( secdig == 128 || secdig <= 191 )); then
	    SDSERVER=10.130.47.84 # EMEA (hpx210)
	else
	    SDSERVER=10.36.112.20   # all other regions go to itsblp02
	fi
	;;
    *)
	SDSERVER=10.36.112.20 # default (itsblp02)
	;;

    esac
    Log "Defined variable SDSERVER=$SDSERVER (as our Software Depot Server)"

fi


x=$( PingSystem $SDSERVER )
if (( x == 1 )); then
    Error "Software Depot Server $SDSERVER not reachable from $lhost"
elif (( x == 2 )); then
    Error "Software Depot Server $SDSERVER unknown - please define SDSERVER in $ETC_DIR/local.conf"
else
   Log "Software Depot Server $SDSERVER is reachable via ping"
fi

