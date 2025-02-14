import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:upkeep/entities/store.entity.dart';
import 'package:upkeep/entities/user.entity.dart';
import 'package:upkeep/providers/api.provider.dart';
import 'package:upkeep/providers/db.provider.dart';
import 'package:upkeep/services/api.service.dart';
import 'package:isar/isar.dart';

class CurrentUserProvider extends StateNotifier<User?> {
  CurrentUserProvider(this._apiService) : super(null) {
    state = Store.tryGet(StoreKey.currentUser);
    streamSub =
        Store.watch(StoreKey.currentUser).listen((user) => state = user);
  }

  final ApiService _apiService;
  late final StreamSubscription<User?> streamSub;

  refresh() async {
    try {
      final user = await _apiService.usersApi.getMyUser();
      final userPreferences = await _apiService.usersApi.getMyPreferences();
      if (user != null) {
        Store.put(
          StoreKey.currentUser,
          User.fromUserDto(user, userPreferences),
        );
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    streamSub.cancel();
    super.dispose();
  }
}

final currentUserProvider =
    StateNotifierProvider<CurrentUserProvider, User?>((ref) {
  return CurrentUserProvider(
    ref.watch(apiServiceProvider),
  );
});
