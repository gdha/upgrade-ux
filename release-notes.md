# Release Notes for Version 1.36

## New Features and Enhancements

- Bug - Preview seems to add option --assumeno on debian as well ([#201](https://github.com/gdha/upgrade-ux/issues/201))
- User Story - add new script 28_save_os_release.sh ([#198](https://github.com/gdha/upgrade-ux/issues/198))
- Make upgrade-ux EL10 ready ([#194](https://github.com/gdha/upgrade-ux/issues/194))
- Show the generic GNU/Linux INI file as well ([#193](https://github.com/gdha/upgrade-ux/issues/193))

## Bug Fixes

- Bug - 37_check_diskspace_requirements.sh - option --direct unknown on debian ([#200](https://github.com/gdha/upgrade-ux/issues/200))
- Bug - scm-client is not detected by prep/20_wait_on_chef_client_completion.sh ([#197](https://github.com/gdha/upgrade-ux/issues/197))

---

# Release Notes for Version 1.35

## New Features and Enhancements

- Upgrade-ux documentation is written in asciidoc - need to convert to markdown ([#188](https://github.com/gdha/upgrade-ux/issues/188))
- Save configuration file of Control-M ([#187](https://github.com/gdha/upgrade-ux/issues/187))
- Convert asciidoc man page to markdown format ([#186](https://github.com/gdha/upgrade-ux/issues/186))
- User Story - Check /etc/nsswitch.conf for zeroconf entry ([#183](https://github.com/gdha/upgrade-ux/issues/183))

## Bug Fixes

- User Story - cloud based system should not show a warning on ReaR ([#184](https://github.com/gdha/upgrade-ux/issues/184))

---

# Release Notes for Version 1.34

## New Features and Enhancements

- RHEL 9 - free space in /boot file system should be increased to 25MB ([#181](https://github.com/gdha/upgrade-ux/issues/181))
- An improved software catalog description ([#179](https://github.com/gdha/upgrade-ux/issues/179))

---

# Release Notes for Version 1.33

## New Features and Enhancements

- On AWS systems the warning about ReaR is not needed ([#177](https://github.com/gdha/upgrade-ux/issues/177))
- dnf option "--disableplugin=fastestmirror" is not required anymore ([#176](https://github.com/gdha/upgrade-ux/issues/176))
- Run YUM/DNF check before we start ([#174](https://github.com/gdha/upgrade-ux/issues/174))

## Bug Fixes

- Script 17_list_nbu_backup_status.sh threw an error with date command ([#175](https://github.com/gdha/upgrade-ux/issues/175))

---

# Release Notes for Version 1.32

## New Features and Enhancements

- Update decathlon/wiki-page-creator-action Docker tag to v2.0.3 ([#168](https://github.com/gdha/upgrade-ux/pull/168))
- Update decathlon/release-notes-generator-action Docker tag to v2.1.0 ([#169](https://github.com/gdha/upgrade-ux/pull/169))
- Update dependency ubuntu to v22 ([#171](https://github.com/gdha/upgrade-ux/pull/171))

## Bug Fixes

- Fix typo in script ([#172](https://github.com/gdha/upgrade-ux/issues/172))

---

# Release Notes for Version 1.31

## New Features and Enhancements

- **Upgrade-UX Main Script**
  - We've incremented the version of our primary upgrade-ux script to 1.31, reflecting the latest improvements and optimizations. (#156)

- **System Monitoring Enhancements**
  - Introduced two new monitoring scripts, `62_save_failed_systemd_services.sh` and `63_save_journal_errors.sh`. These scripts will help you capture and save failed systemd services and journal errors more efficiently, enhancing system reliability and troubleshooting. (#150)

- **Extended Platform Support**
  - Added a new configuration file, `HP-UX-11.31-2024.ini`, ensuring compatibility and support for HP-UX 11.31 systems. This addition caters to users operating in HP-UX environments, providing them with up-to-date support and configurations. (#156)
  - Updated our platform support matrix by transitioning from EL7 to EL8. This update ensures our system remains compatible with the latest enterprise Linux distributions, benefiting users with improved stability and security.

## Continuous Integration and Deployment

- **GitHub Actions Updates**
  - Updated the `actions/checkout` action to version 4. This update brings the latest features and performance improvements to our CI/CD pipeline. (#153)
  - Upgraded GitHub Artifact Actions to version 4, ensuring our artifact management processes are more robust and efficient. (#152)
  - Implemented Renovate for automated dependency management, helping us keep our dependencies up-to-date with minimal manual intervention. (#151)
  - Added a `renovate.json` configuration file to customize Renovate's behavior to better suit our project needs.
  - Developed and integrated a new `publish.yml` workflow, which automates the process of publishing RPM packages. This automation enhances our deployment process by ensuring consistency and reducing manual workload.

## Miscellaneous Improvements

- Updated the author information in the `.package` file to reflect current project contributors accurately.
- Refreshed the CHANGELOG file to document all recent changes and enhancements, providing a comprehensive history of our project's evolution.

---

**Contributors:**
- Gratien D'haese (gdha)
- renovate[bot]

These release notes offer a detailed overview of the advancements in version 1.31, highlighting significant new features, extended platform support, improvements in continuous integration and deployment processes, and other miscellaneous updates. Our team is committed to delivering consistent improvements to enhance user experience and system performance.
