package com.betterenchants;

import net.fabricmc.api.ModInitializer;
import net.minecraft.resources.Identifier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Fabric 1.21.11 入口。从 1.21.1 better-enchant-books 选择性移植附魔时，
 * 在此注册 Handler / 网络 / 物品等运行时逻辑。
 * 附魔定义本身走数据包 JSON：{@code data/better_enchants/enchantment/*.json}
 */
public final class BetterEnchantsMod implements ModInitializer {
	public static final String MOD_ID = "better_enchants";
	public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

	@Override
	public void onInitialize() {
		LOGGER.info("Better Enchant Books (1.21.11) loaded — selective port scaffold.");
	}

	public static Identifier id(String path) {
		return Identifier.fromNamespaceAndPath(MOD_ID, path);
	}
}
