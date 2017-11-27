FROM rbldockerhub-officerakuten.azurecr.io/multichain-base

ADD ./multichain.conf /root/.multichain/configurations/multichain.conf
ADD ./start-node.sh /scripts/start-node.sh

RUN chmod 500 scripts/*.sh

CMD ["/bin/bash", "-x", "/scripts/start-node.sh"]
