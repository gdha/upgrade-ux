# postexecute/GNU/Linux/80_run_grub2_mkconfig.sh
# Script will run grub2-mkconfig (or grub-mkconfig)

if [[ -f /etc/grub2.cfg ]];  then
    # Show the current entries before running grub2-mkconfig
    Log "Before running grub2-mkconfig the entries are:"
    if type -p grubby >/dev/null 2>&1 ; then
        grubby --info=ALL  >&2
    else
         awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg  >&2
    fi
fi

if (( PREVIEW )) ; then
    LogPrint "Running GRUB makeconfig script [not in preview mode]"
else
    LogPrint "Running GRUB makeconfig script"
    if [[ -f "$VAR_DIR/$DS/grub-2.cfg.before" ]] ; then
        grub2-mkconfig -o /boot/grub2/grub.cfg >&2
        Log "The first 'menuentry' of the grub.cfg file is:"
        if type -p grubby >/dev/null 2>&1 ; then
            grubby --info=0  >&2
        else
            grep ^menuentry /boot/grub2/grub.cfg | head -1 >&2
        fi
    elif [[ -f "$VAR_DIR/$DS/grub.cfg.before" ]] ; then
        grub-mkconfig -o /boot/grub/grub.cfg >&2
        Log "The first 'menuentry' of the grub.cfg file is:"
        if type -p grubby >/dev/null 2>&1 ; then
            grubby --info=0  >&2
        else
            grep ^menuentry /boot/grub/grub.cfg | head -1 >&2
        fi
    fi
    if [[ -f /etc/grub2.cfg ]];  then
        Log "After running grub2-mkconfig the entries are:"
        if type -p grubby >/dev/null 2>&1 ; then
            grubby --info=ALL  >&2
        else
            awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg  >&2
        fi
    fi
fi
