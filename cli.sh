#!/usr/bin/env bash

echo 11111111 | \
nchcli vm create --code_file=./paillier.bc \
--from=$(nchcli keys show -a alice) \
--gas=9531375 \
-b block -y

nchcli q vm call $(nchcli keys show -a alice) nch1qf5wqz2knqjxtp3umpyuj4wfy5kdenz40hhq9d \
queryResult ./paillier.abi \
--args="0000000000000000000000000000000000000000000000000000000000000000"

echo 11111111 | \
nchcli vm call --from=$(nchcli keys show -a alice) \
--contract_addr=nch1qf5wqz2knqjxtp3umpyuj4wfy5kdenz40hhq9d \
--method=setN2 \
--abi_file="./paillier.abi" \
--args="8292631376851370761" \
--gas=98669 -b block -y

nchcli q vm call $(nchcli keys show -a alice) nch1qf5wqz2knqjxtp3umpyuj4wfy5kdenz40hhq9d \
N2 ./paillier.abi


# add 1
echo 11111111 | \
nchcli vm call --from=$(nchcli keys show -a alice) \
--contract_addr=nch1qf5wqz2knqjxtp3umpyuj4wfy5kdenz40hhq9d \
--method=paillierAdd \
--abi_file=./paillier.abi \
--args="0x1234567812345678123456781234567812345678123456781234567812345678 75859412321507056" \
--gas=3727089 -b block -y

nchcli q vm call $(nchcli keys show -a alice) nch1qf5wqz2knqjxtp3umpyuj4wfy5kdenz40hhq9d \
queryResult ./paillier.abi \
--args="0x1234567812345678123456781234567812345678123456781234567812345678"


nchcli q vm call $(nchcli keys show -a alice) nch1qf5wqz2knqjxtp3umpyuj4wfy5kdenz40hhq9d \
queryResult ./paillier.abi \
--args="0x1234567812345678123456781234567812345678123456781234567812345678"

# add 2
echo 11111111 | \
nchcli vm call --from=$(nchcli keys show -a bob) \
--contract_addr=nch1qf5wqz2knqjxtp3umpyuj4wfy5kdenz40hhq9d \
--method=paillierAdd \
--abi_file=./paillier.abi \
--args="0x1234567812345678123456781234567812345678123456781234567812345678 4150036845505652766" \
--gas=3727089 -b block -y

nchcli q vm call $(nchcli keys show -a alice) nch1qf5wqz2knqjxtp3umpyuj4wfy5kdenz40hhq9d \
queryResult ./paillier.abi \
--args="0x1234567812345678123456781234567812345678123456781234567812345678"

# 4632728666407252669

# clear
echo 11111111 | \
nchcli vm call --from=$(nchcli keys show -a alice) \
--contract_addr=nch1qf5wqz2knqjxtp3umpyuj4wfy5kdenz40hhq9d \
--method=clear \
--abi_file=./paillier.abi \
--args="0x1234567812345678123456781234567812345678123456781234567812345678" \
--gas=4036200 -b block -y

