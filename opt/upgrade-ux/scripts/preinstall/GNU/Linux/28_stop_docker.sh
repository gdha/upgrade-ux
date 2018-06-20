# 28_stop_docker.sh
# We must stop docker containers if they are still running to avoid corruption

if (( PREVIEW )) ; then
    Log "Stopping docker containers [not done in preview]"
else
    Log "Are we using docker?"
    service docker status >&2 && {
        docker info > "$VAR_DIR/$DS/docker_info.before"
        LogPrint "Stopping docker containers"
        docker stop $(docker ps -aq) >&2
        LogPrint "Stopping docker service"
        service docker stop >&2
    }
fi
