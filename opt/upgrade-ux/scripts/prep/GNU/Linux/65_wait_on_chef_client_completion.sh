# 65_wait_on_chef_client_completion.sh
# Purpose of this script is to check if a chef-client run is currently running.
# If that is true, then we wait for a while and recehck until chef-client is done.

SLEEPTIME=15  # seconds
CHEFCLIENT="chef-client"

for iloop in $(seq 1 10)
do
  chefclientrunning=$(ps ax | grep $CHEFCLIENT | grep -v grep | wc -l) # 0 when not found running
  if [[ $chefclientrunning -eq 0 ]]; then
    return
  else
    LogPrint "Waiting on $CHEFCLIENT completion - sleep for $SLEEPTIME seconds before retrying."
    sleep $SLEEPTIME
  fi
done

# When we came at this point means that after $SLEEPTIME * 10 secs chef-client was still busy
# Perhaps it was hanging, therefore, we prefer to bail out with an error
Error "$CHEFCLIENT was still busy after $((SLEEPTIME*10)) seconds. Please check and restart when ok"
