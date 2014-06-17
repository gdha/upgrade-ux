# 45_restore_hpsim_conf.sh
# we will first save the new conf file to $VAR_DIR/$DS/HPSIM_irsa.conf.after
# and then we will restore the $VAR_DIR/$DS/HPSIM_irsa.conf.before back to /usr/local/etc to keep the original conf file
[[ ! -f /usr/local/etc/HPSIM_irsa.conf ]] && return  # is part of WBEMextras

cp -p /usr/local/etc/HPSIM_irsa.conf "$VAR_DIR/$DS/HPSIM_irsa.conf.after"

cp -p "$VAR_DIR/$DS/HPSIM_irsa.conf.before" /usr/local/etc/HPSIM_irsa.conf
chmod 640 /usr/local/etc/HPSIM_irsa.conf

LogPrint "Restored the original /usr/local/etc/HPSIM_irsa.conf file"
Log "The new HPSIM_irsa.conf configuration file is saved as $VAR_DIR/$DS/HPSIM_irsa.conf.after"
