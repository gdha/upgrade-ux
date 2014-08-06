# 31_save_env_output.sh

[[ ! -f /usr/bin/env ]] && return

env > "$VAR_DIR/$DS/env.output"
