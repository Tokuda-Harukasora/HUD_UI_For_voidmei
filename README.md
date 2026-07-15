# VoidMei Modern Fighter HUD / 现代战斗机HUD风格

**Version:** 1.581 | **Date:** 2026-07

将 VoidMei 的 HUD 界面改造为 **现代战斗机磁带式仪表风格**（F-16 / F-35），全绿色单色渲染。

Transforms VoidMei's HUD into a **modern fighter jet tape-instrument style** (F-16 / F-35), with unified green monochrome rendering.

---

## Screenshots / 截图

```
┌─────────────────────────────────────────┐
│              HEADING TAPE               │  ← 水平航向带
├──────┬─────────────────────┬────────────┤
│ IAS  │                     │ ALT TAPE   │
│ TAPE │    ATTITUDE GAUGE   │   + VSI    │  ← 空速/高度磁带 + 升降率
│      │      (center)       │            │
│  G   │                     │            │
├──────┴─────────────────────┴────────────┤
│       ENGINE STRIP (THR + %)            │  ← 发动机信息
└─────────────────────────────────────────┘
```

---

## Features / 功能

### New Tape-Style Instruments / 新增磁带式仪表
| Component | Description |
|-----------|-------------|
| **AirspeedTape** | Left vertical speed tape, major ticks 100 km/h, digital readout + Mach |
| **AltitudeTape** | Right vertical altitude tape, major ticks 500m, radar altitude on low |
| **HeadingTape** | Top horizontal compass tape, ±40° view, N/E/S/W markers |
| **VertSpeedIndicator** | Vertical speed strip (±50 m/s), right side |
| **GLoadIndicator** | Large G-force digital display |
| **EngineInfoStrip** | Bottom engine info bar (throttle bar + %) |

### 新增磁带式仪表
| 组件 | 说明 |
|------|------|
| **空速带** | 左侧垂直空速刻度，主刻度100km/h，底部数字+马赫数 |
| **高度带** | 右侧垂直高度刻度，主刻度500m，低空自动显示雷达高度 |
| **航向带** | 顶部水平罗盘带，±40°可见，N/E/S/W 方向标记 |
| **升降率** | 垂直速度指示条 (±50 m/s)，右侧 |
| **G值** | 大号过载数字显示 |
| **发动机条** | 底部油门进度条 + 百分比 |

### Color / 颜色
- Main text: **HUD Green** `#1BFF80` (RGB 27, 255, 128) / 主文字：HUD绿
- Warning: Red / 告警：红色
- All unit labels now use green instead of gray / 所有单位标签改为绿色

### Config / 配置
- `modernHudStyle` toggle: switch between **modern** (default) and **classic** row layout
- `modernHudStyle` 开关：可在现代磁带式（默认）和经典行布局之间切换
- Colors configurable via Settings UI or `ui_layout.cfg` / 颜色可通过设置界面或配置文件调整

---

## Installation / 安装

### For new users / 新用户（完整包）

1. Download and extract the ZIP / 下载并解压ZIP
2. Double-click `VoidMei.bat` or run / 双击运行：
   ```
   java -jar VoidMei.jar
   ```
3. Requires **Java 8** (1.8.x) — [Download Eclipse Temurin 8](https://adoptium.net/download/)
4. 需要 **Java 8** (1.8.x)

### For existing VoidMei users / 已有 VoidMei 的用户

1. **Backup** your original files:
   ```
   copy VoidMei.jar VoidMei.jar.bak
   copy ui_layout.cfg ui_layout.cfg.bak
   ```

2. **Replace** the files:
   - Copy `VoidMei.jar` → your VoidMei folder (overwrite)
   - Copy `ui_layout.cfg` → your VoidMei folder (overwrite)

3. **Delete** your user config to pick up new defaults (optional):
   - Delete `ui_layout.user.cfg` (it will be regenerated from the new template)
   - Or manually change `fontNum` / `fontLabel` `:value` to `#1BFF80FF` in your `ui_layout.user.cfg`

4. Run / 运行: `java -jar VoidMei.jar`

### 已有 VoidMei 的用户

1. **备份**原文件：
   ```
   copy VoidMei.jar VoidMei.jar.bak
   copy ui_layout.cfg ui_layout.cfg.bak
   ```

2. **替换**文件：
   - 复制 `VoidMei.jar` → 你的 VoidMei 目录（覆盖）
   - 复制 `ui_layout.cfg` → 你的 VoidMei 目录（覆盖）

3. **删除**用户配置以获取新默认值（可选）：
   - 删除 `ui_layout.user.cfg`（会自动从新模板重新生成）
   - 或手动将 `ui_layout.user.cfg` 中的 `fontNum` / `fontLabel` 的 `:value` 改为 `#1BFF80FF`

4. 运行: `java -jar VoidMei.jar`

---

## Style Switching / 风格切换

### Switch to Classic mode / 切换到经典模式

Add to `ui_layout.cfg` or change via Settings UI:
```
(item "现代HUD" :type switch :target "modernHudStyle" :value false)
```

Or temporary switch in Settings panel / 或在设置面板中临时切换.

### Customize colors / 自定义颜色

In Settings panel → "颜色" section, or edit `ui_layout.user.cfg`:

| Key | Default (Modern) | Original (White) |
|-----|------------------|------------------|
| `fontNum` | `#1BFF80FF` | `#FFFFFFFF` |
| `fontLabel` | `#1BFF80A6` | `#FFFFFFFF` |
| `fontUnit` | `#E89332FF` | same |
| `fontWarn` | `#FF2400FF` | same |

---

## Requirements / 系统要求

- **Java 8** (1.8.x) — NOT Java 9+ / 不支持 Java 9+
- **War Thunder** running with HTTP API enabled (port 8111)
- Windows / Linux / macOS (untested on macOS)

---

## Files / 文件清单

```
voidmei-modern-hud/
├── README.md              ← This file / 本文件
├── VoidMei.jar            ← Modified application JAR / 修改后的主程序
├── ui_layout.cfg          ← Template config with green defaults / 绿色默认配置模板
└── dep/                   ← Required dependencies / 必需依赖
    ├── weblaf-complete-1.29.jar
    ├── jnativehook-2.2.2.jar
    ├── jna-5.14.0.jar
    └── jna-platform-5.14.0.jar
```

---

## Source Changes / 源码改动

New components / 新增组件 (`src/ui/component/`):
- `AirspeedTape.java` — 左侧空速带
- `AltitudeTape.java` — 右侧高度带
- `HeadingTape.java` — 顶部航向带
- `VertSpeedIndicator.java` — 升降率
- `GLoadIndicator.java` — G值
- `EngineInfoStrip.java` — 发动机条

Modified / 修改:
- `MiniHUDOverlay.java` — dual-mode layout engine (modern + classic)
- `HUDSettings.java` — added `isModernHudStyle()`
- `ConfigurationService.java` — implemented config key `modernHudStyle`
- `Controller.java` — registered interest for live preview

---

## License / 许可

Same as VoidMei project. / 与 VoidMei 项目相同。

---

Made with ❤️ for the War Thunder community.
为战争雷霆社区用爱发电。
