[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fgdha%2Fupgrade-ux.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fgdha%2Fupgrade-ux?ref=badge_shield)

Upgrade-UX
==========

*Upgrade-UX* is an open source framework developed to assist in patching and/or updating Unix Operating Systems in a consistent and repeatable way. Especially in the industry it is forbidden just to run yum update (on Linux) to update your Linux system, therefore, upgrade-ux may proof to be a handy tool to guide you through the patching and/or update process as it follows a track you control (evidence gathering, pre/post executing of scripts, logging, and so on).

Upgrade-ux is completely written in Korn Shell which is widely available on all UNIX Operating Systems from Linux, HP-UX, Solaris, AIX, and others. The nice thing about upgrade-ux is that the each OS follows its own track (via a directory tree structure) so they do not influence each other.

Currently, only the HP-UX and Linux (CentOS/RHEL) tree are fully populated. People who ever worked with [Relax-and-Recover](https://relax-and-recover.org) will immediately recognize the internals as it is an exact clone (however, reworked to make it fully Korn Shell aware).

Upgrade-UX has a wide range of features:

 - Open Source with a GPL v3 license
 - Free to use and pull requests are kindly accepted
 - Simple to use
 - Has a preview mode (to dry-run an upgrade without doing it) and an upgrade mode
 - Is customisable via `local.conf` configuration file
 - Is written in standard *Korn Shell* (which makes it highly portable)
 - Is a complete modular framework where a script can be placed (directory structures according OS type)
 - Is UNIX Operating System independent as OS specific tasks reside in their own directory structures
 - HP-UX is fully implemented (and has been used for over 4 years without much problems for one customer)
 - Linux is fully implemented, but can still be easily extended (used by one customer to quarterly patch)
 - AIX and SunOS are not (yet) implemented
 - Is easy extendable with your own scripts
 - The `upgrade-ux` command leaves a trace in its own log file
 - Running in preview or upgrade mode always creates evidence files
 - Has a man page
 - Has user documentation (you are reading part of it)
 - Can be used to install patch bundles of previous years with the YEAR variable
 - Does understand Serviceguard clusters (HP-UX and Linux)
 - Can be programmed to bail out on settings you think are too serious to continue
 - Can trigger remote alarms, syslog, monitors.
 - Can force a clean reboot before patching or upgrade can start (definable)
 - Can do a basis health check of your system - it is all up to you
 - Has excellent support by its author (contact me for consultancy or programming tasks)
 - The support and development of the Upgrade-UX project takes place on Github

* [Upgrade-UX website](https://www.it3.be/projects/upgrade-ux/)
* [Github project](https://github.com/gdha/upgrade-ux)
* [Upgrade-ux User Guide](https://www.it3.be/projects/upgrade-ux/upgrade-ux-user-guide.html)

Author : Gratien D'haese

[Company Project](https://www.it3.be/projects/upgrade-ux/)



[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fgdha%2Fupgrade-ux.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fgdha%2Fupgrade-ux?ref=badge_large) [![Build Linux Packages](https://github.com/gdha/upgrade-ux/actions/workflows/rpmbuild-of-upgrade-ux.yml/badge.svg)](https://github.com/gdha/upgrade-ux/actions/workflows/rpmbuild-of-upgrade-ux.yml)
