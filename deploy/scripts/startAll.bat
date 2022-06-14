set MAIN_DIR=D:/CoinTossX-master_deploy
cd %MAIN_DIR%\scripts

.\startLowLatencyDriver.bat
.\startTGDriver.bat
.\startMDGDriver.bat
.\startNativeGateway.bat
.\startMatchingEngine.bat
.\startMarketDataGateway.bat
sleep 10
.\startWeb.bat

