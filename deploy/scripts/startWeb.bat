set MAIN_DIR=D:/CoinTossX-master_deploy
cd %MAIN_DIR%\Web
java -jar -Xmx2G -Xms2G -Dagrona.disable.bounds.checks=true  -XX:+UseG1GC -XX:+UseLargePages -XX:+OptimizeStringConcat -d64 -server -XX:+UseStringDeduplication -XX:+UseCondCardMark -XX:+UnlockDiagnosticVMOptions -XX:GuaranteedSafepointInterval=300000 Web-1.0.war > %MAIN_DIR%\Web.log &