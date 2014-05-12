# 04_create_var_dir.sh

[[ ! -d "$VAR_DIR" ]] && mkdir -p -m 755 "$VAR_DIR"

if [[ ! -d "$VAR_DIR/$DS" ]]; then
     mkdir -p -m 755 "$VAR_DIR/$DS"
     Log "Created evidence directory $VAR_DIR/$DS"
fi

