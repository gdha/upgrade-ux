# 80_verify_init_level.sh
# The init level is sometimes manually edited to level 2 and after successful patching set to 3 again
# However, sometimes it is forgotten
i=$( grep ^init /etc/inittab | cut -d: -f2 )  # should be 3, but could be 2
if (( i < 3 )) ; then
    LogPrint "Do not forget to change the init level to 3 in /etc/inittab"
fi
