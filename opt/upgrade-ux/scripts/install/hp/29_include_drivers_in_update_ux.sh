# 29_include_drivers_in_update_ux.sh
# see issue #31 - we better mark network drivers to be updated (as automatic selection is not always peformed)
# This is only required for the update/ux procedure on HP-UX 11.31

# in the prep/hp/61_save_network_drivers_in_use.sh script we wrote in $VAR_TMP/$DS/network.drivers the list
# of network drivers in use by system; now we will populate these into a string : $driver_bundles

driver_bundles=""

if [[ -f "$VAR_DIR/$DS/network.drivers" ]]; then
    cat "$VAR_DIR/$DS/network.drivers" | while read drv
    do
        case "$drv" in
            iether)  driver_bundles="$driver_bundles IEther-00" ;;
	    iexgbe)  driver_bundles="$driver_bundles 10GigEthr-02" ;;
	    igelan)  driver_bundles="$driver_bundles GigEther-01" ;;
	    ixgbe)   driver_bundles="$driver_bundles 10GigEthr-00" ;;
	    gelan)   driver_bundles="$driver_bundles GigEther-00" ;;
	    iqxgbe)  driver_bundles="$driver_bundles 10GigEthr-04" ;;
	    iocxgbe) driver_bundles="$driver_bundles 10GigEthr-03" ;;
	    icxgbe)  driver_bundles="$driver_bundles 10GigEthr-01" ;;
	    hpigssn) driver_bundles="$driver_bundles VirtualBase" ;;
	esac
    done
fi
Log "Network bundles manual selected (forced update): $driver_bundles"
