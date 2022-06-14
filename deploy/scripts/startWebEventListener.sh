#!/usr/bin/env bash

MAIN_DIR=D:/CoinTossX-master_deploy

#Start Web Event Listener
echo Starting Web Event Listener...
cd $MAIN_DIR/WebEventListener/bin
./WebEventListener > $MAIN_DIR/WebEventListener.log 2>&1 &

sleep 10s