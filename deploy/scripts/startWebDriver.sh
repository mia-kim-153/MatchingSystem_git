#!/usr/bin/env bash

MAIN_DIR=D:/CoinTossX-master_deploy

#Start Socket
echo Starting WebSocket...
cd $MAIN_DIR/Socket/bin
./Socket /dev/shm/aeron/web > $MAIN_DIR/WebSocket.log 2>&1 &

sleep 10s