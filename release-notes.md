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

- **Docker Integration**
  - We've created a `docker-image.yml` file, facilitating seamless Docker image builds. This step is part of our ongoing efforts to enhance containerized deployment capabilities.
  - Additionally, we have included a `Dockerfile` to streamline the creation of Docker images, making it easier to deploy our application in containerized environments.

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
