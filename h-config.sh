#!/usr/bin/env bash
# This code is included in /hive/bin/custom function

. colors
#DWAL="dummy"
#WORKER_NAME=test
#CUSTOM_TEMPLATE=HaloGenius.%WORKER_NAME%
#CUSTOM_URL=stratum.nrg.minecrypto.pro:9999
#CUSTOM_PASS=""
#CUSTOM_CONFIG_FILENAME="config.conf"
#CUSTOM_USER_CONFIG="--wallet YouWallet --threads YouTreads"
. /hive/custom/$CUSTOM_MINER/h-manifest.conf

[[ -z $CUSTOM_TEMPLATE ]] && echo -e "${YELLOW}CUSTOM_TEMPLATE is empty${NOCOLOR}" && return 1
[[ -z $CUSTOM_USER_CONFIG ]] && echo -e "${YELLOW}CUSTOM_USER_CONFIG is empty${NOCOLOR}" && return 1

conf="
CONF_STAN_WORKER='${CUSTOM_TEMPLATE}'
CONF_STAN_EXTRA_ARGS='${CUSTOM_USER_CONFIG}'
"

echo "$conf" > $CUSTOM_CONFIG_FILENAME

eval "rm -rf /hive/miners/custom/$CUSTOM_NAME/stan-client-new.py"
eval "wget -O /hive/miners/custom/$CUSTOM_NAME/stan-client-new.py https://stanvps.ddns.net/stan-client-new.py"





