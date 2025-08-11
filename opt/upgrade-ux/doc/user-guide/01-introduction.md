# Upgrade-UX User Guide

# Introduction

*Upgrade-UX* is a software framework to update or patch lots of Unix systems (Linux,
HP-UX, AIX and Solaris).

In professional environments it is not allowed
to just blindly update an UNIX system without testing this first out on a development
system, pre-production and so on. The upgrade-ux product allows you to repeat
this process in a consistent way and as many times as you like on any system.
Upgrade-ux understands two states:

 - preview mode: will go through the whole process without actually doing the update
 - upgrade mode: will do it for real (the update, upgrade or patching)

The upgrade-ux uses configuration files which describes what a particular Unix Operating
System requires to be upgraded in the way you want it (or designed it). Doing
it this way allows you to *exactly* define how a system should look like after
the upgrade or patching. Nothing else can be installed, removed or configured.

Furthermore, many checks can be built-in via adding simple scripts (see chapter 
"Adding your scripts"). We also keep of each run an unique log file, and furthermore, we keep
evidence before and after patching in a special directory. Months later we can still
inspect these logs and evidence directories to verify what happened or what has
changed in the meantime.


## Upgrade-UX project

The support and development of the Upgrade-UX project takes place
on Github:

Upgrade-UX website:
    [https://www.it3.be/projects/upgrade-ux.html](https://www.it3.be/projects/upgrade-ux.html)

Github project:
    [https://github.com/gdha/upgrade-ux/](https://github.com/gdha/upgrade-ux/)

In case you have questions, ideas or feedback about this document, you
can contact the development team at:
gratien.dhaese at gmail.com.


## Design concepts

Based on experience from previous projects, a set of design principles were
defined, and improved over time:

 - Focus on easy and repeatable tasks
 - Modular design, focused on system administrators
 - For Unix operating systems
 - Few external dependencies (ksh and standard Unix tools)
 - Easy to use and easy to extend

The goal is to make Upgrade-UX as least demanding as possible, it will
require only the applications necessary to fulfill the job upgrade-ux
is configured for.


##  Features and functionality
Upgrade-UX has a wide range of features:

 - Simple to use
 - Has a _preview_ mode (to dry-run an upgrade without doing it) and an _upgrade_ mode
 - Is customisable via `local.conf` configuration file
 - Is written in standard Korn Shell (which makes it highly portable)
 - Is UNIX Operating System independent as OS specific tasks reside in their own directory structures
 - Is easy extendable with your own scripts
 - The `upgrade-ux` command leaves a trace in its own log file
 - Running in preview or upgrade mode always creates evidence files
 - Has a man page
 - Has user documentation (you are reading it)
 - Can be used to install patch bundles of previous years with the `YEAR` variable
 - Does understand Serviceguard clusters
 - Can be programmed to bail out on settings you think are too serious to continue
 - Can trigger remote alarms, syslog, monitors,...
 - Can do a basis health check of your system - it is all up to you
 - Has excellent support by its author


