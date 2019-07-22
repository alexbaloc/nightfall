# How the data is generated

Data generated based on tutorial available [here](https://github.com/paritytech/parity/wiki/Demo-PoA-tutorial).

## Obtaining the server enodes

The server enodes are generated based on node public keys + node IPs. The docker containers IPs are fixed in place.
The node public keys are generated based on a 64 character hexadecimal node key. This value is passed via the `--node-key VALUE` parity command line parameter.

A list of pregenerated enodes has been created for the Parity deployment. In order to add a new enode, generate a random 64 character hexadecimal number (example [here](http://rumkin.com/tools/password/pass_gen.php) and start a parity instance with this value as --node-key. The server enode will be printed in the console furing server startup. Another option is to run the following command:

```
curl --data '{"jsonrpc":"2.0","method":"parity_enode","params":[],"id":0}' -H "Content-Type: application/json" -X POST localhost:8545
```

The enode must be added to all other servers to allow inter-connectivity. The file `reservedPeers` contains all known enodes and is loaded by each server at startup.

## Container settings

Below are the parameters used to start each of the Parity containers

| Container | IP | Server Key | Enode |
|-----------|----|----------|--------|----|------------|-------|
| parity_1 | 10.5.10.4 | A09E63F29B0832EF7CD606ED73D0E76B84B3552FF122AF148C6FF0027D59ADF8 | enode://0999c209f9804dda382cf7a0a1f1e2c2f0527bb2a7bb1af78097d3fd26e02c4e1d06e4de56e620374887617f85b2d7922237f6cf4c044027edc48d87397a041b@10.5.10.4:30303 |
| parity_2 | 10.5.10.5 | 53372B04FD53C85C60F20D247A6EB6F0BC074369A8CC4027674753DBECAEB9AC | enode://0e62cc34e09ac4cdbb7501f06f1140409c25ff612acbfa2ac7515d46fdb9d8a3c35b67c1b711bb3ef5b96b4212247348d7edb97952773c27b891447bb8388a4c@10.5.10.5:30303 |
| secret_store_1 | 10.5.10.1 | CC7138C7122B6D33A410B0D706B6A413869CC1BA2DBFB9268F6FB3A6E04BE47E | enode://a4248bea1aace535537e1a55cccda448d8ba5876c9b04e435b7fed540c9b4652e593487c6cb81c6509ace2e0f12f67bd69aa6fece907a27b9e943791f16c24fe@10.5.10.1:30303 |
| secret_store_2 | 10.5.10.2 | DB6BF845609FA78F3F711B3E4C8D6CCA58E5CD28DD1857B4988FE076579FA0B2 | enode://d380634fa7279323044a8749aebbe2547582bfcfa4e57d6fbd9532f00d85e1dfde480b1d37d81a9f4e3fce2abfadff0cc6fb44e5f2c54c82f3b5d5e8a31b7e10@10.5.10.2:30303 |
| secret_store_3 | 10.5.10.3 | 660FD433D2A46F2ACA357EA4723270C4AEC6108908BE84AA28C50D8F892118B4 | enode://a8c9b36764995bfc619c4114bf0faef1496d7183dc327a980dcd78266fd36840273cc8b9eef90af9c3606fe8ac34cfd29a7bf50a66ab6ac8bdff548a15b95156@10.5.10.3:30303 |
