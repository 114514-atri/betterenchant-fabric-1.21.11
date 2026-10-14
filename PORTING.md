# 从 1.21.1 选择性移植清单

源项目：`../better-enchant-books`（Yarn 映射）  
目标：本仓库（Mojang 映射，MC 1.21.11）

## 每个附魔的最小步骤

1. 复制 `data/better_enchants/enchantment/<id>.json`（必要时按 1.21.11 附魔 schema 微调）
2. 复制 / 合并 `lang` 中的 `enchantment.better_enchants.<id>`
3. 若有效果逻辑：从 1.21.1 的 `enchant/`、`combat/`、`mixin/` 拷贝对应 Handler，用 IDE / Loom `migrateMappings` 思路改成 Mojang 类名
4. 在 `BetterEnchantsMod#onInitialize`（或独立 register 类）注册事件
5. `gradlew build` + 进游戏用附魔书验证

## 待选列表（按需勾选）

从 1.21.1 的 `data/better_enchants/enchantment/` 挑选，例如：

- [x] `smelting_touch` — JSON 占位
- [ ] `vein_mining` / `fortune_echo` / `bloodlust` / …
- [ ] 战斗类：`chain_lightning`、`dimension_slash`、…
- [ ] 诅咒 / 传说 / boss 相关

## 映射注意

| Yarn (1.21.1) | Mojang (1.21.11) |
|---------------|------------------|
| `Identifier` | `Identifier`（包改为 `net.minecraft.resources`） |
| `ModInitializer` | 不变 |
| 实体 / 伤害 / 附魔 API | 以 1.21.11 官方名为准，勿硬套 Yarn 名 |

复杂文件可先在源项目跑 Loom `migrateMappings` 到 mojmap，再拷进本仓库。

## 不做 / 延后

- 整包 Scarlet Realm / 地形管道 / GeckoLib 神器外观（除非单独决定移植）
- 强依赖 1.21.1 专用模组的逻辑（需先找 1.21.11 替代或拆成软依赖）
