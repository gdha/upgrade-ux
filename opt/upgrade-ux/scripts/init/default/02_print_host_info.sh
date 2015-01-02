# 02_print_host_info.sh
LogPrint "Hostname: $HOSTNAME - OS: $OS_VENDOR_VERSION_ARCH - IP: $(nslookup $HOSTNAME | grep Address | tail -1 | awk '{print $2}')"
