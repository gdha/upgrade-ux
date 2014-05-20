# 27_save_hpsim_conf.sh
[[ ! -f /usr/local/etc/HPSIM_irsa.conf ]] && return  # is part of WBEMextras

[[ -f "$VAR_DIR/$DS/HPSIM_irsa.conf.before" ]] && return  # was already saved

cp -p /usr/local/etc/HPSIM_irsa.conf "$VAR_DIR/$DS/HPSIM_irsa.conf.before"
