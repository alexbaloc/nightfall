#!/bin/sh

# See https://stackoverflow.com/questions/2013547/assigning-default-values-to-shell-variables-with-a-single-command-in-bash
# ACL_CONTRACT=${SECRET_STORE_ACL_CONTRACT:=none}

echo "On-the fly replacement of environment variables in parity configuration file"
echo "SECRET_STORE_ACL_CONTRACT: $SECRET_STORE_ACL_CONTRACT"

envsubst '\$SECRET_STORE_ACL_CONTRACT' < data.local/${RUNTIME_ACCOUNT}.toml > data.local/${RUNTIME_ACCOUNT}.env.toml

#echo "Configuration file contents:"
#cat data.local/${RUNTIME_ACCOUNT}.env.toml

./parity --config data.local/${RUNTIME_ACCOUNT}.env.toml --node-key $RUNTIME_NODE_ID
