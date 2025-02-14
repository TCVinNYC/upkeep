import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:upkeep/services/app_settings.service.dart';

part 'app_settings.provider.g.dart';

@Riverpod(keepAlive: true)
AppSettingsService appSettingsService(AppSettingsServiceRef ref) =>
    AppSettingsService();
