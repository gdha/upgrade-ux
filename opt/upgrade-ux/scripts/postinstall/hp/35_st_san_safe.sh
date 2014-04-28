# 35_st_san_safe.sh
#
# if HP has local tape devices in use we should check tape devices
[[ ! -f "$VAR_DIR/tape_devices" ]] && return

case "$OS_VERSION" in
    11.11)
        #/usr/sbin/kmtune -q st_san_safe
	#Parameter             Current Dyn Planned                    Module     Version
	#===============================================================================
	#st_san_safe                 1  -  1

	/usr/sbin/kmtune -q st_san_safe 2>/dev/null | tail -1 | grep -q 1
        if [[ $? -eq 0 ]]; then
            Log "Kernel tunable st_san_safe is set to 1 [ok]"
	else
            LogPrint "WARNING: Kernel tunable st_san_safe is not set to 1"
	    LogPrint "We will set st_san_safe to 1"
	    /usr/sbin/kmtune -s st_san_safe=1 >&2
	fi
        ;;
    11.23|11.31)
        /usr/sbin/kctune -q st_san_safe 2>/dev/null | tail -1 | grep -q 1
	if [[ $? -eq 0 ]]; then
            Log "Kernel tunable st_san_safe is set to 1 [ok]"
	else
            LogPrint "WARNING: Kernel tunable st_san_safe is not set to 1"
	    LogPrint "We will set st_san_safe to 1"
	    /usr/sbin/kctune st_san_safe=1 >&2
	fi
        ;;
    *) # OS not supported
       return
       ;;
esac
