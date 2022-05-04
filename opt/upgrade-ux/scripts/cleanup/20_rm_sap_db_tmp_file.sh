# 20_rm_sap_db_tmp_file.sh

if (( PREVIEW )) ; then
   :
else
   find /var/tmp -name db_level_log_* -type f -mtime +5 -exec rm -rf {} \;
   find /var/tmp -name server_level_rmandd_arch_backup_* -type f -mtime +5 -exec rm -rf {} \;
   find /var/tmp -name sid_* -type f -mtime +5 -exec rm -rf {} \;
   find /var/tmp -name lsnr_* -type f -mtime +5 -exec rm -rf {} \;
   find /var/tmp -name tmp.* -type f -mtime +5 -exec rm -rf {} \;
   find /var/tmp -name user_sess_* -type f -mtime +5 -exec rm -rf {} \;
fi
