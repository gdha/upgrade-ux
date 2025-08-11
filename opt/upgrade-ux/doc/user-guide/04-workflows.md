# Workflows

The workflows (or commands) available can be listed with the `-h` option:

    # /opt/upgrade-ux/bin/upgrade-ux -h
        ....
        List of commands:
         dump            dump configuration and system information
         mkdist          create a compressed tar archive distribution
         purgelogs       purge the LOG [/home/gdhaese1/projects/upgrade-ux/var/opt/upgrade-ux/log] directory
         test            a simple test workflow
         upgrade         upgrade the operating system

## Dump workflow

The dump workflow was already discussed during the configuration chapter. The output of `/opt/upgrade-ux/bin/upgrade-ux dump`:

    # /opt/upgrade-ux/bin/upgrade-ux dump
    upgrade-ux 0.7 / 03-Jun-2014
    Using log file: /var/opt/upgrade-ux/log/upgrade-ux-20140626-1656-hostname.log
    Dumping out configuration and system information
    System definition:
                                        ARCH = HP-UX-ia64
                                          OS = HP-UX
                            OS_MASTER_VENDOR =
                           OS_MASTER_VERSION =
                       OS_MASTER_VENDOR_ARCH =
                    OS_MASTER_VENDOR_VERSION =
               OS_MASTER_VENDOR_VERSION_ARCH =
                                   OS_VENDOR = hp
                                  OS_VERSION = 11.31
                              OS_VENDOR_ARCH = hp/ia64
                           OS_VENDOR_VERSION = hp/11.31
                      OS_VENDOR_VERSION_ARCH = hp/11.31/ia64
    Configuration tree:
                             HP-UX-ia64.conf : missing/empty
                                  HP-UX.conf : OK
                                     hp.conf : missing/empty
                                hp/ia64.conf : missing/empty
                               hp/11.31.conf : missing/empty
                          hp/11.31/ia64.conf : missing/empty
                                   site.conf : missing/empty
                                  local.conf : OK

The first part displays the system definitions, such as OS, hardware type and OS version.
The second part shows the configuration part and which files it could find (or you may define, create and/or use). They do not need to exist.

The following example shows the dump on a RHEL 7 system:

    # /opt/upgrade-ux/bin/upgrade-ux dump
    upgrade-ux 0.9 / Git
    Using log file: /var/opt/upgrade-ux/log/upgrade-ux-20140626-1859-hostname.log
    Dumping out configuration and system information
    This is a 'Linux-x86_64' system, compatible with 'Linux-i386'.
    System definition:
                                      ARCH = Linux-i386
                                        OS = GNU/Linux
                          OS_MASTER_VENDOR = fedora
                         OS_MASTER_VERSION = 7
                     OS_MASTER_VENDOR_ARCH = fedora/x86_64
                  OS_MASTER_VENDOR_VERSION = fedora/7
             OS_MASTER_VENDOR_VERSION_ARCH = fedora/7/x86_64
                                 OS_VENDOR = rhel
                                OS_VERSION = 7
                            OS_VENDOR_ARCH = rhel/x86_64
                         OS_VENDOR_VERSION = rhel/7
                    OS_VENDOR_VERSION_ARCH = rhel/7/x86_64
    Configuration tree:
                           Linux-i386.conf : missing/empty
                            GNU/Linux.conf : OK
                               fedora.conf : missing/empty
                        fedora/x86_64.conf : missing/empty
                             fedora/7.conf : missing/empty
                      fedora/7/x86_64.conf : missing/empty
                                 rhel.conf : missing/empty
                          rhel/x86_64.conf : missing/empty
                               rhel/7.conf : missing/empty
                        rhel/7/x86_64.conf : missing/empty
                                 site.conf : missing/empty
                                local.conf : OK

These configuration files live under the `/etc/opt/upgrade-ux` or `./upgrade-ux/etc/opt/upgrade-ux` (relative path) directory.
At this moment we have the following configuration files present (however, it will grow over time):

    # ls -lR
    total 112
    drwxr-xr-x   2 gdhaese1   users         8192 Mar  6 13:39 GNU
    -rw-r--r--   1 gdhaese1   users         2919 Jun  3 15:07 HP-UX-11.11-2014.ini
    -rw-r--r--   1 gdhaese1   users         2918 Jun  3 15:07 HP-UX-11.23-2014.ini
    -rw-r--r--   1 gdhaese1   users         3687 Jun  3 15:06 HP-UX-11.31-2014.ini
    -rw-r--r--   1 gdhaese1   users         1068 May 12 10:52 HP-UX.conf
    -rw-r--r--   1 gdhaese1   users         4571 Jun 13 14:58 default.conf
    -rw-r--r--   1 gdhaese1   users          790 May 21 09:48 local.conf
    
    ./GNU:
    total 48
    -rw-r--r--   1 gdhaese1   users          102 Mar  6 13:39 Linux-fedora-20-2014.ini
    -rw-r--r--   1 gdhaese1   users          111 Mar  6 13:39 Linux-suse-11-2014.ini
    -rw-r--r--   1 gdhaese1   users           74 Mar  6 10:43 Linux.conf

## Mkdist workflow

The _mkdist_ workflow creates a compressed tar file of the current development tree, which only makes sense when you are using the `git clone` version of upgrade-ux. The compressed tar file is stored under `/tmp` file system and is called `/tmp/upgrade-ux-0.9.tar.gz` (the version can be different of course).

## Purgelogs workflow

The purgelogs workflow just has a simple function and that is to purge log files which are older than 30 days. It will display the logs it has purged (only when you are using the option `-v`):

    # opt/upgrade-ux/bin/upgrade-ux -v purgelogs

## Test workflow

The test workflow is a very simplistic test (use option `-v` to see something):

    # opt/upgrade-ux/bin/upgrade-ux -v test
    upgrade-ux 0.9 / Git
    Using log file: /home/gdhaese1/projects/upgrade-ux/var/opt/upgrade-ux/log/upgrade-ux-20140625-1354-hostname.log
    no stale NFS mount points found

## Upgrade workflow

The upgrade workflow is the real work horse here and in fact is the default workflow (meaning if no workflow is mentioned we will assume you mean `upgrade`).

The upgrade workflow has two modes:

 - _preview mode_: is going through the complete flow checking all software and simulating an update of the system. Is a perfect way to examine your system to see whether any underlying issues could prevent a successful upgrade. You can do the preview (option `-p`) any time and as much as you like. However, before doing the _upgrade mode_ you are forced to go through a successful _preview mode_ as well.
 - _upgrade mode_: is doing again all the checks, writing evidence and applying all the patch bundles or doing the upgrade. The system might reboot. After the reboot you can continue with retyping `/opt/upgrade-ux/bin/upgrade-ux -v` and it will continue from the point it was interrupted by the reboot as upgrade-ux keeps track of it stages.

