#!/bin/sh
# preinstall.sh

echo "       * preinstall.sh starts"

# remove old /opt/upgrade-ux/scripts/install/hp/30_install_bundles.sh script as it has been
# renamed to /opt/upgrade-ux/scripts/install/hp/40_install_bundles.sh (by issue #98)
[[ -f /opt/upgrade-ux/scripts/install/hp/30_install_bundles.sh ]] && rm -f /opt/upgrade-ux/scripts/install/hp/30_install_bundles.sh
echo "       * Removed old /opt/upgrade-ux/scripts/install/hp/30_install_bundles.sh script"

