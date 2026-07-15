# HUD_UI_For_voidmei

> 现代战斗机 HUD 风格 for VoidMei — F-16/F-35 磁带式仪表 + HUD绿配色
> Modern Fighter HUD style add-on for VoidMei

## 项目结构 / Structure

```
├── src/                       ← 源码 / Source
│   ├── ui/component/
│   │   ├── AirspeedTape.java     空速带
│   │   ├── AltitudeTape.java     高度带
│   │   ├── HeadingTape.java      航向带
│   │   ├── VertSpeedIndicator.java  升降率
│   │   ├── GLoadIndicator.java   G值
│   │   └── EngineInfoStrip.java  发动机条
│   ├── ui/overlay/
│   │   └── MiniHUDOverlay.java   修改：双模式布局
│   └── prog/config/
│       └── HUDSettings.java      修改：新增 isModernHudStyle()
├── modern-hud/                ← 编译后的 class 文件 (add-on)
├── ui_layout.cfg              ← 绿色默认配置
├── VoidMei-modern.bat         ← 启动脚本
└── README.md
```

## 编译 / Build

```bash
# 需要 VoidMei 的 VoidMei.jar 和 dep/ 依赖
javac -encoding UTF-8 -d modern-hud \
  -cp "VoidMei.jar;dep/*" \
  src/ui/component/*.java \
  src/ui/overlay/MiniHUDOverlay.java \
  src/prog/config/HUDSettings.java
```

## 安装 / Install

1. 复制 `modern-hud/` 到 VoidMei 安装目录
2. 复制 `VoidMei-modern.bat` 到 VoidMei 安装目录
3. 双击 `VoidMei-modern.bat` 启动

或使用 Release 中的 `voidmei-modern-hud-addon.zip` 一键安装。

## License

GPL-3.0
