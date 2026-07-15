@echo off
chcp 65001 >nul
echo ============================================
echo   VoidMei Modern Fighter HUD - Installer
echo   现代战斗机HUD风格 - 安装脚本
echo ============================================
echo.

if not exist "VoidMei.jar" (
    echo [ERROR] VoidMei.jar not found in current directory!
    echo [错误] 当前目录找不到 VoidMei.jar！
    echo Please run this script from the extracted ZIP folder.
    echo 请从解压后的ZIP文件夹中运行此脚本。
    pause
    exit /b 1
)

:: Ask for VoidMei install directory
echo Enter your VoidMei installation directory:
echo 请输入你的 VoidMei 安装目录:
echo.
echo Example: C:\Games\voidmei
echo.
set /p VOIDMEI_DIR="Path / 路径: "

if not exist "%VOIDMEI_DIR%" (
    echo [ERROR] Directory not found: %VOIDMEI_DIR%
    echo [错误] 找不到目录: %VOIDMEI_DIR%
    pause
    exit /b 1
)

:: Check if VoidMei.jar exists in target
if not exist "%VOIDMEI_DIR%\VoidMei.jar" (
    echo [WARNING] VoidMei.jar not found in %VOIDMEI_DIR%
    echo [警告] 在 %VOIDMEI_DIR% 中找不到 VoidMei.jar
    echo This will be a fresh install.
    echo 这将是一个全新安装。
    echo.
)

:: Backup
echo.
echo [1/3] Backing up original files / 备份原文件...
if exist "%VOIDMEI_DIR%\VoidMei.jar" (
    copy /Y "%VOIDMEI_DIR%\VoidMei.jar" "%VOIDMEI_DIR%\VoidMei.jar.bak" >nul 2>&1
    echo   VoidMei.jar -^> VoidMei.jar.bak
)
if exist "%VOIDMEI_DIR%\ui_layout.cfg" (
    copy /Y "%VOIDMEI_DIR%\ui_layout.cfg" "%VOIDMEI_DIR%\ui_layout.cfg.bak" >nul 2>&1
    echo   ui_layout.cfg -^> ui_layout.cfg.bak
)
if exist "%VOIDMEI_DIR%\ui_layout.user.cfg" (
    copy /Y "%VOIDMEI_DIR%\ui_layout.user.cfg" "%VOIDMEI_DIR%\ui_layout.user.cfg.bak" >nul 2>&1
    echo   ui_layout.user.cfg -^> ui_layout.user.cfg.bak
)
echo   Done / 完成.

:: Copy new files
echo.
echo [2/3] Installing modern HUD files / 安装现代HUD文件...
copy /Y "VoidMei.jar" "%VOIDMEI_DIR%\VoidMei.jar" >nul 2>&1
echo   VoidMei.jar installed / 已安装
copy /Y "ui_layout.cfg" "%VOIDMEI_DIR%\ui_layout.cfg" >nul 2>&1
echo   ui_layout.cfg installed / 已安装

:: Copy dep if not exist
if not exist "%VOIDMEI_DIR%\dep\" mkdir "%VOIDMEI_DIR%\dep"
xcopy /Y /Q "dep\*" "%VOIDMEI_DIR%\dep\" >nul 2>&1
echo   Dependencies installed / 依赖库已安装

:: Reset user config to pick up new defaults
echo.
echo [3/3] Resetting user config to pick up green color defaults...
echo       重置用户配置以应用绿色默认值...
if exist "%VOIDMEI_DIR%\ui_layout.user.cfg" (
    del "%VOIDMEI_DIR%\ui_layout.user.cfg" >nul 2>&1
    echo   ui_layout.user.cfg deleted (will regenerate) / 已删除(将自动重建)
) else (
    echo   No user config to reset / 无需重置
)

echo.
echo ============================================
echo   Installation complete! / 安装完成！
echo ============================================
echo.
echo To switch back to classic layout:
echo 切回经典布局方法:
echo   Edit ui_layout.cfg, set modernHudStyle to false
echo   编辑 ui_layout.cfg, 将 modernHudStyle 设为 false
echo.
echo Run: java -jar VoidMei.jar
echo.
pause
