# Better Enchant Books (Fabric 1.21.11)

从本地 1.21.1 工程 `better-enchant-books` **选择性移植**附魔到 Minecraft **1.21.11 / Fabric**。

当前仓库是可构建的脚手架：映射、依赖与数据包路径已搭好，附魔效果按需逐个搬迁。

## 环境

| 项 | 版本 |
|----|------|
| Minecraft | 1.21.11 |
| Fabric Loader | 0.19.5 |
| Fabric API | 0.141.6+1.21.11 |
| Loom | 1.18-SNAPSHOT |
| Mappings | **Mojang official**（非 Yarn） |
| 运行时字节码 | Java 21 |
| **构建用 JDK** | **25+**（Loom 1.18 要求；可用 MC 自带 `java-runtime-epsilon`） |

> Fabric 在 1.21.11 之后不再更新 Yarn，本项目直接使用官方映射，便于后续跟进。

## 构建

推荐（自动隔离本机 `GRADLE_USER_HOME` 里可能锁死的旧 JDK）：

```bat
build.bat build
build.bat runClient
```

产物：`build/libs/better-enchant-books-<version>.jar`

## 移植约定

1. **附魔定义**：`src/main/resources/data/better_enchants/enchantment/<id>.json`
2. **语言**：`assets/better_enchants/lang/{zh_cn,en_us}.json`
3. **运行时逻辑**（Handler / Mixin / 网络）：按附魔从 1.21.1 源码拷贝后改成 Mojang 映射名
4. 详见 [PORTING.md](PORTING.md)

## 已放入示例

- `smelting_touch`：仅 JSON + 语言键（效果逻辑待移植）

## 许可

MIT — Copyright (c) 2026 空栈的压入禁止
