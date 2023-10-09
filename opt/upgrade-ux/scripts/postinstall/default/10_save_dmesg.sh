# 10_save_dmesg.sh

# Linux has its own 10_save_dmesg.sh script using 'dmesg -T'
[[ "$OS" == "GNU/Linux" ]] && return

# for the non-Linux systems we use the standard command:
dmesg > $VAR_DIR/$DS/dmesg.output
