# 65_check_sw_defaults.sh
# verify if option "mount_all_filesystems=false" has been defined in /var/adm/sw/defaults
# if not we add it and save the original file as defaults.$DS

[[ ! -f /var/adm/sw/defaults ]] && return  # hum, would be very weird on HP-UX systems

grep -q "^mount_all_filesystems=false" /var/adm/sw/defaults && return  # is already present = OK

# the entry mount_all_filesystems=false was not there yet, so let us add it

cp -p /var/adm/sw/defaults /var/adm/sw/defaults.$DS
echo "mount_all_filesystems=false" >> /var/adm/sw/defaults
LogPrint "Added SD default \"mount_all_filesystems=false\" to the /var/adm/sw/defaults file"
