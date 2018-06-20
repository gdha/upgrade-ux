# postexecute/GNU/Linux/28_start_docker.sh

if (( PREVIEW )) ; then
    :
else
    LogPrint "Start docker service"
    service docker status || service docker start >&2
    # we shall not start docker containers automatically as these may be under control
    # of a Rancher Manager
    docker info > "$VAR_DIR/$DS/docker_info.after"
fi
