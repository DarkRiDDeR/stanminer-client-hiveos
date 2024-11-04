cd `dirname $0`

. h-manifest.conf
. config.conf

CUSTOM_LOG_BASEDIR=`dirname "$CUSTOM_LOG_BASENAME"`
[[ ! -d $CUSTOM_LOG_BASEDIR ]] && mkdir -p $CUSTOM_LOG_BASEDIR

eval "python3 stan-client-new.py $CONF_STAN_EXTRA_ARGS --worker $CONF_STAN_WORKER 2>&1 | tee $CUSTOM_LOG_BASENAME"