#!/usr/bin/env bash

MAIN_DIR=D:/CoinTossX-master_deploy

#Start Market Data Gateway
echo Starting Market Data Gateway...
cd $MAIN_DIR/MarketDataGateway/bin
./MarketDataGateway > $MAIN_DIR/MarketDataGateway.log 2>&1 &