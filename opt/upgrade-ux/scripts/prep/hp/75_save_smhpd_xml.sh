# 75_save_smhpd_xml.sh
[[ ! -f /opt/hpsmh/conf.common/smhpd.xml ]] && return

cp  -p  /opt/hpsmh/conf.common/smhpd.xml "$VAR_DIR/$DS/smhpd.xml.before"
