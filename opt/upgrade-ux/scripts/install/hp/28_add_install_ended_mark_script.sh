# 28_add_install_ended_mark_script.sh
# Only really valid for HP-UX 11.31 and update-ux process
# we will add a script in the pre-reboot area to add a marker in out status file so after a successfull reboot
# we may skip the 'install' stage so we gain time:
# 1. no running update-ux again (as it is not required anymore)
# 2. avoid an error message by not re-running update-ux as it was already done (error message like:
# ERROR:   No software was selected for the following reasons:
#          - The same version of the following software is already installed (to
#            select this software, set '-x reinstall=true' and try again):
#            - HPUX11i-VSE-OE,r=B.11.31.1403
[[ "$OS_VERSION" != "11.31" ]]  &&  return   # is only meant for HP-UX 11.31

if (( PREVIEW )) ; then
    return  # do nothing
fi


[[ ! -d /usr/lbin/sw/pre_reboot ]] &&  return  # no target directory; silently return
    
cat > /usr/lbin/sw/pre_reboot/add_install_ended_mark <<EOF
#!/sbin/sh
# Script: /usr/lbin/sw/pre_reboot/add_install_ended_mark
export PATH=/bin:/usr/lbin/sw/bin:/sbin

if [[ -f /var/opt/upgrade-ux/status ]] ; then
   echo "$(date +'%Y-%m-%d %H:%M:%S ')install:ended" >> /var/opt/upgrade-ux/status
   echo "    * Added 'install:ended' mark in /var/opt/upgrade-ux/status file"
fi
EOF
chmod 744 /usr/lbin/sw/pre_reboot/add_install_ended_mark
