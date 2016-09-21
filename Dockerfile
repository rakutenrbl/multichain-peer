FROM rakutenrbl/multichain-base

ADD ./params-bitcoin.dat /root/.multichain/configurations/bitcoin/params.dat
ADD ./multichain.conf /root/.multichain/configurations/multichain.conf

ADD ./attach-node.sh /scripts/attach-node.sh

RUN chmod 500 scripts/*.sh

CMD ["/bin/bash", "-x", "/scripts/attach-node.sh"]
