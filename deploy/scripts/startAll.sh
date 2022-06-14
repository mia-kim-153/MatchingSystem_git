#!/bin/sh

MAIN_DIR=D:/CoinTossX-master_deploy

#Start All
echo Starting All Engines...
cd $MAIN_DIR/scripts

./startLowLatencyDriver.sh
./startTGDriver.sh
./startMDGDriver.sh
./startWebDriver.sh
./startNativeGateway.sh
./startMatchingEngine.sh
./startMarketDataGateway.sh
./startWebEventListener.sh
sleep 10
./startWeb.sh
