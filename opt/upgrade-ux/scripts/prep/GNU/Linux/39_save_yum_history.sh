# 39_save_yum_history.sh

# Keep an overview of the latest yum history (not the details)
# We decide to run this always as between a preview and an upgrade could be several hours
# and in between packages can be added or removed

$YUM history  > "$VAR_DIR/$DS/yum.history.before"
