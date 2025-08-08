# Upgrade Operation

The *upgrade* operation (or workflow) is the default one and does not need to be mentioned explicitly on the command line.
The upgrade operation goes through different stages to accomplish a successful upgrade or patch installation. The stages in use are:

* init:
	The _init_ stage is what we call the initialization stage where we create a temporary work directory, read the INI file, decides if we are running in _preview_ or _upgrade_ mode, read the current status

* prep:
	The _prep_ stage is the preparation stage where we can save, copy lots of files as evidence (before we start patching). You could also use it to investigate if the health of the system is good enough to start with an upgrade and if not, warn the user and exit.

* preremove:
	The _prepremove_ stage is doing what its name applies - remove software before upgrading. It may be a handy if you know old pieces of software could lead to inconsistencies. Usually, we make sure that a more recent version gets installed during or after the upgrade.

* preinstall:
	The _preinstall_ stage is used by scripts to stop daemons and other processes which may generate conflicts during the upgrade.

* install:
	The _install_ stage is the part where we actually install software, do the patching or start with the updates of software bundles and drivers. This part must be described in the INI file (install section).

* postinstall:
	The _postinstall_ stage is mainly used to install extra software bundles which were not part of the global patch bundles or update depots. Also here, these must be described in the INI file (postinstall section). Furthermore, we tend to save evidence during this stage (as we did in the prep stage) so we can compare if something trial was modified and if so, warn the user about it.

* postremove:
	The _postremove_ stage is just there in case some software bundles must be removed again to avoid conflicts. Usually, this stage is empty.

* configure:
	The _configure_ stage is used to setup cron entries, user permission or whatever  you can think of.

* postexecute:
	The _postexecute_ stage is used to execute some program, such as `cfg2html` to grab a new base point of the system. Again, you can run other programs as well such as `HPSIM-HealthCheck.sh` and so on


Every time you enter or leave a stage the `/var/opt/upgrade-ux/status` gets updated with a timestamp and the _stage_ name with an additional notification of 'start' or 'ended'. Upgrade-ux will not delete this status file, but will always append to it so you get a nice historic view of all the runs:

```
   # cat /var/opt/upgrade-ux/status
   2014-06-13 13:12:26 init:start
   2014-06-13 13:12:27 init:ended
   2014-06-13 13:12:27 prep:start
   2014-06-13 13:12:36 prep:ended
   2014-06-13 13:12:36 preremove:start
   2014-06-13 13:12:45 preremove:ended
   2014-06-13 13:12:45 preinstall:start
   2014-06-13 13:12:51 preinstall:ended
   2014-06-13 13:12:51 install:start
   2014-06-13 13:25:30 install:ended
   2014-06-13 13:25:30 postinstall:start
   2014-06-13 13:27:41 postinstall:ended
   2014-06-13 13:27:41 postremove:start
   2014-06-13 13:27:41 postremove:ended
   2014-06-13 13:27:41 configure:start
   2014-06-13 13:27:41 configure:ended
   2014-06-13 13:27:41 postexecute:start
   2014-06-13 13:28:19 postexecute:ended
   2014-06-13 13:28:19 preview:ended   (preview ended successfully)
   2014-06-13 13:34:09 init:start
   2014-06-13 13:34:10 init:ended
   2014-06-13 13:34:10 prep:start
   2014-06-13 13:34:19 prep:ended
   2014-06-13 13:34:19 preremove:start
   2014-06-13 13:34:31 preremove:ended
   2014-06-13 13:34:31 preinstall:start
   2014-06-13 13:35:56 preinstall:ended
   2014-06-13 13:35:56 install:start
   2014-06-13 15:36:57 install:ended
   2014-06-13 15:36:58 postinstall:start
   2014-06-13 15:45:49 postinstall:ended
   2014-06-13 15:45:49 postremove:start
   2014-06-13 15:45:49 postremove:ended
   2014-06-13 15:45:49 configure:start
   2014-06-13 15:45:49 configure:ended
   2014-06-13 15:45:49 postexecute:start
   2014-06-13 15:55:21 postexecute:ended
   2014-06-13 15:55:21 upgrade:ended   (upgrade ended successfully)
```
