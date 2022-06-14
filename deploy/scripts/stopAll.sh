#!/bin/sh

MAIN_DIR=D:/CoinTossX-master_deploy

#Start All
echo Stopping All Engines...
cd $MAIN_DIR/scripts

./stopLowLatencyDriver.sh
./stopNativeGateway.sh
./stopMatchingEngine.sh
./stopMarketDataGateway.sh
./stopWebEventListener.sh
./stopWeb.sh

