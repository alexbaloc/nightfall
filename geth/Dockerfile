FROM ethereum/client-go

WORKDIR /root

ADD genesis.json /root/genesis.json
#ADD config.toml /root/config.toml

#Import accounts
ADD key*.json /root/.ethereum/keystore/
ADD accounts.pwd /root/accounts.pwd

RUN geth init /root/genesis.json
