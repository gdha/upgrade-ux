# 06_check_preview_run.sh
# we will enforce a preview run (even when we forgot it with '-p' option!)
# we want, at all cost, to avoid any unplesant suprises
if [[ ! -f $PREVIEW_FILE ]]; then
    date > $PREVIEW_FILE
    PREVIEW_MODE=1
    Log "Forcing preview mode with variable PREVIEW_MODE=1"
else
    Log "Last preview run was executed on $(cat $PREVIEW_FILE)"
fi
