# 35_save_kernel_parameters.sh
#

case "$OS_VERSION" in
    11.11)
	/usr/sbin/kmtune > "$VAR_DIR/$DS/kernel_parameters.before"
        ;;
    11.23|11.31)
        /usr/sbin/kctune > "$VAR_DIR/$DS/kernel_parameters.before"
        ;;
    *) # OS not supported
       return
       ;;
esac
