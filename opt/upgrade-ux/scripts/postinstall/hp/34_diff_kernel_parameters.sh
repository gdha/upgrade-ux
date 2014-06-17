# 34_diff_kernel_parameters.sh
# if we do not have both files to compare just return
[[ ! -f "$VAR_DIR/$DS/kernel_parameters.before" ]] && return
[[ ! -f "$VAR_DIR/$DS/kernel_parameters.after" ]]  && return

cmp -s "$VAR_DIR/$DS/kernel_parameters.before" "$VAR_DIR/$DS/kernel_parameters.after"
if (( $? == 1 )) ; then
    LogPrint "Following kernel parameters are new or modified:"
    sdiff -s "$VAR_DIR/$DS/kernel_parameters.before" "$VAR_DIR/$DS/kernel_parameters.after"
    sdiff -s "$VAR_DIR/$DS/kernel_parameters.before" "$VAR_DIR/$DS/kernel_parameters.after" >&2
fi
