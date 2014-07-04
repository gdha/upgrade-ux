Upgrade-UX
==========

*Upgrade-UX* is an open source framework developed to assist in patching and/or updating Unix Operating Systems in a consistent and repeatable way. Especially in the industry it is forbidden just to run yum update (on Linux) to update your Linux system, therefore, upgrade-ux may proof to be a handy tool to guide you through the patching and/or update process as it follows a track you control (evidence gathering, pre/post executing of scripts, logging, and so on).

Upgrade-ux is completely written in Korn Shell which is widely available on all UNIX Operating Systems from Linux, HP-UX, Solaris, AIX, and others. The nice thing about upgrade-ux is that the each OS follows its own track (via a directory tree structure) so they do not influence each other.

Currently (July 2014), only the HP-UX tree is fully populated and we are starting with the Linux track. People who ever worked with [Relax-and-Recover](http://relax-and-recover.org) will immediately recognize the internals as it is an exact clone (however, reworked to make it fully Korn Shell aware).

Upgrade-UX has a wide range of features:

 - Simple to use
 - Has a preview mode (to dry-run an upgrade without doing it) and an upgrade mode
 - Is customisable via local.conf configuration file
 - Is written in standard Korn Shell (which makes it highly portable)
 - Is UNIX Operating System independent as OS specific tasks reside in their own directory structures
 - Is easy extendable with your own scripts
 - The `upgrade-ux` command leaves a trace in its own log file
 - Running in preview or upgrade mode always creates evidence files
 - Has a man page
 - Has user documentation (you are reading it)
 - Can be used to install patch bundles of previous years with the YEAR variable
 - Does understand Serviceguard clusters
 - Can be programmed to bail out on settings you think are too serious to continue
 - Can trigger remote alarms, syslog, monitors.
 - Can do a basis health check of your system - it is all up to you
 - Has excellent support by its author
 - The support and development of the Upgrade-UX project takes place on Github:

* [Upgrade-UX website](http://www.it3.be/projects/upgrade-ux.html)
* [Github project](http://github.com/gdha/upgrade-ux)
* [Upgrade-ux User Guide](http://www.it3.be/projects/upgrade-ux-user-guide.html)
