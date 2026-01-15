# 20_wait_on_chef_client_completion.sh
# Purpose of this script is to check if a chef-client run is currently running.
# If that is true, then we wait for a while and recehck until chef-client is done.

(( PREVIEW )) && return  # do not kill nor wait on chef-client runs during preview mode

SLEEPTIME=20  # seconds
type -p chef-client >/dev/null 2>&1 && CHEFCLIENT="chef-client"
type -p scm-client  >/dev/null 2>&1 && CHEFCLIENT="scm-client"
type -p cinc-client >/dev/null 2>&1 && CHEFCLIENT="cinc-client"
[[ -z "$CHEFCLIENT" ]] && return  # if nor chef-client, scm-client or cinc-client found just return

# if we are still in sleeping mode we better kill this process
chefclientrunning=$(ps ax | grep $CHEFCLIENT | grep -v grep | wc -l) # if the count is 1 then most likely it is the sleepy one:
# 1156328 ?        Ss     0:00 /bin/sh -c /bin/sleep 176; /opt/chef/bin/chef-client   -j "/etc/chef/attribs.json" >> /dev/null 2>&1
if (( chefclientrunning )); then
  pid=$(ps ax | grep $CHEFCLIENT | grep -v grep | grep sleep | awk '{print $1}')
  if [[ -n "$pid" ]]; then
    Log "Kill the sleeping $CHEFCLIENT process:"
    kill -HUP $pid >&2
  fi
fi

# If chef-client is running wait to completion before continuing
for iloop in $(seq 1 3)
do
  chefclientrunning=$(ps ax | grep $CHEFCLIENT | grep -v grep | wc -l) # 0 when not found running
  if (( chefclientrunning )); then
    LogPrint "Waiting on $CHEFCLIENT completion - sleep for $SLEEPTIME seconds before retrying."
    sleep $SLEEPTIME
  else
    return
  fi
done

# When we came at this point means that after $SLEEPTIME * 10 secs chef-client was still busy
# Perhaps it was hanging, therefore, we prefer to bail out with an error
LogPrint "$CHEFCLIENT was still busy after $((SLEEPTIME*3)) seconds. We will now kill all chef-client processes."
pidof chef-client | xargs -r kill -9 >&2
