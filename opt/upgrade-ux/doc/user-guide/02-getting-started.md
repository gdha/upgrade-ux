# Getting started

You can use upgrade-ux via installing the sources or the software depot (HP-UX, Linux,...)

## Clone the sources via GitHub

The latest sources are available at https://github.com/gdha/upgrade-ux[GitHub] and to clone
the sources on your local Unix you could use

    git clone git@github.com:gdha/upgrade-ux.git

To enter the directory use the command

    cd upgrade-ux/opt/upgrade-ux

## Installing the software depot on HP-UX

If the software depot was already been made available by the system administrator then you can use `swinstall` to do the job.

To install Upgrade-UX on HP-UX run the following command `swinstall -s SDserver:/var/opt/ignite/depots/GLOBAL/tools/11i UPGRADE-UX`

## Installing the RPM package on Linux (RHEL, SLES)

When the RPM is available you could install it via the command:

    rpm -ivh upgrade-ux-1.0-1.el7.noarch.rpm

Or, in case you would like to upgrade a version via +yum+ you could do the following:

    rpm -Uvh upgrade-ux-1.1-1.el7.noarch.rpm

## Prerequisites

Be aware, that upgrade-ux is completely written in Korn Shell, therefore, you must have the +ksh+ executable on your UNIX system. To be sure you could type `which ksh`. If it is not present please install it first (most likely on Linux where it is not a standard package in base OS).

