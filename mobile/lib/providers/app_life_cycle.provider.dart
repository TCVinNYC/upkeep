import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:upkeep/providers/auth.provider.dart';
import 'package:upkeep/providers/notification_permission.provider.dart';
import 'package:upkeep/providers/tab.provider.dart';
import 'package:upkeep/services/upkeep_logger.service.dart';
import 'package:permission_handler/permission_handler.dart';

enum AppLifeCycleEnum {
  active,
  inactive,
  paused,
  resumed,
  detached,
  hidden,
}

class AppLifeCycleNotifier extends StateNotifier<AppLifeCycleEnum> {
  final Ref _ref;
  bool _wasPaused = false;

  AppLifeCycleNotifier(this._ref) : super(AppLifeCycleEnum.active);

  AppLifeCycleEnum getAppState() {
    return state;
  }

  void handleAppResume() async {
    state = AppLifeCycleEnum.resumed;

    // no need to resume because app was never really paused
    if (!_wasPaused) return;
    _wasPaused = false;

    final isAuthenticated = _ref.read(authProvider).isAuthenticated;

    // Needs to be logged in
    if (isAuthenticated) {
      // switch endpoint if needed
      final endpoint =
          await _ref.read(authProvider.notifier).setOpenApiServiceEndpoint();
      if (kDebugMode) {
        debugPrint("Using server URL: $endpoint");
      }

      switch (_ref.read(tabProvider)) {
        case TabEnum.home:
          await _ref.read(assetProvider.notifier).getAllAsset();
          break;
        case TabEnum.search:
          // nothing to do
          break;

        case TabEnum.albums:
          await _ref.read(albumProvider.notifier).refreshRemoteAlbums();
          break;
        case TabEnum.library:
          // nothing to do
          break;
      }
    }

    await _ref
        .read(notificationPermissionProvider.notifier)
        .getNotificationPermission();

    _ref.invalidate(memoryFutureProvider);
  }

  void handleAppInactivity() {
    state = AppLifeCycleEnum.inactive;
    // do not stop/clean up anything on inactivity: issued on every orientation change
  }

  void handleAppPause() {
    state = AppLifeCycleEnum.paused;
    _wasPaused = true;

    UpkeepLogger().flush();
  }

  void handleAppDetached() {
    state = AppLifeCycleEnum.detached;
    // no guarantee this is called at all
  }

  void handleAppHidden() {
    state = AppLifeCycleEnum.hidden;
    // do not stop/clean up anything on inactivity: issued on every orientation change
  }
}

final appStateProvider =
    StateNotifierProvider<AppLifeCycleNotifier, AppLifeCycleEnum>((ref) {
  return AppLifeCycleNotifier(ref);
});
