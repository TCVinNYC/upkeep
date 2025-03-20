import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:upkeep_mobile/constants/locales.dart';
import 'package:upkeep_mobile/extensions/build_context_extensions.dart';
import 'package:upkeep_mobile/providers/app_life_cycle.provider.dart';
import 'package:upkeep_mobile/providers/db.provider.dart';
import 'package:upkeep_mobile/providers/infrastructure/db.provider.dart';
import 'package:upkeep_mobile/providers/locale.provider.dart';
import 'package:upkeep_mobile/providers/theme.provider.dart';
import 'package:upkeep_mobile/routes/router.dart';
import 'package:upkeep_mobile/routes/tab_navigation_observer.dart';
// import 'package:upkeep_mobile/theme/dynamic_theme.dart';
// import 'package:upkeep_mobile/theme/theme_data.dart';
import 'package:upkeep_mobile/utils/bootstrap.dart';
import 'package:upkeep_mobile/utils/http_ssl_cert_override.dart';
import 'package:upkeep_mobile/utils/migration.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logging/logging.dart';

void main() async {
  final db = await Bootstrap.initIsar();
  await Bootstrap.initDomain(db);
  await initApp();
  await migrateDatabaseIfNeeded(db);
  HttpOverrides.global = HttpSSLCertOverride();

  runApp(
    ProviderScope(
      overrides: [
        dbProvider.overrideWithValue(db),
        isarProvider.overrideWithValue(db),
      ],
      child: const MainWidget(),
    ),
  );
}

Future<void> initApp() async {
  await EasyLocalization.ensureInitialized();
  await initializeDateFormatting();

  if (kReleaseMode && Platform.isAndroid) {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
      debugPrint("Enabled high refresh mode");
    } catch (e) {
      debugPrint("Error setting high refresh rate: $e");
    }
  }

  // await DynamicTheme.fetchSystemPalette();

  final log = Logger("UpkeepErrorLogger");

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
      if (info.version.sdkInt <= 26) {
        overlayStyle = context.isDarkTheme
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light;
      }
    }
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
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
    // final upkeepTheme = ref.watch(upkeepThemeProvider);

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
          title: 'Upkeep',
          debugShowCheckedModeBanner: false,
          themeMode: ref.watch(upkeepThemeModeProvider),
          // darkTheme: getThemeData(
          //   colorScheme: upkeepTheme.dark,
          //   locale: context.locale,
          // ),
          // theme: getThemeData(
          //   colorScheme: upkeepTheme.light,
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
