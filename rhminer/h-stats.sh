. /hive/miners/$MINER_NAME/h-manifest.conf
. $CUSTOM_STATS_TMP_FILE

get_miner_uptime(){
	local update=$(stat -c %Y $CUSTOM_STATS_TMP_FILE)
	local now=$(date +%s)
	echo $((now - update))
}

algo=$STATS_STAN_ALGO
khs=$STATS_STAN_KHS
hs_units=$STATS_STAN_UNITS
ac=0
rj=0
uptime=1
updateStats=''

# 2024-10-31 10:34:59,410 - INFO - STAN LOG LINE: hashrate - 19.32 KH/S
newKhs=`cat $CUSTOM_LOG_BASENAME | tail -n 50 | grep "STAN LOG LINE: hashrate" | tail -n 1 | rev | cut -d "-" -f1 | rev`
if [ ! -z "${newKhs}" ] ; then
    newHs_units=`echo $newKhs | cut -d " " -f2 | grep -Po "^[A-Za-z\/]{1,}"`
    newKhs=`echo $newKhs | cut -d " " -f1`
    if [ "${newHs_units,,}" == "h/s" ] ; then
        newKhs=$(awk "BEGIN {printf \"%.3f\",${newKhs}/1000}")
    fi
    if [ $newKhs != $STATS_STAN_KHS ] ; then
        khs=$newKhs
        hs_units=$newHs_units
        updateStats="1"
    fi
fi

#cd /tmp/STAN_MINER/CURRENT_MINER && wget https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64.tar.gz && tar -xzf hellminer_linux64.tar.gz;
#/tmp/STAN_MINER/CURRENT_MINER/hellminer -c stratum+tcp://93.100.220.206:8115 -u STAN_WALLET.STAN_WORKER -p d=16384S --cpu=STAN_THREADS
cmd=`cat $CUSTOM_LOG_BASENAME | tail -n 50 | grep -Po "(?<=/tmp/STAN_MINER/CURRENT_MINER/).*" | tail -n 1`  
if [ ! -z "${cmd}" ] ; then
    miner=`echo $cmd | cut -d " " -f1 | rev | cut -d "/" -f1 | rev`
    newAlgo=`echo $cmd | grep -Po "\-\-?(a|algo|algorithm) .*? "  | cut -d " " -f2`
    newAlgo="${miner} ${newAlgo}"
    if [ ! -z "${newAlgo}" ] ; then
        algo=$newAlgo
        updateStats="1"
    fi
fi

if [ ! -z "${updateStats}" ] ; then
    uptime=$(get_miner_uptime)
    stats="
    STATS_STAN_KHS='${khs}'
    STATS_STAN_UNITS='${hs_units}'
    STATS_STAN_ALGO='${algo}'
    "
    echo "$stats" > $CUSTOM_STATS_TMP_FILE
fi

#--argjson temp "`echo ${temp[@]} | tr " " "\n" | jq -cs '.'`" \
#--argjson fan "`echo ${fan[@]} | tr " " "\n" | jq -cs '.'`" \
#--arg uptime "$uptime" \
#--arg ac "$ac" --arg rj "$rj" \
temp=`cpu-temp`
stats=$(jq -nc \
        --arg hs_units "$hs_units" \
        --arg hs "$khs" \
        --arg ver "$CUSTOM_VERSION" \
        --arg algo "$algo" \
        --arg temp "$temp" \
        --arg uptime "$uptime" \
        '{hs:[$hs], $hs_units, temp: [$temp], fan: [0], $uptime, $ver, $algo, bus_numbers: [0]}')

echo khs:   $khs
echo stats: $stats
echo ----------
