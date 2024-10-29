Hive Os client for StanMiner (https://stanvps.ddns.net/)

# Install

Install the necessary packages if you haven't already:

```
sudo apt install cron screen lm-sensors python3-pip python3-requests python3-psutil psmisc unzip libhwloc15 libsodium23
```

## New wallet

Coin (create new):

```STAN```

Address (your TON address for USDT):

```UQCFVXtlCUjTY5n1zdwXbALgsbYQK1WrZUfAzU3shSyMx5D8```

Name:

``USDT (TON)``

## Custom miner

Miner name:

``stan-miner``

Installation URL:

``https://github.com/DarkRiDDeR/stanminer-client-hiveos/releases/download/v0.0.1-alpha/stanstart-0.0.1alpha.tar.gz```

Hash algorithm: 

``---``

Wallet and worker template:

```%WORKER_NAME%```

Pool URL:

```https://stanvps.ddns.net:8101```

Extra config arguments:

```--wallet %WAL% --threads 28```

# Code examples

https://github.com/minershive/hiveos-linux/tree/master/hive/miners/custom

https://github.com/HaloGenius/hiveos-custom-miner/

https://github.com/MoneroOcean/hiveos/tree/main/mo_xmrig

# License

MIT License