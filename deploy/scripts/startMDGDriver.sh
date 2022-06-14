#!/usr/bin/env bash

MAIN_DIR=D:/CoinTossX-master_deploy

#Start Socket
echo Starting Market Data Gateway Socket...
cd $MAIN_DIR/Socket/bin
./Socket /dev/shm/aeron/marketDataGateway > $MAIN_DIR/MDGSocket.log 2>&1 &

sleep 10s