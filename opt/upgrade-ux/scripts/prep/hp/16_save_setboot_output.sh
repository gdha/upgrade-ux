# 16_save_setboot_output.sh
###########################
# save the output of command setboot into $VAR_DIR/setboot

[[ -f $VAR_DIR/setboot.output ]] && return   # the output was already captured

/usr/sbin/setboot > $VAR_DIR/setboot.output
