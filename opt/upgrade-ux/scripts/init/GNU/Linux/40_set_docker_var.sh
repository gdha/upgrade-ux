# init/GNU/Linux/40_set_docker_var.sh
# in the main script (upgrade-ux) we defined DOCKER=0 (meaning no docker is active)
# here we will check if the docker application is installed
if type -p docker >/dev/null 2>&1 ; then
    DOCKER=1
fi
