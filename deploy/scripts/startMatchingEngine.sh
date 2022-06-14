#!/usr/bin/env bash

MAIN_DIR=D:/CoinTossX-master_deploy

#Start Matching Engine
echo Starting Matching Engine...
cd $MAIN_DIR/MatchingEngine/bin
./MatchingEngine > $MAIN_DIR/MatchingEngine.log 2>&1 &