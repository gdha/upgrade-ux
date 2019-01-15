# postexecute/GNU/Linux/28_start_docker.sh

if (( DOCKER )) ; then
  if (( PREVIEW )) ; then
    # docker was not stopped anyhow
    :
  else
    # if file "$VAR_DIR/$DS/reboot-required" exists then we need to reboot and in that case
    # it makes no sense to restart docker containers which could last for 9 minutes before
    # upgrade-ux finishes.
    if [[ -f "$VAR_DIR/$DS/reboot-required" ]] ; then
        # do not startup docker processes - first reboot the system
        Log "As reboot is required we do NOT start docker"
        return
    fi
    LogPrint "Start docker service"
    service docker status >&2 || service docker start >&2
    # we shall not start docker containers automatically as these may be under control
    # of a Rancher Manager (and these are launched automatically in most cases)
    docker info > "$VAR_DIR/$DS/docker_info.after"
  fi
fi
