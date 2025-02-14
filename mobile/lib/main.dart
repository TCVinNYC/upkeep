import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:upkeep/constants/locales.dart';
import 'package:upkeep/providers/app_life_cycle.provider.dart';
import 'package:upkeep/providers/locale.provider.dart';
import 'package:upkeep/routes/router.dart';
import 'package:upkeep/routes/tab_navigation_observer.dart';
import 'package:upkeep/services/upkeep_logger.service.dart';
// import 'package:immich_mobile/providers/theme.provider.dart';
// import 'package:immich_mobile/routing/tab_navigation_observer.dart';
// import 'package:immich_mobile/entities/logger_message.entity.dart';
// import 'package:immich_mobile/entities/store.entity.dart';
// import 'package:immich_mobile/entities/user.entity.dart';
// import 'package:immich_mobile/services/immich_logger.service.dart';
// import 'package:immich_mobile/services/local_notification.service.dart';
// import 'package:immich_mobile/theme/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final db = await loadDb();
  await initApp();
  // await migrateDatabaseIfNeeded(db);

  runApp(
    ProviderScope(
      // overrides: [dbProvider.overrideWithValue(db)],
      child: const MainWidget(),
    ),
  );
}

Future<void> initApp() async {
  await EasyLocalization.ensureInitialized();

  if (kReleaseMode && Platform.isAndroid) {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
      debugPrint("Enabled high refresh mode");
    } catch (e) {
      debugPrint("Error setting high refresh rate: $e");
    }
  }

  // Initialize RL Logger Service
  UpkeepLogger();

  final log = Logger("RLErrorLogger");

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    log.severe(
      'FlutterError - Catch all',
      "${details.toString()}\nException: ${details.exception}\nLibrary: ${details.library}\nContext: ${details.context}",
      details.stack,
    );
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint("FlutterError - Catch all: $error \n $stack");
    log.severe('PlatformDispatcher - Catch all', error, stack);
    return true;
  };
}

// Future<Isar> loadDb() async {
//   final dir = await getApplicationDocumentsDirectory();
//   Isar db = await Isar.open(
//     [
//       UserSchema,
//     ],
//     directory: dir.path,
//     maxSizeMiB: 1024,
//   );
//   Store.init(db);
//   return db;
// }

class UpkeepApp extends ConsumerStatefulWidget {
  const UpkeepApp({super.key});

  @override
  UpkeepAppState createState() => UpkeepAppState();
}

class UpkeepAppState extends ConsumerState<UpkeepApp>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("[APP STATE] resumed");
        ref.read(appStateProvider.notifier).handleAppResume();
        break;
      case AppLifecycleState.inactive:
        debugPrint("[APP STATE] inactive");
        ref.read(appStateProvider.notifier).handleAppInactivity();
        break;
      case AppLifecycleState.paused:
        debugPrint("[APP STATE] paused");
        ref.read(appStateProvider.notifier).handleAppPause();
        break;
      case AppLifecycleState.detached:
        debugPrint("[APP STATE] detached");
        ref.read(appStateProvider.notifier).handleAppDetached();
        break;
      case AppLifecycleState.hidden:
        debugPrint("[APP STATE] hidden");
        ref.read(appStateProvider.notifier).handleAppHidden();
        break;
    }
  }

  Future<void> initApp() async {
    WidgetsBinding.instance.addObserver(this);

    // Draw the app from edge to edge
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // Sets the navigation bar color
    SystemUiOverlayStyle overlayStyle = const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    );
    if (Platform.isAndroid) {
      // Android 8 does not support transparent app bars
      final info = await DeviceInfoPlugin().androidInfo;
      // if (info.version.sdkInt <= 26) {
      //   overlayStyle = context.isDarkTheme
      //       ? SystemUiOverlayStyle.dark
      //       : SystemUiOverlayStyle.light;
      // }
    }
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    // await ref.read(localNotificationService).setup();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Intl.defaultLocale = context.locale.toLanguageTag();
  }

  @override
  initState() {
    super.initState();
    initApp().then((_) => debugPrint("App Init Completed"));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // needs to be delayed so that EasyLocalization is working
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    // final immichTheme = ref.watch(immichThemeProvider);

    return ProviderScope(
      overrides: [
        localeProvider.overrideWithValue(context.locale),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: true,
        home: MaterialApp.router(
          title: 'Immich',
          debugShowCheckedModeBanner: false,
          // themeMode: ref.watch(immichThemeModeProvider),
          // darkTheme: getThemeData(
          //   colorScheme: immichTheme.dark,
          //   locale: context.locale,
          // ),
          // theme: getThemeData(
          //   colorScheme: immichTheme.light,
          //   locale: context.locale,
          // ),
          routeInformationParser: router.defaultRouteParser(),
          routerDelegate: router.delegate(
            navigatorObservers: () => [TabNavigationObserver(ref: ref)],
          ),
        ),
      ),
    );
  }
}

// ignore: prefer-single-widget-per-file
class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: locales.values.toList(),
      path: translationsPath,
      useFallbackTranslations: true,
      fallbackLocale: locales.values.first,
      child: const UpkeepApp(),
    );
  }
}
