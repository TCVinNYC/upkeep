import 'dart:async';

import 'package:upkeep_mobile/domain/models/store.model.dart';
import 'package:upkeep_mobile/entities/store.entity.dart';
import 'package:upkeep_mobile/infrastructure/entities/store.entity.dart';
import 'package:upkeep_mobile/infrastructure/entities/user.entity.dart';
import 'package:isar/isar.dart';

const int targetVersion = 9;

Future<void> migrateDatabaseIfNeeded(Isar db) async {
  final int version = Store.get(StoreKey.version, 1);

  if (version < 9) {
    await Store.put(StoreKey.version, version);
    final value = await db.storeValues.get(StoreKey.currentUser.id);
    if (value != null) {
      final id = value.intValue;
      if (id == null) {
        return;
      }
      await db.writeTxn(() async {
        final user = await db.users.get(id);
        await db.storeValues
            .put(StoreValue(StoreKey.currentUser.id, strValue: user?.id));
      });
    }
    // Do not clear other entities
    return;
  }

  if (version < targetVersion) {
    _migrateTo(db, targetVersion);
  }
}

Future<void> _migrateTo(Isar db, int version) async {
  await db.writeTxn(() async {
    await db.users.clear();
  });
  await Store.put(StoreKey.version, version);
}
