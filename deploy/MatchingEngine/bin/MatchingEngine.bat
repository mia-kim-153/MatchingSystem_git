@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  MatchingEngine startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and MATCHING_ENGINE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Xmx1G" "-Xms1G" "-d64" "-server" "-XX:+UseStringDeduplication" "-Dagrona.disable.bounds.checks=true" "-XX:+UnlockDiagnosticVMOptions" "-XX:GuaranteedSafepointInterval=300000" "-XX:+UseG1GC" "-XX:+UseLargePages" "-XX:+OptimizeStringConcat" "-XX:+UseCondCardMark"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\MatchingEngine-1.0.jar;%APP_HOME%\lib\ObjectLayout-1.0.5-SNAPSHOT.jar;%APP_HOME%\lib\Socket-1.0.jar;%APP_HOME%\lib\LimitOrderBook-1.0.jar;%APP_HOME%\lib\ObjectLayout-1.0.5-SNAPSHOT.jar;%APP_HOME%\lib\Messages-1.0.jar;%APP_HOME%\lib\hppc-0.7.1.jar;%APP_HOME%\lib\joda-time-2.3.jar;%APP_HOME%\lib\aeron-samples-0.9.4.jar;%APP_HOME%\lib\HdrHistogram-2.1.8.jar;%APP_HOME%\lib\aeron-driver-0.9.4.jar;%APP_HOME%\lib\aeron-client-0.9.4.jar;%APP_HOME%\lib\Agrona-0.4.12.jar;%APP_HOME%\lib\commons-csv-1.1.jar;%APP_HOME%\lib\sbe-1.1.7-RC2.jar;%APP_HOME%\lib\jamm-0.2.2.jar;%APP_HOME%\resources


@rem Execute MatchingEngine
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %MATCHING_ENGINE_OPTS%  -classpath "%CLASSPATH%" engine.MatchingEngine %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable MATCHING_ENGINE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%MATCHING_ENGINE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
