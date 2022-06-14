#!/usr/bin/env bash

MAIN_DIR=D:/CoinTossX-master_deploy

#Start Socket
echo Starting Trading Gateway Socket...
cd $MAIN_DIR/Socket/bin
./Socket /dev/shm/aeron/tradingGateway > $MAIN_DIR/TGSocket.log 2>&1 &

sleep 10s