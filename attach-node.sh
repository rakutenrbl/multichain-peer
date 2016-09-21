#!/bin/bash -x

pid=0

# SIGTERM-handler
stop_multichain_gracefully() {
  kill ${!}
  if [ $pid -ne 0 ]; then
    kill -SIGTERM "$pid"
    wait "$pid"
  fi
  exit 143; # SIGTERM
}

# setup handler to stop multichain after killing the last background process, which is the `tail -f`
trap 'stop_multichain_gracefully' SIGTERM

mkdir -p /root/.multichain/${CHAIN}

if [ ! -e /root/.multichain/${CHAIN}/multichain.conf ]; then
    cp /root/.multichain/configurations/multichain.conf /root/.multichain/${CHAIN}/multichain.conf
fi
if [ ! -e /root/.multichain/${CHAIN}/debug.log ]; then
    touch /root/.multichain/${CHAIN}/debug.log
fi

# Start multicahin in the background.  Similar to -daemon, but this approach returns the pid to the shell
multichaind ${CHAIN}@${PEER} &
pid="$!"

echo "multichain pid: " $pid

sleep 2
while true
do
    tail -f /root/.multichain/${CHAIN}/debug.log & wait ${!}
done
