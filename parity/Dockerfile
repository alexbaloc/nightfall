FROM alexbaloc/parity-private:latest

ARG ACCOUNT_NAME
# ENV variable can be used in the Entrypoint instruction
ENV RUNTIME_ACCOUNT=$ACCOUNT_NAME 

ENV SECRET_STORE_ACL_CONTRACT=none
# ENV variable can be used in the Entrypoint instruction
ARG NODE_ID
ENV RUNTIME_NODE_ID=$NODE_ID

#needed by the envsubst command
RUN apt-get update \
  && apt-get -y install gettext-base \
  && apt-get clean

COPY startWithEnvVars.sh ./
RUN chmod +x ./startWithEnvVars.sh

RUN mkdir -p /parity/data.local/db
RUN mkdir -p /parity/data.local/import

COPY ./data/users.base.toml ./data/dev_chain.json /parity/data.local/
# Copy only our users's private files
COPY ./data/${ACCOUNT_NAME}.toml ./data/${ACCOUNT_NAME}.pwd /parity/data.local/

COPY ./data/${ACCOUNT_NAME}.key.json /parity/data.local/import

# Import the pre-geerated account used to sign transactions
RUN ./parity --config data.local/users.base.toml account import data.local/import
# Creating a new acccount will create non-deterministic addresses, so we can't use that
#RUN ./parity --config data.local/users.base.toml account new --password data.local/${ACCOUNT_NAME}.pwd

ENTRYPOINT ./startWithEnvVars.sh
