#!/usr/bin/env bash

MAIN_DIR=D:/CoinTossX-master_deploy

#Start Hawkes Simulator
echo Starting Hawkes Simulation...
cd $MAIN_DIR/ClientSimulator/bin
./HawkesSimulation $1 $2 $3 > $MAIN_DIR/HawkesSimulation_$1_$2.log 2>&1 &