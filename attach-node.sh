#!/bin/bash -x

mkdir -p /root/.multichain/${CHAIN}

if [ ! -e /root/.multichain/${CHAIN}/multichain.conf ]; then
    cp /root/.multichain/configurations/multichain.conf /root/.multichain/${CHAIN}/multichain.conf
fi
if [ ! -e /root/.multichain/${CHAIN}/debug.log ]; then
    touch /root/.multichain/${CHAIN}/debug.log
fi

multichaind ${CHAIN}@${PEER} -daemon

tail -f /root/.multichain/${CHAIN}/debug.log
