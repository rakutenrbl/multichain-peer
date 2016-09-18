FROM rakutenrbl/multichain-base

ADD ./params-bitcoin.dat /root/.multichain/configurations/bitcoin/params.dat
ADD ./multichain.conf /root/.multichain/configurations/multichain.conf

ADD ./start-node.sh /scripts/start-node.sh

RUN chmod 500 scripts/*.sh

CMD ["/bin/bash", "-x", "/scripts/start-node.sh"]