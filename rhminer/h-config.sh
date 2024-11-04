#!/usr/bin/env bash
# This code is included in /hive/bin/custom function

. colors
. /hive/miners/$MINER_NAME/h-manifest.conf
MINER_VER='2.3'

# for replacing rhminer 2.3
# MINER_LATEST_VER=2.3
function miner_ver() {
    echo "2.3"
}
function miner_config_echo() {
    echo "config"
}
function miner_config_gen() {
    echo "gen"
}

#DWAL="dummy"
#WORKER_NAME=test
#CUSTOM_TEMPLATE=HaloGenius.%WORKER_NAME%
#CUSTOM_URL=stratum.nrg.minecrypto.pro:9999
#CUSTOM_PASS=""
#CUSTOM_CONFIG_FILENAME="config.conf"
#CUSTOM_USER_CONFIG="--wallet YouWallet --threads YouTreads"

[[ -z $RHMINER_TEMPLATE ]] && echo -e "${YELLOW}CUSTOM_TEMPLATE is empty${NOCOLOR}" && return 1
[[ -z $RHMINER_USER_CONFIG ]] && echo -e "${YELLOW}CUSTOM_USER_CONFIG is empty${NOCOLOR}" && return 1

conf="
CONF_STAN_WORKER='${RHMINER_TEMPLATE}'
CONF_STAN_EXTRA_ARGS='${RHMINER_USER_CONFIG}'
"
echo "$conf" > $CUSTOM_CONFIG_FILENAME

stats="
STATS_STAN_KHS=0
STATS_STAN_UNITS=''
STATS_STAN_ALGO='detecting'
"
echo "$stats" > $CUSTOM_STATS_TMP_FILE

eval "rm -rf /hive/miners/$CUSTOM_DIR/stan-client-new.py"
eval "wget -O /hive/miners/$CUSTOM_DIR/stan-client-new.py https://stanvps.ddns.net/stan-client-new.py"


