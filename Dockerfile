FROM rbldockerhub-officerakuten.azurecr.io/multichain-base

ADD ./multichain.conf /root/.multichain/configurations/multichain.conf
ADD ./attach-node.sh /scripts/attach-node.sh

RUN chmod 500 scripts/*.sh

CMD ["/bin/bash", "-x", "/scripts/attach-node.sh"]
