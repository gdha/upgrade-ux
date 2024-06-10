Changelog
=========


1.31 (2024-06-10)
-----------------
- #156 increasing version to 1.31 in upgrade-ux main script. [gdha]
- #150 adding 62_save_failed_systemd_services.sh and
  63_save_journal_errors.sh. [gdha]
- Update author in .package file. [gdha]
- Create docker-image.yml. [Gratien D'haese]
- #156 adding HP-UX-11.31-2024.ini. [Gratien D'haese]
- Add Dockerfile. [gdha]
- El7 to el8 update. [gdha]
- Merge pull request #153 from gdha/renovate/actions-checkout-4.x.
  [Gratien D'haese]

  Update actions/checkout action to v4
- Update actions/checkout action to v4. [renovate[bot]]
- Merge pull request #152 from gdha/renovate/major-github-artifact-
  actions. [Gratien D'haese]

  Update GitHub Artifact Actions to v4 (major)
- Update GitHub Artifact Actions to v4. [renovate[bot]]
- Merge pull request #151 from gdha/renovate/configure. [Gratien
  D'haese]

  Configure Renovate
- Add renovate.json. [renovate[bot]]
- Make workflows to publish rpm. [gdha]
- Create publish.yml. [Gratien D'haese]
- Update CHANGELOG. [gdha]


1.30 (2024-04-23)
-----------------
- Set version to 1.30 and release date to 23-Apr-2024. [gdha]
- Man page looks good. [gdha]
- Update man page slightly. [gdha]
- Avoid false alerts from a missing Tidal agent #149. [gdha]
- Avoid false alerts from a missing Control-M agent #148. [gdha]
- Issue #147 stop/start telegraf service. [gdha]
- For issue #146 we add observability-tools to the exclude list to avoid
  conflicts with jq package. [gdha]
- Issue #145: we will always refill the variable $exclude_packages (in
  preview and upgrade mode) [gdha]
- Add the gitchangelog functionality. [gdha]


1.29 (2024-04-23)
-----------------
- Update date in upgrade-ux main script. [gdha]
- #143 add script 19_is_rear_mkbackup_busy.sh. [gdha]
- #144 kill chef-client processes after timeout period. [gdha]
- #141 Linux uses dmesg -T. [gdha]
- Update version to 1.29 #142. [Gratien D'haese]
- #142 adding HP-UX-11.31-2023.ini for RMP-2023. [Gratien D'haese]
- #139 update version nr to 1.29. [gdha]
- #139 adding new generic Linux INI files for CentOS and RHEL. [gdha]
- #140 correct the asciinema inclosure. [gdha]
- #140 update user guide with asciinema output. [gdha]
- #138 use a timeout of 10 seconds with netbackup check. [gdha]
- Update FUNDING.yml. [Gratien D'haese]

  change text
- Update FUNDING.yml. [Gratien D'haese]

  add paypal
- Detect hardware platform on Linux with dmidecode #135. [gdha]
- Use $RPM instead of rpm and add some additional checks o rpm being
  present #136. [gdha]
- #137 replace http: with https: where possible. [gdha]
- Test update with GIT Token. [gdha]
- Update README. [gdhaese1]
- #134 add rke2 to exclude package list. [Gratien Dhaese]
- Docs update. [Gratien Dhaese]
- #132 update version to 1.26. [Gratien D'haese]
- #132 add file HP-UX-11.31-2022.ini. [Gratien D'haese]
- Mv 20_rm_sap_db_tmp_file.sh to proper directory. [gdhaese1]
- #131 add script to remove temporary sap db files under /var/tmp after
  patching. [gdhaese1]
- #133 add dnf.log comparison next to the yum.log. [gdhaese1]
- #129 upgrade-ux v1.25 date 14/Dec/2021. [Gratien D'haese]
- #129 adding  ch00erp0027 as SD server for HPUX. [Gratien D'haese]
- #130 add the 2021 INI files for rhel/centos and bump to v1.25.
  [gdhaese1]
- #129 fix the SDSERVER selection according region. [Gratien D'haese]
- Made some better if-blocks #128 in postremove.sh and preinstall.sh.
  [Gratien D'haese]
- Moved the remove 30_install_bundles.sh script to preinstall.sh #128.
  [Gratien D'haese]
- #128 Fix missing HPUX EOM version and remove old script on HP.
  [Gratien D'haese]
- Import RPM GPG keys before patching #127. [gdhaese1]
- Improve the chef-client waiting process #123. [gdhaese1]
- Adding flexera scripts #124. [gdhaese1]
- Start scripts for tanium and fluentbit #124. [gdhaese1]
- Check on hanging rpm commands #124. [gdhaese1]
- Stop tanium and fluentbit #124. [gdhaese1]
- Adding prep/GNU/Linux/65_wait_on_chef_client_completion.sh script
  #123. [gdhaese1]
- Disable chef-client cron entry during patching #123. [gdhaese1]
- Correct the stop/start seq of ds_agent on Linux. [gdhaese1]
- Updating release to v1.22. [gdhaese1]
- #119 using the correct repo name. [gdhaese1]
- Update version to 1.21. [gdhaese1]
- Adding HP-UX-11.31-2021.ini #122. [gdhaese1]
- #119 only deal with .repo files. [gdhaese1]
- #121 use GPLv3 only. [gdhaese1]
- Merge pull request #120 from fossabot/add-license-scan-badge. [Gratien
  D'haese]

  Add license scan report and status
- Add license scan report and status. [fossabot]

  Signed off by: fossabot <badges@fossa.com>
- Add support for RHEL 8 and CentOS 8 #118. [gdhaese1]
- Bump to v1.19 for HP-UX RMP-2020 release #117. [Gratien D'haese]
- Fix IP addresses of SW depot servers #116. [Gratien D'haese]
- #117 adding HP-UX-11.31-2020.ini. [Gratien D'haese]
- Bring the version to 1.18 #115. [gdhaese1]
- Add INI for RHEL/CENTOS 7 for 2020 #115. [gdhaese1]
- Creating Funding.yml page. [Gratien D'haese]
- Update RELEASE_DATE in upgrade-ux main script. [Gratien D'haese]
- Check the fstyp with VxFS file systems and write to log file #114.
  [Gratien D'haese]
- Rename the script 76_save_nsswitch.conf to 76_save_nsswitch_conf.sh
  #55. [Gratien D'haese]
- #109 rewrote the findmnt loop so that ksh validation does not tripple
  over it. [gdhaese1]
- #55 rename the script 72_save_nsswitch.conf to 76_save_nsswitch.conf
  as it was not included by the run. [Gratien D'haese]
- #111: redirect the alarmdef.err to the log. [gdhaese1]
- Comment my test variables #109. [gdhaese1]
- #109 - the postinstall script. [gdhaese1]
- #109 - the prep script. [gdhaese1]
- Fix Makefile for upload of upgrade-ux-user-guide.html #98. [Gratien
  D'haese]
- Add doc for exclude.packages #98. [Gratien D'haese]
- Add a prep check on alarmdef file #111. [Gratien D'haese]
- New ini for 2019 for hpux #210. [Gratien D'haese]
- Change date in upgrade-ux (still 1.16) [gdhaese1]
- Fix the docker restart (#107) and reboot-required stuff (#108)
  [gdhaese1]
- #107 - stop only the running containers. [gdhaese1]
- Add new INI file Linux-redhat-6-2019.ini #105. [gdhaese1]
- Change /usr/bin/rpm into /bin/rpm for RHEL 6 #106. [gdhaese1]
- Fix the exclude_packages errors #104. [gdhaese1]
- Fix the docker start/stop sequence #103. [gdhaese1]
- Pin version 1.16. [gdhaese1]
- Saving knife node show output #100. [Gratien D'haese]
- #98 - make sure variable exclude_packages is empty before any other
  check (for hp) [Gratien D'haese]
- #98 exclude_packages for Linux. [Gratien D'haese]
- Adding DNF to Linux.conf #98. [Gratien D'haese]
- INI files for centos7 and rhel7 for yeat 2019 #99. [Gratien D'haese]
- Adding Control M agant stop/start scripts #96. [Gratien D'haese]
- Remove script preinstall/GNU/Linux/27_stop_ntpd.sh #97. [Gratien
  D'haese]
- Updating man page with exclude.packages. [Gratien D'haese]
- Foresee a manner to exclude package from upgrade-ux (HP-UX only for
  the moment) #98. [Gratien D'haese]
- Fix the worng copy of /etc/sudoers file on HP-UX #95. [Gratien
  D'haese]
- Flush journals and rm old yum cache #94. [gdhaese1]
- Updat dmlurl in config #93. [Gratien D'haese]
- If YEAR=2018 or higher do not run hpsim related scripts anymore -
  obsolete. [Gratien D'haese]
- Add centos 2018 ini file. [Gratien D'haese]
- Improved grep to catch misspelled name #91. [Gratien D'haese]
- Fix the empty [install] section for HP-UX 2018. [Gratien D'haese]
- Added new INI file HP-UX-11.31-2018.ini; and sshd_config for cipher
  fix. [Gratien D'haese]
- Check if ntpd is running - to avoid error messages in log when ntpd is
  not running. [Gratien D'haese]
- Avoid empty docker_info.after file when no docker is installed (in the
  log file) [Gratien D'haese]
- Give some advise how to clean up #86. [Gratien D'haese]
- Grep error in all possible cases (upper/lower/combination) #88.
  [Gratien D'haese]
- Stop/start docker service #88. [Gratien D'haese]
- Stop/start ntp daemon #88. [Gratien D'haese]
- Fix missing space for double quote - #86. [Gratien D'haese]
- Bring release to 1.15. [Gratien D'haese]
- New script to remove duplicate packages - issue #87. [Gratien D'haese]
- Add script to verify RPM Packages database - issue #87. [Gratien
  D'haese]
- Repeat all ERRORs found during a preview run on STDOUT - issue #86.
  [Gratien D'haese]
- Better logging of grub2 entries #85. [Gratien D'haese]
- Put -xdev option before all other options #83. [Gratien D'haese]
- NBU: check also for VM snapshots #84. [Gratien D'haese]
- Adding grub2-mkconfig script. [Gratien D'haese]
- Stop & start script for tidal - issue #82. [Gratien D'haese]
- Start crond #81. [D'Haese, Gratien [GTSBE - Non JJ]]
- Stop crond #81. [D'Haese, Gratien [GTSBE - Non JJ]]
- Fix typo in readme. [Gratien D'haese]
- Merge branch 'master' of github.com:gdha/upgrade-ux. [Gratien D'haese]
- Correct the 'yum list-sec' into 'yum updateinfo list security all' See
  issue #80. [Gratien D'haese]
- 44_enable_on_rhel_yum_repos.sh - send std output to logfile #76.
  [Gratien D'haese]
- New script 70_define_default_runlevel.sh after patching #79. [Gratien
  D'haese]
- Correct script name to 50_save_default_runlevel.sh and make it safer
  for errors - #79. [Gratien D'haese]
- Save default runlevel - #79. [Gratien D'haese]
- Make sure 43_restore_yum_enable_status.sh runs before
  44_enable_on_rhel_yum_repos.sh - #76. [Gratien D'haese]
- Enable all non-RHEL repos with 44_enable_on_rhel_yum_repos.sh #76.
  [Gratien D'haese]
- Add useful comments to 44_restore_yum_enable_status.sh - #76. [Gratien
  D'haese]
- Add some more comment to 43_save_yum_enable_status.sh #76. [Gratien
  D'haese]
- Add new script 39_save_yum_history.sh - #76. [Gratien D'haese]
- Add new script 39_save_yum_history.sh. [Gratien D'haese]
- Give saved yum repos a better name (yum_repos_before.tar) #76.
  [Gratien D'haese]
- Remove the GAB-RHEL-RPO.sh run from upgrade-ux as it is not our duty -
  see issue #76. [Gratien D'haese]
- Add comment to etc/opt/upgrade-ux/GNU/Linux-rhel-7-2017.ini. [Gratien
  D'haese]
- FIX for:  syntax error at line 5 : `==' unexpected. [Gratien D'haese]
- - update release to v1.13 (release for HP-UX sshd old cipher/kex
  issues) - added new INI file for RHEL 7 2018. [Gratien D'haese]
- Adding 2 new script for HP-UX 11.31 to fix missing ciphers and kex
  algorithms to remediate connections from older secure shell clients -
  see issue #74. [Gratien D'haese]
- As we will modify in a later stadium the sshd_config to add older
  ciphers and KexAlgorithms we remove the warning See issues #71 and
  #74. [Gratien D'haese]
- Adding rpm-sign rule in Makefile; upgrade-ux-user-guide.html was
  rebuild automatically. [D'Haese]
- Linux-rhel-7-2017.ini - remove --security from update. [Gratien
  D'haese]
- Prep/GNU/Linux/43_save_yum_enable_status.sh will not save the status
  of the current repos (enabled or not) in a file
  $VAR_DIR/$DS/yum.repo.enable.status Why? if that file is not present
  then script postexecute/GNU/Linux/44_restore_yum_enable_status.sh will
  do nothing. [Gratien D'haese]
- Remove scripts postexecute/GNU/Linux/42_remove_patch_repos.sh and
  postexecute/GNU/Linux/43_restore_original_repos.sh as we will not
  modify local repositories - out-of-scope for upgrade-ux. [Gratien
  D'haese]
- Remove scripts prep/GNU/Linux/45_remove_original_repos.sh and
  prep/GNU/Linux/47_configure_yum_repos.sh to manupilate and create new
  YUM repository files under /etc/yum.repos.d as we start with the
  assumptions that new repo files were already created on the system.
  This is not the task of upgrade-ux. See also issue #76. [Gratien
  D'haese]
- Update readme file. [Gratien D'haese]
- Recompiled upgrade-ux-user-guide.html. [Gratien D'haese]
- Man page converted to html. [Gratien D'haese]
- Replace LOGFILE by hostname in docs. [Gratien D'haese]
- Remove LOGFILE from find commandline - issue #72. [Gratien D'haese]
- Define HOSTNAME before LOGFILE - issue #72. [Gratien D'haese]
- Remove quest software - issue #75. [Gratien D'haese]
- Check files before executing - issue #75. [Gratien D'haese]
- Avoid script to run on 11.31 - issue #73. [Gratien D'haese]
- Set release to v1.12. [Gratien D'haese]
- Fix ksh == into = [Gratien D'haese]
- Verify sshd_config file after patching - report if different - issue
  #71. [Gratien D'haese]
- LOGFILE now contains also the hostname; issue #72. [Gratien D'haese]
- Fix 95_check_missing_programs.sh with ! has_binary - issue #70.
  [Gratien D'haese]
- Issue #69: yum.log diff logged into logfile (> -> <) [Gratien D'haese]
- Issue #68 - replacing sinle with double quotes. [Gratien D'haese]
- Fixed the rpm build with git buildversion number. [Gratien D'haese]
- Final tuning with repos. [Gratien D'haese]
- Reworked the Error function for issue #68. [Gratien D'haese]
- Test-error.sh. [Gratien D'haese]
- Test-error.sh. [Gratien D'haese]
- Test-error.sh. [Gratien D'haese]
- Test-error.sh. [Gratien D'haese]
- Add fail-safe method for GAB-RHEL-RPO.sh script. [Gratien D'haese]
- Reworked the stuff around GAB-RHEL-RPO.sh script; how do we know we
  have fetch the latest version? [Gratien D'haese]
- Fix the rpm build with proper rpmrelease info. [Gratien D'haese]
- Save the enabled state of the yum repos; re-enable before we quit.
  [Gratien D'haese]
- Forgot the cd - [Gratien D'haese]
- Fix rhn subscription after failed run. [Gratien D'haese]
- Remove the test script 50_force_an_error.sh. [Gratien D'haese]
- Test script for Error function. [Gratien D'haese]
- Improve the output of needs-restarting; less confusing. [Gratien
  D'haese]
- Improved ksh language. [Gratien D'haese]
- Increase versioning. [Gratien D'haese]
- Fix PrintLog -> LogPrint. [Gratien D'haese]
- Scripts added to temp. disable rhn satellite subscription and replace
  the original YUM repos with the patch repos; afterwards we restore
  everything to its original state. [Gratien D'haese]
- Using rhn_satellite_subscription variable. [Gratien D'haese]
- Move the yum scripts a bit to have some free nrs of other scripts.
  [Gratien D'haese]
- Do not disable local repos with rhn satellite. [Gratien D'haese]
- Get 40_needs_restarting.sh working correctly. [Gratien D'haese]
- 16_check_nbu_backup.sh" replace bplist by bpps test. [Gratien D'haese]
- New script 40_needs_restarting.sh. [Gratien D'haese]
- Add safety into script. [Gratien D'haese]
- Rewrote 29_save_and_diff_kernel_version.sh to work with the
  CURRENT/AVAILABLE_KERNEL versions and added new script
  (95_reboot_required.sh) to invoke automatic reboot. [Gratien D'haese]
- Addeded the REQUIRED_PROGS array in configuration files and the prep
  script 95_check_missing_programs.sh. [Gratien D'haese]
- New script: 30_install_software.sh (to install GNU/Linux software)
  according to the /etc/opt/upgrade-ux/GNU/Linux-rhel-7-2017.ini file.
  [Gratien D'haese]
- Made wget less verbose. [Gratien D'haese]
- Fix some typos in 40_enabling_local_repos_with_satellite.sh and
  40_disabling_local_repos_with_satellite.sh. [Gratien D'haese]
- New script
  postexecute/GNU/Linux/40_enabling_local_repos_with_satellite.sh.
  [Gratien D'haese]
- New Scripts: - 40_disabling_local_repos_with_satellite.sh -
  41_configure_yum_repos.sh. [Gratien D'haese]
- Save rpm -qa output after patching. [Gratien D'haese]
- Save and show diff in yum.log. [Gratien D'haese]
- Updating prep/GNU/Linux/35_check_rear_image.sh. [Gratien D'haese]
- Added new scripts to save and compare the kernel version. [Gratien
  D'haese]
- Check the major system release before/after and compare; moved the
  dmesg to the default tree. [Gratien D'haese]
- Adding the Trend Micro Deep Security scripts. [Gratien D'haese]
- Added new scripts:  - preinstall/readme  -
  preinstall/GNU/Linux/06_yum_clean_all.sh  -
  prep/GNU/Linux/40_yum_repolist.sh And modified some older genric
  scripts which worked fine on HP-UX but on Linux they were giving
  unexpected output. After correction is should work fine on both HP-UX
  and Linux. [Gratien D'haese]
- Save the yum.log file. [Gratien D'haese]
- Save some RH Satellite info. [Gratien D'haese]
- Space requirement check script for Linux. [Gratien D'haese]
- Add check against LinuxShield. [Gratien D'haese]
- Define HOSTNAME as short hostname on Linux. [Gratien Dhaese]
- Empty INI file for RHEL 7. [Gratien Dhaese]
- Finalize the HP-UX-11.31-2017.ini. [Gratien D'haese]
- Make the INI file visible during the dump workflow - issue #67.
  [Gratien D'haese]
- Update README. [Gratien D'haese]
- Update version to 1.10. [Gratien D'haese]
- Add ini files for year 2017. [Gratien D'haese]
- We rewrote the script partially and used the ntpd itself to first
  modify the netdaemons file and afterwards we correct it manually issue
  #65. [Gratien D'haese]
- To fix the problem with: 2016-11-04 14:15:29 Including
  postinstall/hp/85_reinstate_sudoers.sh 2016-11-04 14:15:30 Copy back
  the original /etc/sudoers file: /etc/sudoers: No such file or
  directory chmod: can't access /etc/sudoers. [Gratien D'haese]

  We forgot the else clausule with the 'cmp' command.
  Issue #64
- Fix the fix of the fix - pff with ntpd bs xntpd - issue #65. [Gratien
  D'haese]


1.9 (2016-11-03)
----------------
- Increasing version in upgrade-ux. [Gratien D'haese]
- Double protect /etc/sudoers file with a 2th copy
  (/etc/sudoers.upgrade-ux.before) see issue #64. [Gratien D'haese]
- Exlude the script name from grep - costmetic. [Gratien D'haese]
- The ^sign was still in front of ^AUTOSTART_CMCLD after edit - isse
  #61. [Gratien D'haese]


1.8 (2016-10-20)
----------------
- Increasing version in upgrade-ux. [Gratien D'haese]
- Correct init-level in inittab file after patching on hpux - issue #61.
  [Gratien D'haese]
- Make AUTOSTART_CMCLD=1 if needed - see issue #61. [Gratien D'haese]
- Add symbolic link to /usr/local/sbin/visudo; close #62. [Gratien
  D'haese]
- Disable cfg2html post-execute - iss- close issue #63. [Gratien
  D'haese]


1.7 (2016-09-15)
----------------
- Enhance the locking mechanism - issue #60. [Gratien D'haese]
- Mv 85_reinstate_sudoers.sh script from preinstall to postinstall -
  issue #58. [Gratien D'haese]
- Use the correct path for smhconfig - issue #57. [Gratien D'haese]
- Add most important variables in local.conf with some comments.
  [Gratien D'haese]
- Move to install of sudo to the correct section - issue #58. [Gratien
  D'haese]
- Issue #57 - hpsmh with openssl 1.0.2. [Gratien D'haese]
- Make sure version nr is mentioned in the ini file to avoid TUI of
  swremove; issue #58. [Gratien D'haese]
- Bring to v1.7. [Gratien D'haese]
- Etc/opt/upgrade-ux/HP-UX-11.31-2016.ini: removed old apache and sudo
  (#58, #59) new file: prep/hp/74_save_sudoers.sh (#85) new file:
  preinstall/hp/85_reinstate_sudoers.sh (#85) [Gratien D'haese]
- Send output to logging configure/hp/72_verify_ntpd_in_netdaemons.sh.
  [Gratien D'haese]
- Bring to release 1.6. [Gratien D'haese]
- Add PREVIEW mode into script 45_disable_swat_in_inetd.sh. [Gratien
  D'haese]
- Forgot the PREVIEW mode rule in 72_verify_ntpd_in_netdaemons.sh -
  issue #56. [Gratien D'haese]
- For issue #56 - xntpd became ntpd after patching on HP-UX 11.31 OVO
  give lots of errors xntpd is not running. [Gratien D'haese]
- Issue #55 - compare the /etc/nsswitch.conf file before/after patching.
  [Gratien D'haese]
- Before going further let us check it was not already disabled or
  defined before (issue #54) close #54. [Gratien D'haese]
- Fix missing quote in 55_fix_uvscan_exclude_list.sh; issue #53.
  [Gratien D'haese]
- Added zlib swinstall for HP-UX 11.31. [Gratien D'haese]
- Show the X509 difference on screen output as well. [Gratien D'haese]
- Fix empty array nr by removing empty lines; issue #52. [Gratien
  D'haese]
- Purpose: add /tmp/cfg2html_* to /opt/uvscan/exclude.list (issue #53) -
  new script: prep/default/72_save_uvscan_exclude_list.sh - new script:
  configure/default/55_fix_uvscan_exclude_list.sh. [Gratien D'haese]
- Corrected the errcnt IPD_report.[before|after] See issue #52. [Gratien
  D'haese]
- New scripts around TCP_SACK_ENABLE critical patch warning on HP-UX *
  prep/hp/71_save_nddconf.sh *
  configure/hp/50_add_tcp_sack_in_nddconf.sh. [Gratien D'haese]
- Start DCE daemons before starting measureware close #51. [Gratien
  D'haese]
- Prep/hp/70_save_installed_products_database.sh: prevent multiple runs
  during preview (issue #43) [Gratien D'haese]
- Set the date to 10-March. [Gratien D'haese]
- * new script postexecute/hp/37_start_snmp.sh * new script
  preinstall/hp/24_shutdown_snmp.sh close #42. [Gratien D'haese]
- * new script postinstall/hp/70_save_installed_products_database.sh *
  updated prep/hp/70_save_installed_products_database.sh * see issue
  #43. [Gratien D'haese]
- New script 70_save_installed_products_database.sh (IPD check) - issue
  #43. [Gratien D'haese]
- Increment version to 1.5. [Gratien D'haese]
- Removed old date from README. [Gratien D'haese]
- New INI file for HP-UX 11.31 for RMP 2016. [Gratien D'haese]
- INI file for 11.23. [Gratien D'haese]
- INI file for RMP-2016 for HP-UX 11.11. [Gratien D'haese]
- Prep/hp/26_check_bootconf.sh: rewrote the script a bit to have a
  better logic overview of the possible issues we see with
  /stand/bootconf. The previous script has some misleading messages See
  issue #50. [Gratien D'haese]
- Close #48. [Gratien D'haese]
- Close #49. [Gratien D'haese]
- Close #39. [Gratien D'haese]
- 66_save_ipfconf.sh: replace lhost by HOSTNAME. [Gratien D'haese]
- Fix the specfile and makefile for linux rpm packaging. [Gratien
  D'haese]
- Correct type in spec file. [Gratien D'haese]
- /usr/bin/grep was not found - just use grep instead. [Gratien D'haese]
- Used %{name} instead of upgrade-ux everywhere possible. [Gratien
  D'haese]
- Prep/default/70_check_openssl_logjam.sh: fix logic error with -s test.
  [Gratien D'haese]
- Fix the OpenSSL LogJam issue for HP-UX and Linux close #46. [Gratien
  D'haese]
- Prep/default/70_check_openssl_logjam.sh: write the vulnerable config
  files into $VAR_DIR/$DS/OpenSSL_LogJam_EXP_vulnerable_httpd_conf_files
  which we use again in the configure phase as input to fix the issue.
  [Gratien D'haese]
- New script 70_check_openssl_logjam.sh to verify httpd config files on
  vulnerability CVE-2015-4000 issue #46. [Gratien D'haese]
- Increase version from 1.3 to 1.4 (main script) [Gratien D'haese]
- Increase release of NCS_UTILS from B.1.3.25 to B.1.3.27 close #44.
  [Gratien D'haese]
- Prep/hp/26_check_bootconf.sh: added FORCED check to be able to
  continue in preview mode (or upgrade). However, in the log file we
  explicit mention ERROR so it will be catched in the reporting. close
  #45. [Gratien D'haese]
- HP-UX-11.31-2015.ini: final additions made for HP-UX 11.31 updates.
  [Gratien D'haese]
- Forgot to change 2014 into 2015 with update-ux command (in ini file
  for 11.31) [Gratien D'haese]
- Changed the version from 1.2 to 1.3 in main script. [Gratien D'haese]
- Add 2 new scripts to detect and fix the sendmail poodle attact
  (CVE-2014-3566) * prep/hp/69_check_sendmail_poodle.sh *
  configire/hp/27_fix_sendmail_poodle.sh. [Gratien D'haese]
- HP-UX-11.31-2015.ini: updated for 2015. [Gratien D'haese]
- Add INI file for HP-UX 11.23 for year 2015. [Gratien D'haese]
- Adding the INI file for HP-UX 11.11 for year 2015. [Gratien D'haese]
- New script 68_save_cimtrust.sh to save the cimtrust -l output if any
  (see issue #39) [Gratien D'haese]
- Make the logfile readable for all users
  (cleanup/default/95_show_logfile_location.sh) close #35. [Gratien
  D'haese]
- New script configure/hp/80_verify_init_level.sh - see issue #37.
  [Gratien D'haese]
- New script prep/hp/31_check_ghost_disk.sh - see issue #38. [Gratien
  D'haese]
- Added the mount output scripts (prep and postinstall) close #34.
  [Gratien D'haese]
- Close #33. [Gratien D'haese]
- Added a WBEMextras lines. [Gratien D'haese]
- 26_check_bootconf.sh: send non-relevant errors to /dev/null for
  lvlnboot. [Gratien D'haese]
- Created empty ini for for HP-UX 11.31 for the year 2015. [Gratien
  D'haese]
- Script detect multiple HPUX11i-VSE-OE bundles and refer to issue #32
  as work-around in the log close #32. [Gratien D'haese]
- The man page copied to /usr/share/man/man8 and fixed the
  /etc/opt/upgrade-ux/ copy. [Gratien D'haese]
- Minor updates after running rpmlint; mainly rpmlint complains about
  /opt is not suitable for scripts However, we choose for /opt to be in-
  line with other UNIX distributions (I know the scripts should live
  under /usr/share/upgrade-ux/, but we deliberate choose not to go for
  that) [Gratien D'haese]
- Updates to make rpm working. [Gratien D'haese]
- Made some progress on make rpm for Linux. [Gratien D'haese]
- Move the start/stop script for OVO opcagt from hp dir to default dir
  (as it can be a common operation for different OSes) [Gratien D'haese]
- Adding empty INI file for SLES 11. [Gratien D'haese]
- Adding scripts to stop/start McAfee LinuxShield anti-virus services.
  [Gratien D'haese]
- Moving prep/fedora/30_save_rpm_qa.sh to
  prep/GNU/Linux/30_save_rpm_qa.sh and adding check on $RPM executable
  (makes more sense) [Gratien D'haese]
- New script prep/GNU/Linux/27_save_grub_menu.sh. [Gratien D'haese]
- New script prep/default/17_list_nbu_backup_status.sh to list all NBU
  backups. [Gratien D'haese]
- Added a empty INI file etc/opt/upgrade-ux/GNU/Linux-centos-7-2015.ini;
  added scripts/GNU/Linux/35_check_rear_image.sh for generic Linux
  distro to check rear images; added scripts/fedora/30_save_rpm_qa.sh to
  save the output of rpm -qa (for fedora/RHEL related distro's)'
  modified etc/opt/upgrade-ux/GNU/Linux.conf (added RPM variable)
  [Gratien D'haese]
- Opt/upgrade-ux/scripts/init/default/02_print_host_info.sh: addeed tail
  -1 to avoid also printing IP address of NS server. [Gratien D'haese]
- Made some progress with the rpm spec file, debian files and Makefile.
  [Gratien D'haese]
- Added draft version of Linux spec file. [Gratien D'haese]


1.2 (2014-08-25)
----------------
- - increase version 1.1 to 1.2 in upgrade-ux main script - remove all
  Progress* related functions. [Gratien D'haese]
- New file: prep/hp/61_save_network_drivers_in_use.sh: list network
  drivers in use (HP-UX 11.31) new file:
  install/hp/29_include_drivers_in_update_ux.sh: populate string
  network_bundles (using file network.drivers) modified:
  install/hp/30_install_bundles.sh: update/ux also includes
  $network_bundles. [Gratien D'haese]


1.1 (2014-08-19)
----------------
- Increase v1.0 to v1.1. [Gratien D'haese]
- 45_check_serviceguard.sh: describe WARNING/ERROR about clusternode a
  bit better 66_save_ipfconf.sh: remove the redundant ipfstat line
  (there is a symbolic link) [Gratien D'haese]
- Correct a bad copy/paste in 66_save_ipfconf.sh. [Gratien D'haese]
- Improve the ipconf script. [Gratien D'haese]
- We comment  #Source $LIB_DIR/progresssubsystem.nosh in upgrade-ux main
  script to avoid reading duplicate functions. Will be removed later.
  See issue #26. [Gratien D'haese]
- Make sure we save rc.log before and after patching. [Gratien D'haese]
- Prep/hp/66_save_ipfconf.sh and configure/hp/25_fix_ipfconf.sh were
  added to work around the behavior of IP Filter on HP-UX 11.23 which is
  turned on after updating. Can lead to SG crashes. See issue #30.
  [Gratien D'haese]
- Adding prep/default/31_save_env_output.sh. [Gratien D'haese]
- Fix a compliance issue between checklist and script. We now check for
  vPar version >A.04 instaead of A.04.04.04 close #27. [Gratien D'haese]
- Fix the OEMVER variable as we have seen the following: HPUX11i-VSE-OE
  B.11.31 HPUX11i-VSE-OE                        B.11.31 close #28.
  [Gratien D'haese]


1.0 (2014-07-04)
----------------
- Make version 1.0. [Gratien D'haese]
- Get the banner better. [Gratien D'haese]
- Update the project readme file. [Gratien D'haese]
- Adding upgrade-ux-user-guide.html to the repo as well. [Gratien
  D'haese]
- Added some more FAQs to the user guide. [Gratien D'haese]
- Merge branch 'master' of github.com:gdha/upgrade-ux. [Gratien D'haese]
- Replaced the mktemp call to a generic function GenerateTempName add
  function in lib/global-functions.sh; and modified script
  scripts/init/default/03_prepare_tmp_build_area.sh. [Gratien D'haese]
- Lots of updates to the user guide. [Gratien D'haese]
- Added upload tag to Makefile to upload user guide (HTML) to
  www.it3.be/projects/ dir It is a manual process (upload is not part of
  all) [Gratien D'haese]
- Fix a typo in 01-introduction.txt. [Gratien D'haese]
- 05-usage.txt was missing on github. [Gratien D'haese]
- Updates to the user guide performed. [Gratien D'haese]
- Merge branch 'master' of github.com:gdha/upgrade-ux. [Gratien D'haese]
- Fix a minor issue of grepping the ID out of the /etc/os-release file
  (for rhel 7) [Gratien D'haese]
- Added a new chapter on "Basic usage" [Gratien D'haese]
- Updates to man and user guide. [Gratien D'haese]
- New script: install/hp/50_exit_on_not_enough_space.sh to halt upgrade-
  ux when there is not enough disk space to run a successful update-ux
  renamed cleanup/hp/46_verify_insufficient_space.sh to
  46_verify_not_enough_space.sh to avoid conflicts with the grep of the
  keyword 'insufficient' close #19. [Gratien D'haese]
- Cleanup up the 28_add_install_ended_mark_script.sh script (remove
  PREVIEW section and correct date/time stamp) See issue #20. [Gratien
  D'haese]
- Update main script: (( DEBUG )) => (( "$DEBUG" )) being less
  restrictive on validation, but no errors anymore on HP-UX. [Gratien
  D'haese]
- Fixes: stepbystep issue; and increase version nr to 0.9. [Gratien
  D'haese]
- New script 30_check_stale_lvols_vg00.sh: detect stale lvol extends
  close #18. [Gratien D'haese]
- Correcting the faulty corrections. [Gratien D'haese]
- The validate rules on HP-UX complained on the [[ == ]] syntax so
  replaced it by [ = ] [Gratien D'haese]
- Make HP happy again? [Gratien D'haese]
- Correcting validation rules on Linux. [Gratien D'haese]
- Forgot the lib scrript in validate rule (Linux Makefile) [Gratien
  D'haese]
- Implement some more Linux validate recommendations. [Gratien D'haese]
- Implement the Linux validate recommendations. [Gratien D'haese]
- Applying Linux validate rules. [Gratien D'haese]
- Added Linux validate recommendation on postremove scripts. [Gratien
  D'haese]
- Implemented the validate recommendations (of Linux) on cleanup
  scripts. [Gratien D'haese]
- Missed one recommendation in init. [Gratien D'haese]
- Update the init script occording the validate recommendation (ran on
  Linux) [Gratien D'haese]
- Added the initial Makefile to build Linxu rpm (wanted to have the
  validate working) [Gratien D'haese]
- Updated the HPUX PSF file to have the user-guide copied into
  /opt/upgrade-ux/doc/ directory close #25. [Gratien D'haese]
- Save the timestamp while cp /etc/rc.log file. [Gratien D'haese]
- New script postexecute/hp/45_restore_hpsim_conf.sh to restore original
  HPSIM_irsa.conf file close #24. [Gratien D'haese]
- Update the man page a bit. [Gratien D'haese]
- Moved the user-guide section from man directory to doc directory.
  [Gratien D'haese]
- New script configure/hp/37_prngd_startup.sh for HP-UX 11.11 only so we
  get prngd started before sshd close #23. [Gratien D'haese]
- Fix a link in chapter 1. [Gratien D'haese]
- Adding the initial (WiP) user guide. [Gratien D'haese]
- Fix some spelling in default.conf file. [Gratien D'haese]
- New script: cleanup/hp/46_verify_insufficient_space.sh to show
  insufficient disk space just after the ERROR warning script
  (45_grep_error_in_logfile.sh) see issue #19. [Gratien D'haese]
- New scripts to assist update-ux (11.31 only) to add an 'install:ended'
  marker in our status file, so we can skip the install stage after the
  reboot. See issue #20. [Gratien D'haese]
- New script: cleanup/default/10_rm_old_cfg2html_reports.sh to remove
  old cfg2html data file > 30 days close #22. [Gratien D'haese]
- New script: prep/hp/65_check_sw_defaults.sh adding default SD option
  mount_all_filesystems=false to /var/adm/sw/defaults close #21.
  [Gratien D'haese]
- Updating the Timeout function to fix a random kill issue (global-
  function.sh) [Gratien D'haese]
- Increase version from 0.7.to 0.8. [Gratien D'haese]
- Used the wrong function name - should have been LogPrint
  (02_print_host_info.sh) [Gratien D'haese]
- New script 02_print_host_info.sh: to show hostname, IP, architecture
  in the logfile close #17. [Gratien D'haese]
- Improve the SDSERVER explaination in init/hp/30_define_sdserver.sh.
  [Gratien D'haese]
- Adding new script to save the kernel parameters before and after
  reboot: * prep/hp/35_save_kernel_parameters.sh *
  postinstall/hp/33_save_kernel_parameters.sh * do a diff between the
  kernel_parameter.before/after (34_diff_kernel_parameters.sh) *
  modifief 35_st_san_safe.sh: check for kernel tunable before trying to
  tune it close #16. [Gratien D'haese]
- New script 40_report_failed_swinstall.sh and
  45_grep_error_in_logfile.sh to find errors and show these close #15.
  [Gratien D'haese]
- New script cleanup/default/95_show_logfile_location.sh to show the
  location of the logfile moved
  20_mv_sw_installation_in_progress_file.sh to
  80_mv_sw_installation_in_progress_file.sh (more to the end) [Gratien
  D'haese]
- New scripts prep/hp/51_save_inetd.sh, postinstall/hp/51_save_inetd.sh
  and configure/hp/45_disable_swat_in_inetd.sh to disable the 'swat'
  lines in /etc/inetd.conf close #13. [Gratien D'haese]
- Modify 26_check_bootconf.sh: check primary bootdisk variable; when
  empty bail out with an error close #12. [Gratien D'haese]
- HP-UX Makefile: added the validate rule. [Gratien D'haese]
- Updating the HP-UX INI files. [Gratien D'haese]
- Bin/upgrade-ux: increase version nr 0.6 to 0.7. [Gratien D'haese]
- Modified init/hp/30_define_sdserver.sh: add SD server itsimgau
  (Sydney) [Gratien D'haese]
- New script prep/hp/12_check_swlist_permissions.sh: swlist may fail
  with an error like RPC exception: "Connection request timed out (dce /
  rpc)" which may indicate a too strict firewall ruleset close #10.
  [Gratien D'haese]
- New script configure/hp/22_mv_old_cfg2html_local_config.sh which moves
  /etc/cfg2html/local.conf close #11. [Gratien D'haese]
- Postinstall/hp/27_show_cimprovider.sh: check if cimserver is running;
  if not start it close issue #9. [Gratien D'haese]
- New script 38_restart_gated.sh to restart gated daemon. [Gratien
  D'haese]
- Adding the start/stop script for the cron scheduler. [Gratien D'haese]
- Increase version nr 0.5 to 0.6. [Gratien D'haese]
- Updating the man pages. [Gratien D'haese]
- Add postexecute script to remove old HPSIM/HP WEBES subscriptions if
  any. [Gratien D'haese]
- Move postexecute/hp/38_start_quest.sh to
  postexecute/default/38_start_quest.sh to be similar as the preinstall
  phase. [Gratien D'haese]
- * lots of new files in postexecute to start (or re-start) the stopped
  daemons (only useful in case no reboot is performed during upgrade
  mode) [Gratien D'haese]
- Modified 40_inspect_mpt_settings.sh: added PREVIEW block close #8.
  [Gratien D'haese]
- Man page was double compressed (by Makefile and by postinstall.sh
  script) - once is enough ;-) [Gratien D'haese]
- Update Makefile of man page. [Gratien D'haese]
- HP-UX upgrade-ux.psf - oncly copy upgrade-ux.8 man-page and upgrade-
  ux.8.html file to /opt/upgrade-ux/man/ [Gratien D'haese]
- Bin/upgrade-ux: increase VERSION=0.4 into 0.5. [Gratien D'haese]
- New script configure/hp/40_inspect_mpt_settings.sh - ULTRA320 type
  cards A6961 must run at speed ultra160 instead of ultra320. Purpose of
  this script is to inspect all the ultra320 HBA and mpt start-up file
  and if needed redfine it. [Gratien D'haese]
- * modified configure/hp/35_sshd_config_sftp_fix.sh : set the mode on
  /opt/ssh/etc/sshd_config. [Gratien D'haese]
- Modified configure/hp/30_restore_centrifydc_startup_script.sh to
  restore /sbin/init.d/centrifydc file in case a new version of
  centrifyDC was installed. [Gratien D'haese]
- Related to issue #7 - added 2 new scripts:   *
  prep/hp/23_save_shutdownlog.sh   *
  postinstall/hp/08_save_shutdownlog.sh (when system rebooted touch
  .rebooted) - modified script:   * postinstall/hp/09_reboot_required.sh
  : trigger sleep or not (according file .rebooted present or not)
  [Gratien D'haese]
- Pre-define daysup=0 in preinstall/default/05_reboot_required.sh -
  related to issue #7. [Gratien D'haese]
- About issue #6 : prepending 'echo' to the cleanup command (so default
  is still 'n') - saved mode Should be remove the patches? If yes, then
  then these will be committed first - do we want this? [Gratien
  D'haese]
- Adding the postinstall/hp/18_show_patches.sh (was missing it in the
  evidence) [Gratien D'haese]
- * added man page (and documentation to come) to the PSF file *
  create/remove the man page /usr/share/man/man8.Z/upgrade-ux.8.
  [Gratien D'haese]
- Update the man page. [Gratien D'haese]
- * added -F (forced continuation) option in bin/upgrade-ux and
  lib/help-workflow.sh * introduced the FORCED check in
  prep/hp/19_check_patches.sh (only there for the moment) [Gratien
  D'haese]
- Ncrease version nr from 0.3 to 0.4. [Gratien D'haese]
- Add new file postinstall/hp/09_reboot_required.sh - to wait for a
  reboot (if any) code needs some better knowledge if a reboot is
  planned (how?) [Gratien D'haese]
- 30_install_bundles.sh - add " arround the filename. [Gratien D'haese]
- * new INI file for HP-UX 11.23: HP-UX-11.23-2014.ini * update HP-UX
  Makefile to add a timestamp into Release date variable. [Gratien
  D'haese]
- The status file should be appended not overwritten (by
  90_preview_ended_successfully.sh) [Gratien D'haese]
- Modified the way we decide if preview mode ended successfully; changed
  were necessary in the files:
  -cleanup/default/90_preview_ended_successfully.sh
  -init/default/12_upgrade_allowed.sh
  -init/default/15_check_preview_run.sh WHY? after a reboot we must be
  able to pick up from the point were we left the upgrade-ux process.
  [Gratien D'haese]
- Increment release nr 0.2 into 0.3 (upgrade-ux main script) [Gratien
  D'haese]
- Change 2013 into 2014 depot name (HP-UX-11.11-2014.ini) [Gratien
  D'haese]
- * changed in defualt/local.conf the GNU v2 into v3 * updated HP-
  UX-11.11-2014.ini. [Gratien D'haese]
- Add verification after the upgrade of the swlist before and after.
  [Gratien D'haese]
- Modify the 80_run_cmds_defined_in_ini.sh scripts to check if command
  is executable. [Gratien D'haese]
- Rename the hp/20_rm_sw_installation_in_progress_file.sh to
  hp/20_mv_sw_installation_in_progress_file.sh which makes more sense.
  [Gratien D'haese]
- Added new file cleanup/hp/20_rm_sw_installation_in_progress_file.sh :
  rename the file with suffix .preview. [Gratien D'haese]
- * new file 30_shutdown_quest.sh: to stop Quest related processes * new
  file 22_shutdown_opcagt.sh: to stop OV OpC agents. [Gratien D'haese]
- New file 27_save_hpsim_conf.sh: save copy of HPSIM_irsa.conf if found.
  [Gratien D'haese]
- * added 2 new scripts in
  postinstall/hp/[25_check_corrupt_filesets.sh|27_show_cimprovider.sh] *
  modified 51_diff_crontab.sh to also show on screen the diffs *
  modified 52_save_centrifydc.sh: to show version in adinfo output (1
  file less) * modified several script under prep/hp to cp with '-p'
  option (save timestamp of original file) [Gratien D'haese]
- * Makefile: fix the issue with upgrade-ux.8.txt removal (it was save
  copy of upgrade-ux.8) - renamed the save copy as upgrade-ux.8.save *
  Problem with disappearing upgrade-ux.8.txt will now be fixed. [Gratien
  D'haese]
- 35_sshd_config_sftp_fix.sh: extended the grep into -E
  '(SftpLog|LogSftp)' close #2. [Gratien D'haese]
- Adding man page again. [Gratien D'haese]
- * version nr incremented to 0.2 in upgrade-ux & upgrade-ux.psf *
  60_save_lan_speed.sh: fixed type in before and changed .txt into
  .before * upgrade-ux.8.txt got deleted again - why?? [Gratien D'haese]
- Correct the syntax for proper selection of the patch/driver bundle.
  [Gratien D'haese]
- * fixed the postinstall sw bundle installation - take version in
  account * updated HP-UX-11.11-2014.ini with some corrections. [Gratien
  D'haese]
- Fix the postexecute/default/80_run_cmds_defined_in_ini.sh with
  incrementing i when cmd is empty. [Gratien D'haese]
- Remove 'set -x' from script. [Gratien D'haese]
- Added upgrade-ux.8.txt (again I think?) [Gratien D'haese]
- * fix the cmviewcl output for node status (works now on all HP
  versions and different SG versions) * fixed a logic error with
  check_patches output (between previews) we may not blindly assume all
  was fine (so also check for errors in old outptu and when found rerun
  check_patches once more) * why is the man/upgrade-ux.8.txt deleted
  again??? [Gratien D'haese]
- Compare LAN speeds after reboot with saved values. Give a warning if
  it seems to be different. [Gratien D'haese]
- Added new script to record lan speed; fix empty command element.
  [Gratien D'haese]
- Added INI for HP-UX 11.11 and corrected the 11.31 a bit. [Gratien
  D'haese]
- Forgot to add the PREVIEW mode if-block; otherwise some people might
  get frustrated when running in preview mode and cmenqord was killed.
  [Gratien D'haese]
- Adding the check for cmenqord presence. [Gratien D'haese]
- Adding the HP SIM related scripts. [Gratien D'haese]
- Duplicate script (move to default/80...) [Gratien D'haese]
- Added some missing cmds execution triggered from INI file; also built-
  in safegaurd when cmd is empty. [Gratien D'haese]
- Save a copy of the sendmail.cf file. [Gratien D'haese]
- Save a copy of /usr/lib/tztab file before patching, cmp after after
  patching and point them to the special instructions as it is to
  dangerous to do it via a script (for the moment) [Gratien D'haese]
- Make a safe copy of current tz file; after patching check if it was
  modified and if required copy back the original one. [Gratien D'haese]
- * add centrifyDC prep/postinstall scripts and compare the startup
  files; and check the sshd_config file for HP-UX 11.11 only * fix typo
  in 20_uncomment_cfg2html_in_crontab.sh (missing $ in front of TMP_DIR)
  * add notion of release nr in 30_install_bundles.sh. [Gratien D'haese]
- Re-adding the man (txt form) as we seem to have lost it (thanks to
  github we recovered it) [Gratien D'haese]
- Added the cfg2html configure script to uncomment the cfg2html in cron
  (HP-UX and Linux) [Gratien D'haese]
- Started with the configure section (for the moment only cfg2html)
  [Gratien D'haese]
- Add a special check on PREVIEW var; and fixed two typos. [Gratien
  D'haese]
- Changed the logging method of evidence files; instead of using
  file.$DS we now save it as $DS/file. [Gratien D'haese]

  Also, double check that $VAR_DIR/$DS has been created during the init phase
- Improve the SDSERVER definition - now check if it was already defined
  manually (in local.conf) [Gratien D'haese]
- Remove the enforce_dependencies=false. [Gratien D'haese]
- Add a check for smpd.conf file. [Gratien D'haese]
- Added the man page for upgrade-ux (actually build on Linux!) [Gratien
  D'haese]
- Change VERSION nr from 1.0 into 0.1 and updated makefile to create
  depot on HP-UX. [Gratien D'haese]
- New script for HP-UX 11.31 to inspect SAN tape settings. [Gratien
  D'haese]
- Finish stape monitoring disable script for HP-UX 11.11 and 11.23.
  [Gratien D'haese]
- Some minor corrections after test run. [Gratien D'haese]
- 46_verify_firmware_versions.sh shows FW and should verify if it is
  current or not? [Gratien D'haese]
- Add 16_save_machinfo.sh to save output of 'machinfo' which contains
  details on firmware. [Gratien D'haese]
- Stape_monitor is only for HP-UX 11.11 and 11.23. [Gratien D'haese]
- WiP for script to disable stape when found process running. [Gratien
  D'haese]
- Foresee script to install additional sw packages. [Gratien D'haese]
- Adding some new script for the postinstall phase: - saving some log
  file - diff pam.conf - compate icapstatus - check if global patch
  bundle was installed. [Gratien D'haese]
- Add a check for tape devices and when found after patch installation
  check for the kernel tunable st_san_safe (should be set to 1) [Gratien
  D'haese]
- Remove the line containing date/time so make diff easier afterwards.
  [Gratien D'haese]
- Take in account that uptime may be expressed in hours instead of days.
  [Gratien D'haese]
- Introduced a status file for sw installed - to set CURRENT_STATUS
  after reboot. [Gratien D'haese]
- Make sure that prep defines a prep:start when init:ended was found
  (also follow the logic) [Gratien D'haese]
- Make sure that stage init also has a status "init:ended" which is
  logic with the remaining stages. [Gratien D'haese]
- Still busy with install stage (HP only) - WiP. [Gratien D'haese]
- Added script to update the update-ux program (info comes from
  INI_FILE) [Gratien D'haese]
- Added the script to read their section from the INI file. [Gratien
  D'haese]
- Added script to read section from INI file. [Gratien D'haese]
- Added new script 30_define_sdserver.sh to define SDSERVER variable; in
  global-functions.sh added PingServer function (to check SDSERVER
  availability); and in HP-UX-11.31-2014.ini defined the SD Path
  hardcoded (for the time being) [Gratien D'haese]
- Adding cleanup command and run commands defined in INI section.
  [Gratien D'haese]
- Adding lots of preinstall scripts to shutdown critical process before
  patching (HP-UX only) [Gratien D'haese]
- Remove PREVIEW from default.conf and add new script
  05_reboot_required.sh to check if a reboot is required if
  DAYSUPTIME=30 (default.conf) is higher. [Gratien D'haese]
- Missed a PREVIEW_MODE -> PREVIEW setting. [Gratien D'haese]
- Adding new SwJob function to display output of the last command (SD
  related) and added it into 10_swremove_bundles.sh script. [Gratien
  D'haese]
- Rename PREVIEW_MODE into PREVIEW (as PREVIEW_MODE setting did not pass
  to the scripts and PREVIEW do) no idea why? [Gratien D'haese]
- 22_check_vrtsvcs.sh check veritas cluster software version. When <5.0
  then EOL reached and warn or bail out with an error. [Gratien D'haese]
- Made function proceed_to_next_stage aware of simulation mode. [Gratien
  D'haese]
- Make sure the "preview ended successfully" found is the one from the
  last preview run and not those of last year; a tail -10 should be
  sufficient for this. [Gratien D'haese]
- Log the state at the end of the init stage. [Gratien D'haese]
- Get the CURRENT_STATE in the right state after a successful preview.
  [Gratien D'haese]
- 99_update_status.sh file add with preremove stage. [Gratien D'haese]
- Tagging PREVIEW_FILE after successful preview run. [Gratien D'haese]
- Adding some new stages. [Gratien D'haese]
- Deciding preview mode or not (preview must ended successfully)
  [Gratien D'haese]
- Make sure we read the STATUS file before deciding on preview mode or
  not. [Gratien D'haese]
- Explicit define preview mode in default.conf file; minor modification
  in ini file; and 10_swremove_bundles.sh is WiP. [Gratien D'haese]
- Add the postinstall swlist output (as 1st example) testing the
  swremove in preview only for the moment. [Gratien D'haese]
- Added swlist before output and tweaked with entering stages. [Gratien
  D'haese]
- Added _before for the file so we can compare later with the _after
  file. [Gratien D'haese]
- Remove in init stage the 99_update_status.sh as status would always be
  reset to 'init:ended' [Gratien D'haese]
- Dd an underline in the log file when running in preview (to get some
  attention) [Gratien D'haese]
- Tested the proceed_to_next_stage with upgrade workflow. [Gratien
  D'haese]
- Make sure we update the CURRENT_STATUS. [Gratien D'haese]
- Introducing the init stage so we can work around other stages (later
  on) [Gratien D'haese]
- Fix the mktemp on Linux (fedora) [Gratien D'haese]
- New script to read the section from the INI_FILE. [Gratien D'haese]
- * rename section [remove] into [preremove] in the INI_FILE * fix the
  icapstatus file naming. [Gratien D'haese]
- Improve comment in function ParseIniFile and remove typeset keyword.
  [Gratien D'haese]
- Add script to verify if we may enter the preremove stage. [Gratien
  D'haese]
- Added a new stage (preremove) [Gratien D'haese]
- New script to verify the global patch bundles. [Gratien D'haese]
- New script to save a copy of the /etc/pam.conf file. [Gratien D'haese]
- Improved the SG node status and report it correctly. [Gratien D'haese]
- Improved the check patches script. [Gratien D'haese]
- Add check for icap. [Gratien D'haese]
- Add check for cimproviders. [Gratien D'haese]
- Add check for PREVIEW_MODE. [Gratien D'haese]
- New functions for HP-UX only. [Gratien D'haese]
- New file 20_check_corrupt_filesets.sh to find corrupt filesets.
  [Gratien D'haese]
- Added EnterNextStageAllowed test to could block going to the next
  stage. [Gratien D'haese]
- Push the SG check to a later moment in prep (25 -> 45) [Gratien
  D'haese]
- New script for HP to verify if boot is set to autoboot ON. [Gratien
  D'haese]
- Added new var EnterNextStageAllowed in default.conf. [Gratien D'haese]
- Add script to anlayze and report missing boot disks in
  /stand/bootconf. [Gratien D'haese]
- Moved the BUILD_DIR and TMP_DIR to its own script. [Gratien D'haese]
- Mktemp on HP-UX does not create the temporary directory. [Gratien
  D'haese]
- TMP_DIR=$BUILD_DIR added. [Gratien D'haese]
- Improved the comments a bit (no code has changed) [Gratien D'haese]
- Adding 3 new scripts to investigate patches, check_patches and SG.
  [Gratien D'haese]
- Adding the stage cleanup with 2 basic scripts (nothing fancy yet)
  [Gratien D'haese]
- Added new function SurroundingGrep. [Gratien D'haese]
- Added cleanup stage and correct the CURRENT_STATUS in
  99_update_status.sh ($(stamp)) was not required as it is added by
  SetCurrentStatus function. [Gratien D'haese]
- Defined CURRENT_STATUS in default.conf and reworked the function
  SetCurrentStatus. [Gratien D'haese]
- Correct the CURRENT_STATUS var reading with function
  ReadCurrentStatus. [Gratien D'haese]
- We modified the STATUS_FILE (new var) and added 2 functions in input-
  output-functions.sh to deal with the CURRENT_STATUS var
  (ReadCurrentStatus and SetCurrentStatus) and we then updated the 2
  script so far dealing with the status. [Gratien D'haese]
- Adding new script 06_check_preview_run.sh to check if we ran already a
  preview prior doing the upgrade! [Gratien D'haese]
- Moded the DS var to default.conf and defined new var PREVIEW_FILE.
  [Gratien D'haese]
- Make sure we append our status in the status file instead of
  overwriting! [Gratien D'haese]
- Change the LogPrint into Log (less agressive ATTENTION line :)
  [Gratien D'haese]
- Update, add comment in 10_check_current_status.sh. [Gratien D'haese]
- Change the comment in 05_select_ini_file.sh. [Gratien D'haese]
- Rename the dupro.psf into upgrade-ux.psf. [Gratien D'haese]
- Adding fresh vars to be used during scripts (HP-UX only) [Gratien
  D'haese]
- Added CMVIEWCL var. [Gratien D'haese]
- Change PRGNAME into PRODUCT. [Gratien D'haese]
- Merge branch 'master' of github.com:gdha/upgrade-ux. [Gratien D'haese]
- Add place holder scripts. [Gratien D'haese]
- Add place holder scripts. [Gratien D'haese]
- Add status update script (prep stage) [Gratien D'haese]
- Fix the bad formatted tty -s clausule. [Gratien D'haese]
- Adding BATCH_MODE=1 for background; empty means interactive. [Gratien
  D'haese]
- Script to verify if ignite/ux backup was made on hp. [Gratien D'haese]
- Add script to check NBU sw and recent backup. [Gratien D'haese]
- Save the output of setboot command. [Gratien D'haese]
- * add new script to detect vpar/npar * defined variable containing
  partition mode: HP_VM_MODE=(vpar|npar|hpvm) [Gratien D'haese]
- * modified OS_VENDOR for HP and SunOS to hp and oracle * added new
  script to detect hpvm. [Gratien D'haese]
- Changed the cat into tail -1. [Gratien D'haese]
- Replace the $model var with $REAL_MACHINE. [Gratien D'haese]
- Add status script (we will append the <date> <time>
  stage:<start|phase1|...|end> and read the CURRENT_STATUS (tail -1 of
  the $VAR_DIR/status file) [Gratien D'haese]
- Put the HP-UX ini file in the right dir. [Gratien D'haese]
- Merge branch 'master' of github.com:gdha/upgrade-ux. [Gratien D'haese]
- Adding empty ini file for SLES 11. [Gratien D'haese]
- Adding empty ini file for fedora 20. [Gratien D'haese]
- Rename HP-UX-11.31.ini into HP-UX-11.31-2014.ini. [Gratien D'haese]
- Put the year at the end (need for GNU/Linux!) [Gratien D'haese]
- Reworked and renamed the 05_parse_ini_file.sh into
  05_select_ini_file.sh. [Gratien D'haese]
- Print function uses now echo instead of Echo. [Gratien D'haese]
- Moved some variables definitions from global-functions.sh to
  default.conf. [Gratien D'haese]
- A basic GNU/Linux.conf file. [Gratien D'haese]
- Added the ini parser script (not finished yet) [Gratien D'haese]
- Added an initial ini file for HP-UX 11.31. [Gratien D'haese]
- Add the initial upgrade workflow script (only contains prep for now)
  [Gratien D'haese]
- * start populating the HP-UX.conf file with SD related variables * the
  default workflow is 'upgrade' instead of 'help' (one command less to
  type) [Gratien D'haese]
- Added the -p explaination. [Gratien D'haese]
- Added the ParseIniFile function. [Gratien D'haese]
- Used the dupro framework to populate the initial checkin for upgrade-
  ux. [Gratien D'haese]
- Initial commit. [Gratien D'haese]


