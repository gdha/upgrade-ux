#= Frequently Asked Questions

## Upgrade-ux not found
If you get the following error when you try to run `upgrade-ux`

```
    # upgrade-ux
    sh: upgrade-ux:  not found.
```

The reason is that the absolute path `/opt/upgrade-ux/bin` is not added the the `PATH` variable. This is done on purpose to avoid mistakes! Therefore, always use the full path `/opt/upgrade-ux/bin/upgrade-ux`

## Why upgrade-ux as we know update-ux
This question is only valid for HP-UX 11i systems which can be upgraded to a newer version of the Operation System (say HP-UX 11.23 to HP-UX 11.31), or even using `update-ux` to upgrade software bundles on the same OS version. 
We have encountered situations where the UNIX engineer by accident started `update-ux` on HP-UX 11.23 to patch with HP-UX 11.23 bundles, but using the HP-UX 11.31 depot, and therefore, `update-ux` started the upgrade process to HP-UX 11.31. As a result we needed to recover from an Ignite/UX image before restarting the patching round again. By using `upgrade-ux` this simply becomes impossible as all update paths are described in the configuration files.

## How do we install a patch bundle from 1 or 2 years ago?
The `YEAR` variable defines the current year ( `$(date `%Y)` ) of the patch bundles in the `/etc/opt/upgrade-ux/default.conf` file. However, suppose we are in the year 2015 and still would like to install the patch bundle of 2014? The easiest way is to overrule the `YEAR` variable in the `/etc/opt/upgrade-ux/local.conf` as

```
    YEAR=2014
```

## How gets the SDSERVER variable defined
You might wonder how we define the `SDSERVER`? And, is it possible to overrule it with your preference? The `SDSERVER` variable is used a lot in the INI files and points to an IP address or FQDN of an software depot server where the software depots are stored.

The `SDSERVER` variable is defined by a script `scripts/init/hp/30_define_sdserver.sh` and tries to figure out the region you are located in. Be aware, this script only works well for _one_ particular customer (the sponsor of this project).

Therefore, for other users, you need to define the `SDSERVER` variable in the `/etc/opt/upgrade-ux/local.conf` file as

```
    SDSERVER=my_sdserver.company.com
```

Obviously, you need to replace the name _my_sdserver.company.com_ with the correct name of the software depot server.

## Upgrade-ux forces me to reboot the server if system is running for more then 30 days
The forced reboot was introduced into upgrade-ux, because sometimes servers got patches after running over 1 year without a single reboot and to avoid pin-points to bad patch bundles we decided a recent reboot was required (by default 30 days uptime is the maximum we tolerate).

However, in rare cases, some customers want to extend this period to 60 days. So, how to do this?

The variable which defines the uptime is called `DAYSUPTIME` and is defined in `/etc/opt/upgrade-ux/default.conf`. As you should know by now, you can overrule this by defining a new value in the `/etc/opt/upgrade-ux/local.conf` file as

```
    DAYSUPTIME=60
```

However, be aware, if you increase this value then do not file an issue against upgrade-ux!

