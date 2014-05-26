#!/bin/sh
# upgrade-ux postinstall.sh

echo "       * upgrade-ux postinstall.sh script runs"

# man page (copy a compressed file to /usr/share/man/man8.Z/upgrade-ux.8)
[[ -f /usr/share/man/man8.Z/upgrade-ux.8 ]] && rm -f /usr/share/man/man8.Z/upgrade-ux.8
if [[ -f /opt/upgrade-ux/man/upgrade-ux.8 ]]; then
    compress -c /opt/upgrade-ux/man/upgrade-ux.8 > /usr/share/man/man8.Z/upgrade-ux.8
    chmod 644 /usr/share/man/man8.Z/upgrade-ux.8
    echo "       * Create man page under /usr/share/man/man8.Z/upgrade-ux.8"
fi
