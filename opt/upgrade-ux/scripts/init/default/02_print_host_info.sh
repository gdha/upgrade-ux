# 02_print_host_info.sh
PrintLog "Hostname: $HOSTNAME - OS: $OS_VENDOR_VERSION_ARCH - IP: $(nslookup $HOSTNAME | grep Address | awk '{print $2}')"
