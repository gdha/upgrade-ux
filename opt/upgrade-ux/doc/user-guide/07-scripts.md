# The upgrade-ux scripts

The scripts that are sourced by the main script `upgrade-ux` reside under `/opt/upgrade-ux/scripts/` directory and the easiest way to know what will be sourced is by running `/opt/upgrade-ux/bin/upgrade-ux -s`:

    $ sudo /opt/upgrade-ux/bin/upgrade-ux -s
    upgrade-ux 1.27 / 24-Aug-2022
    Using log file: /var/opt/upgrade-ux/log/upgrade-ux-20221128-1008-ITSGBHHLSP00741.log
    Source init/default/02_print_host_info.sh
    Source init/default/03_parse_variables.sh
    Source init/default/03_prepare_tmp_build_area.sh
    Source init/default/04_create_var_dir.sh
    Source init/default/05_select_ini_file.sh
    Source init/default/08_set_preview_var.sh
    Source init/default/10_check_current_status.sh
    Source init/GNU/Linux/10_define_hostname.sh
    Source init/default/12_upgrade_allowed.sh
    Source init/default/15_check_preview_run.sh
    Source init/GNU/Linux/40_set_docker_var.sh
    Source init/default/85_set_current_state.sh
    Source init/default/90_show_current_state.sh
    Source prep/default/05_reboot_required.sh
    Source prep/default/05_source_cmcluster_conf.sh
    Source prep/default/10_check_current_status.sh
    Source prep/default/16_check_dp_backup.sh
    Source prep/default/16_check_nbu_backup.sh
    Source prep/default/16_check_nsr_backup.sh
    Source prep/default/16_check_tsm_backup.sh
    Source prep/default/17_list_nbu_backup_status.sh
    Source prep/GNU/Linux/20_wait_on_chef_client_completion.sh
    Source prep/GNU/Linux/27_save_grub_menu.sh
    Source prep/GNU/Linux/28_save_system_release.sh
    Source prep/GNU/Linux/29_save_kernel_version.sh
    Source prep/default/30_save_pam_conf.sh
    Source prep/GNU/Linux/30_save_rpm_qa.sh
    Source prep/default/31_save_env_output.sh
    Source prep/GNU/Linux/35_check_rear_image.sh
    Source prep/default/35_save_mount_output.sh
    Source prep/GNU/Linux/36_check_virusscanner_linuxshield.sh
    Source prep/GNU/Linux/37_check_diskspace_requirements.sh
    Source prep/GNU/Linux/38_save_satellite_info.sh
    Source prep/GNU/Linux/39_save_yum_history.sh
    Source prep/GNU/Linux/39_save_yum_log.sh
    Source prep/GNU/Linux/40_disabling_local_repos_with_satellite.sh
    Source prep/GNU/Linux/41_disable_rhn_satellite_subscription.sh
    Source prep/GNU/Linux/42_archive_yum_repos_dir.sh
    Source prep/GNU/Linux/43_save_yum_enable_status.sh
    Source prep/GNU/Linux/49_yum_repolist.sh
    Source prep/GNU/Linux/50_save_default_runlevel.sh
    Source prep/GNU/Linux/54_check_on_hanging_rpm_cmds.sh
    Source prep/GNU/Linux/55_verify_rpm_packages.sh
    Source prep/GNU/Linux/60_save_knife_node_output.sh
    Source prep/default/61_exclude_software_packages.sh
    Source prep/GNU/Linux/61_save_extend_filesystem_features.sh
    Source prep/default/62_sg_autostart_cmcld.sh
    Source prep/default/70_check_openssl_logjam.sh
    Source prep/default/72_save_uvscan_exclude_list.sh
    Source prep/default/95_check_missing_programs.sh
    Source prep/default/99_update_status.sh
    Source preremove/default/01_enter_stage_acceptable.sh
    Source preremove/default/05_read_section_from_inifile.sh
    Source preremove/default/99_update_status.sh
    Source preinstall/default/01_enter_stage_acceptable.sh
    Source preinstall/default/05_read_section_from_inifile.sh
    Source preinstall/GNU/Linux/06_yum_clean_all.sh
    Source preinstall/GNU/Linux/07_journalctl_flush.sh
    Source preinstall/GNU/Linux/08_clear_yum_cache.sh
    Source preinstall/GNU/Linux/09_import_rpm_gpg_keys.sh
    Source preinstall/GNU/Linux/10_stop_ds_agent.sh
    Source preinstall/GNU/Linux/10_stop_nails.sh
    Source preinstall/GNU/Linux/20_stop_cron.sh
    Source preinstall/default/22_shutdown_opcagt.sh
    Source preinstall/GNU/Linux/25_stop_tidal.sh
    Source preinstall/GNU/Linux/26_stop_ctmagent.sh
    Source preinstall/GNU/Linux/28_stop_docker.sh
    Source preinstall/GNU/Linux/30_disable_chef_client_in_crontab.sh
    Source preinstall/default/30_shutdown_quest.sh
    Source preinstall/GNU/Linux/32_stop_tanium.sh
    Source preinstall/GNU/Linux/33_stop_fluentbit.sh
    Source preinstall/GNU/Linux/34_stop_flexera.sh
    Source preinstall/GNU/Linux/35_stop_cisco_amp.sh
    Source preinstall/default/80_run_cmds_defined_in_ini.sh
    Source preinstall/default/99_update_status.sh
    Source install/default/01_enter_stage_acceptable.sh
    Source install/default/05_read_section_from_inifile.sh
    Source install/default/20_sw_installation_in_progress.sh
    Source install/GNU/Linux/29_exclude_packages.sh
    Source install/GNU/Linux/30_install_software.sh
    Source install/default/99_update_status.sh
    Source postinstall/default/01_enter_stage_acceptable.sh
    Source postinstall/default/05_read_section_from_inifile.sh
    Source postinstall/default/10_save_dmesg.sh
    Source postinstall/GNU/Linux/28_save_and_diff_system_release.sh
    Source postinstall/GNU/Linux/29_save_and_diff_kernel_version.sh
    Source postinstall/default/30_diff_pam_conf.sh
    Source postinstall/GNU/Linux/30_save_rpm_qa.sh
    Source postinstall/default/35_save_mount_output.sh
    Source postinstall/GNU/Linux/39_save_and_diff_yum_log.sh
    Source postinstall/GNU/Linux/40_needs_restarting.sh
    Source postinstall/GNU/Linux/61_save_and_diff_extend_filesystem_features.sh
    Source postinstall/default/99_update_status.sh
    Source postremove/default/01_enter_stage_acceptable.sh
    Source postremove/default/05_read_section_from_inifile.sh
    Source postremove/default/99_update_status.sh
    Source configure/default/01_enter_stage_acceptable.sh
    Source configure/default/05_read_section_from_inifile.sh
    Source configure/default/10_configure_commands.sh
    Source configure/GNU/Linux/20_uncomment_cfg2html_in_crontab.sh
    Source configure/default/26_fix_openssl_logjam.sh
    Source configure/default/55_fix_uvscan_exclude_list.sh
    Source configure/default/62_verify_sg_autostart_cmcld.sh
    Source configure/default/99_update_status.sh
    Source postexecute/default/01_enter_stage_acceptable.sh
    Source postexecute/default/05_read_section_from_inifile.sh
    Source postexecute/GNU/Linux/20_start_ds_agent.sh
    Source postexecute/GNU/Linux/20_start_nails.sh
    Source postexecute/GNU/Linux/25_start_crond.sh
    Source postexecute/GNU/Linux/25_start_ntpd.sh
    Source postexecute/GNU/Linux/25_start_tidal.sh
    Source postexecute/GNU/Linux/26_start_ctmagent.sh
    Source postexecute/GNU/Linux/28_start_docker.sh
    Source postexecute/GNU/Linux/29_start_tanium.sh
    Source postexecute/GNU/Linux/30_start_fluentbit.sh
    Source postexecute/GNU/Linux/31_start_flexera.sh
    Source postexecute/GNU/Linux/33_restart_apache.sh
    Source postexecute/default/37_start_opcagt.sh
    Source postexecute/default/38_start_quest.sh
    Source postexecute/GNU/Linux/40_enabling_local_repos_with_satellite.sh
    Source postexecute/GNU/Linux/43_restore_yum_enable_status.sh
    Source postexecute/GNU/Linux/44_enable_on_rhel_yum_repos.sh
    Source postexecute/GNU/Linux/45_enable_rhn_satellite_subscription.sh
    Source postexecute/default/50_adapt_sg_autostart_cmcld.sh
    Source postexecute/GNU/Linux/60_save_knife_node_output.sh
    Source postexecute/GNU/Linux/60_save_satellite_info.sh
    Source postexecute/GNU/Linux/65_remove_duplicate_packages.sh
    Source postexecute/GNU/Linux/70_define_default_runlevel.sh
    Source postexecute/default/80_run_cmds_defined_in_ini.sh
    Source postexecute/GNU/Linux/80_run_grub2_mkconfig.sh
    Source postexecute/GNU/Linux/82_enable_chef_client_in_crontab.sh
    Source postexecute/GNU/Linux/85_update_major_release_in_config.sh
    Source postexecute/GNU/Linux/95_reboot_required.sh
    Source postexecute/default/96_call_for_action_after_preview.sh
    Source postexecute/default/99_update_status.sh
    Source cleanup/default/05_read_section_from_inifile.sh
    Source cleanup/default/10_rm_old_cfg2html_reports.sh
    Source cleanup/default/20_rm_sap_db_tmp_file.sh
    Source cleanup/default/90_preview_ended_successfully.sh
    Source cleanup/default/95_show_logfile_location.sh

NOTE: It depends on the OS architecture (see `dump` workflow) which scripts will be sources. In above example it was on HP hardware.

In every _stage_ directory you will find minimum a `default` directory which is sourced by every OS and a hardware specific directory, such as:

 - hpe
 - GNU/Linux
 - sunos
 - aix

The scripts found under these directories are only sourced when you run `upgrade-ux` on those HW architectures (make sense, no?).
If you need new scripts just write a small script called `my_script.sh` (the `.sh` is important!) and it will be picked up the next time automatically.

NOTE: there is no need to make these small scripts executable (nor is it required to start with `#!/bin/sh` or whatever).

An example of such a script is `/opt/upgrade-ux/scripts/preinstall/default/05_reboot_required.sh`:

    $ cat preinstall/default/05_reboot_required.sh
    # 05_reboot_required.sh
    # if the uptime of the system is higher then 30 days then we propose to reboot first
    # pre-define daysup as 0 (we can check this variable later [after a reboot])
    daysup=0
    # when uptime is not expressed in days then we probably just rebooted our system
    uptime | grep -q days || return
    daysup=$( uptime | awk '{print $3}' )
    IsDigit $daysup || daysup=$( w | head -1 | awk '{print $3}' )  # alternative method
    IsDigit $daysup || daysup=0
    if [[ $daysup -gt $DAYSUPTIME ]]; then
        if (( PREVIEW )) ; then
            LogPrint "Uptime of system is $daysup (>$DAYSUPTIME days) - recommend to reboot before patching"
        else
            Error "Uptime of system is $daysup (>$DAYSUPTIME days) - reboot is required before patching with $PRODUCT"
        fi
    fi

Now it is up to you! If you wish to add new scripts it is always useful to first make a [new issue at GitHub](https://github.com/gdha/upgrade-ux/issues)

