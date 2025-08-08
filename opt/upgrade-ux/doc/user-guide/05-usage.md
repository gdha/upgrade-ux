# Basic Usage

Before digging deeper in `upgrade-ux` lets explain the basic usage.

The option help (`-h`) will produce the following:

    # /opt/upgrade-ux/bin/upgrade-ux -h
    Usage: upgrade-ux [-dDFsSpvV] [-c DIR ] COMMAND [-- ARGS...]
    
    upgrade-ux comes with ABSOLUTELY NO WARRANTY; for details see
    the GNU General Public License at: https://www.gnu.org/licenses/gpl.html
    
    Available options:
     -c DIR       alternative config directory; instead of /etc/opt/upgrade-ux
     -d           debug mode; log debug messages
     -D           debugscript mode; log every function call
     -F           forcing preview or upgrade to continue when entering next stage is not allowed
     -s           simulation mode; show what scripts upgrade-ux would include
     -S           step-by-step mode; acknowledge each script individually
     -p           preview mode; run all install or other commands in preview
     -v           verbose mode; show more output
     -V           version information
    
    List of commands:
     dump            dump configuration and system information
     mkdist          create a compressed tar archive distribution
     purgelogs       purge the LOG [/var/opt/upgrade-ux/log] directory
     test            a simple test workflow
     upgrade         upgrade the operating system


Keep in mind that upgrade-ux has an excellent man page too. See `man 8 upgrade-ux`

It is important to know that `upgrade-ux` is a quiet program and will not show any output if you do not request for it with the verbose option (`-v`). Another point of interest is its excellent logging facilities as under `/var/opt/upgrade-ux/log` directory `upgrade-ux` keep a log file of each run. The log files are composed as follow `upgrade-ux-<YYYYMMDD>-<HHMM>-hostname.log`

We already mentioned the evidence files which are kept under `/var/opt/upgrade-ux/<YYYY-MM-DD>/` directory. The type of files you find under there are of course different according the OS, OS version and which software is installed. Furthermore, _preview_ and _upgrade_ mode may result in more or less evidence files.

Starting up the program should be done by referencing the full path `/opt/upgrade-ux/bin/upgrade-ux` as the directory is not part of the `PATH` variable, and we prefer to keep it this way to avoid accidents.

You probably understood by now that `upgrade-ux` must be started in _preview_ mode first before we can run it in _upgrade_ mode. However, we prefer that you always use the option `-p` (_preview_ mode) to make it clear to yourself and other (when they need to dig into the log files for some reason) what you meant. Furthermore, in the log file there is always a trace of in which mode the program was running:

```
    2014-06-10 15:22:45 Check if our PID (11950) is locked
    2014-06-10 15:22:45 Found /tmp/upgrade-ux-LOCKDIR/upgrade-ux-PIDFILE file - we could be locked...
    2014-06-10 15:22:45 lock is stale (6607) - will continue
    2014-06-10 15:22:45 lock succeeded: 11950 - /tmp/upgrade-ux-LOCKDIR/upgrade-ux-PIDFILE
    2014-06-10 15:22:47 upgrade-ux 0.7 / 03-Jun-2014
    2014-06-10 15:22:47 Command line options: /opt/upgrade-ux/bin/upgrade-ux -v
    2014-06-10 15:22:47 Using log file: /var/opt/upgrade-ux/log/upgrade-ux-20140610-1522-hostname.log
    2014-06-10 15:22:47 Including /opt/upgrade-ux/lib/progresssubsystem.nosh
    2014-06-10 15:22:47 Including /etc/opt/upgrade-ux/HP-UX.conf
    2014-06-10 15:22:47 Including /etc/opt/upgrade-ux/local.conf
    2014-06-10 15:22:47 Running upgrade workflow
    2014-06-10 15:22:47 Running 'init' stage
    2014-06-10 15:22:47 Including init/default/03_prepare_tmp_build_area.sh
    2014-06-10 15:22:47 Including init/default/04_create_var_dir.sh
    2014-06-10 15:22:47 Including init/default/05_select_ini_file.sh
    2014-06-10 15:22:47 Found ini file /etc/opt/upgrade-ux/HP-UX-11.11-2014.ini
    2014-06-10 15:22:47 Including init/default/08_set_preview_var.sh
    2014-06-10 15:22:47 Including init/default/10_check_current_status.sh
    2014-06-10 15:22:47 Including init/default/12_upgrade_allowed.sh
    2014-06-10 15:22:47 Including init/default/15_check_preview_run.sh
    2014-06-10 15:22:47 Last preview run was executed on Tue Jun 10 14:28:36 METDST 2014  (preview ended successfully)
    2014-06-10 15:22:47 Running in "upgrade mode"
    2014-06-10 15:22:47 =-=-=-=-=-=-=-=-=-=-=-=-=
```
    
From the Chapter "Workflow" you probably remember that the default workflow is *upgrade* (even if you did not mention it). So, as example running `upgrade-ux` in preview mode with verbose option is done as `/opt/upgrade-ux/bin/upgrade-ux -vp`


The last option that we bring to your attention in this Chapter is the force option (`-F`) which is handy in situation that for some reasons `upgrade-ux` does not want to continue due to serious software (patches) problems. For example, within HP-UX we run the `check_patches` command which when errors are detected will force an exit from `upgrade-ux` so that the System Administrator can first fix these patches (or any other issue) before re-running `upgrade-ux` again.
We have seen cases it was impossible to get everything fixed and for that reason you may use the force option, but please do not use it by default.

NOTE: We advise to run the _preview_ mode a few weeks in advance, but on a given day we must run the _preview_ first again before we can run in _upgrade_ mode. This is done on purpose to avoid mistakes.

