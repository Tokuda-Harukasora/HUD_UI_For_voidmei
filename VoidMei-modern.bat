@echo off
setlocal enabledelayedexpansion

REM VoidMei Modern HUD Launcher v1.583
REM 不替换 VoidMei.jar，通过 classpath 优先级加载 modern-hud patch

set JAVA_EXE=
set JAVA8_FOUND=0

for /f "tokens=[redacted]" %%a in ('reg query "HKLM\SOFTWARE\JavaSoft\Java Runtime Environment\1.8" /v JavaHome 2^>nul') do (if exist "%%b\bin\java.exe" (set JAVA_EXE=%%b\bin\java.exe& set JAVA8_FOUND=1))
if !JAVA8_FOUND!==0 (for /f "tokens=[redacted]" %%a in ('reg query "HKLM\SOFTWARE\JavaSoft\JDK\1.8" /v JavaHome 2^>nul') do (if exist "%%b\bin\java.exe" (set JAVA_EXE=%%b\bin\java.exe& set JAVA8_FOUND=1)))
if !JAVA8_FOUND!==0 (for /f "tokens=[redacted]" %%a in ('reg query "HKLM\SOFTWARE\Eclipse Adoptium\JRE\8\hotspot" /s /v Path 2^>nul ^| findstr /i "REG_SZ"') do (if exist "%%b\bin\java.exe" (set JAVA_EXE=%%b\bin\java.exe& set JAVA8_FOUND=1)))
if !JAVA8_FOUND!==0 (for /f "tokens=[redacted]" %%a in ('reg query "HKLM\SOFTWARE\Eclipse Adoptium\JDK\8\hotspot" /s /v Path 2^>nul ^| findstr /i "REG_SZ"') do (if exist "%%b\bin\java.exe" (set JAVA_EXE=%%b\bin\java.exe& set JAVA8_FOUND=1)))
if !JAVA8_FOUND!==0 (if defined JAVA_HOME (if exist "%JAVA_HOME%\bin\java.exe" set JAVA_EXE=%JAVA_HOME%\bin\java.exe))
if not defined JAVA_EXE (where java >nul 2>&1 && set JAVA_EXE=java)

if not defined JAVA_EXE (echo [ModernHUD] 未找到 Java 8& pause & exit /b 1)

echo [ModernHUD] VoidMei 1.583 + Modern Fighter HUD
"!JAVA_EXE!" -Dsun.java2d.uiScale=1 -Xms64m -Xmx320m -cp "modern-hud;VoidMei.jar;dep/*" prog.Launcher %*
