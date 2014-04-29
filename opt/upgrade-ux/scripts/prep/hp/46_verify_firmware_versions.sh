# 46_verify_firmware_versions.sh
#
# purpose is to verify if we need to upgrade some critical Firmware but running patch installation
#
[[ ! -f "$VAR_DIR/machinfo" ]] && return    # no input file means PA-RISC (don't check FW)

# we should do something more then just list the FW (waiting on input from HP) - TODO
grep -E '(Firmware|FP SWA|BMC)' "$VAR_DIR/machinfo"  >&2

