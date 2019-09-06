#!/bin/sh -e
# script is necessary to catch all signals as PID 1 in a container

set -x
pid_pythonserver=0

# SIGTERM-handler
term_handler() {

  # we undeploy first because this process might cease to exist while we wait for stoped server
  echo "undeploy ..."
  /app/bootstrapper/undeploy-config-ui.sh

  echo "terminating ..."
  if [ $pid_pythonserver -ne 0 ]; then
    kill -SIGTERM "$pid_pythonserver"
  fi
  wait "$pid_pythonserver"
   exit 143; # 128 + 15 -- SIGTERM
}

# setup handlers
# on callback, kill the last background process, which is `tail -f /dev/null` and execute the specified handler
#      SIGINT SIGKILL SIGTERM SIGQUIT SIGTSTP SIGSTOP SIGHUP 2 9 15 3 20 19 1 
trap 'kill ${!}; term_handler' 2 9 15 3 20 19 1 

# run bootstrapper 
echo "run bootstrapper"
/app/bootstrapper/deploy-config-ui.sh

# run applications as services in the background now
echo "starting server ..."
python ./index.py &

#get process ID of most recently executed background
pid_pythonserver="$!"
echo pid_pythonserver: $pid_pythonserver

# wait forever not to exit the container
while true
do
  tail -f /dev/null & wait ${!}
done

exit 0