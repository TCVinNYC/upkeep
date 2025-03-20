import 'package:upkeep_mobile/domain/models/store.model.dart';
import 'package:upkeep_mobile/entities/store.entity.dart';

enum AppSettingsEnum<T> {
  themeMode<String>(
    StoreKey.themeMode,
    "themeMode",
    "system",
  ), // "light","dark","system"
  primaryColor<String>(
    StoreKey.primaryColor,
    "primaryColor",
    "blue", //something else in immich*******
  ),
  dynamicTheme<bool>(
    StoreKey.dynamicTheme,
    "dynamicTheme",
    false,
  ),
  colorfulInterface<bool>(
    StoreKey.colorfulInterface,
    "colorfulInterface",
    true,
  ),
  storageIndicator<bool>(StoreKey.storageIndicator, "storageIndicator", true),
  advancedTroubleshooting<bool>(StoreKey.advancedTroubleshooting, null, false),
  logLevel<int>(StoreKey.logLevel, null, 5), // Level.INFO = 5
  enableHapticFeedback<bool>(StoreKey.enableHapticFeedback, null, true),
  autoEndpointSwitching<bool>(StoreKey.autoEndpointSwitching, null, false),
  ;

  const AppSettingsEnum(this.storeKey, this.hiveKey, this.defaultValue);

  final StoreKey<T> storeKey;
  final String? hiveKey;
  final T defaultValue;
}

class AppSettingsService {
  T getSetting<T>(AppSettingsEnum<T> setting) {
    return Store.get(setting.storeKey, setting.defaultValue);
  }

  void setSetting<T>(AppSettingsEnum<T> setting, T value) {
    Store.put(setting.storeKey, value);
  }
}
