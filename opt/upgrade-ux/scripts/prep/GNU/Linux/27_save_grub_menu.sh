# 27_save_grub_menu.sh

[[ -f /boot/grub/menu.lst ]] && cp -p /boot/grub/menu.lst "$VAR_DIR/$DS/grub-menu.lst.before"

[[ -f /boot/grub/grub.cfg ]] && cp -p /boot/grub/grub.cfg "$VAR_DIR/$DS/grub.cfg.before"

# we save /boot/grub2/grub.cfg as grub-2.cfg.before to identify GRUB v2
[[ -f /boot/grub2/grub.cfg ]] && cp -p /boot/grub2/grub.cfg "$VAR_DIR/$DS/grub-2.cfg.before"

