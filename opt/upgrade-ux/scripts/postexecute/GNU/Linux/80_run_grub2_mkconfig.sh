# postexecute/GNU/Linux/80_run_grub2_mkconfig.sh
# Script will run grub2-mkconfig (or grub-mkconfig)

if (( PREVIEW )) ; then
    LogPrint "Running GRUB makeconfig script [not in preview mode]"
else
    LogPrint "Running GRUB makeconfig script"
    if [[ -f "$VAR_DIR/$DS/grub-2.cfg.before" ]] ; then
        grub2-mkconfig -o /boot/grub2/grub.cfg >&2
        Log "The first 'menuentry' of the grub.cfg file is:"
        grep ^menuentry /boot/grub2/grub.cfg | head -1 >&2
    elif [[ -f "$VAR_DIR/$DS/grub.cfg.before" ]] ; then
        grub-mkconfig -o /boot/grub/grub.cfg >&2
        Log "The first 'menuentry' of the grub.cfg file is:"
        grep ^menuentry /boot/grub/grub.cfg | head -1 >&2
    fi
fi
