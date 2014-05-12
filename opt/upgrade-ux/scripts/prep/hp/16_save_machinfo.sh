# 16_save_machinfo.sh

[[ ! -x /usr/contrib/bin/machinfo ]] && return  # HP-UX 11.11 doesn't has this

/usr/contrib/bin/machinfo > "$VAR_DIR/$DS/machinfo"
