# 10_save_dmesg.sh

# Linux has its own 10_save_dmesg.sh script using 'dmesg -T'
dmesg -T > $VAR_DIR/$DS/dmesg.output
