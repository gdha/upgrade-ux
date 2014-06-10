# 15_rm_updateux_prereboot_helper.sh
# we added a script "/usr/lbin/sw/pre_reboot/add_install_ended_mark" during the upgrade-ux process.
# Especially for update-ux to add something like "2014-06-10 13:13:19 install:ended" to the status file
# So, after the reboot upgrade-ux can skip the 'install' stage as it was successfully ended.

[[ ! -f /usr/lbin/sw/pre_reboot/add_install_ended_mark ]]  &&  return  # silently return

rm -f /usr/lbin/sw/pre_reboot/add_install_ended_mark
Log "Removed the update-ux pre_reboot helper script /usr/lbin/sw/pre_reboot/add_install_ended_mark"
