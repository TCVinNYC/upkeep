import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:upkeep_mobile/domain/interfaces/store.interface.dart';
import 'package:upkeep_mobile/domain/services/store.service.dart';
import 'package:upkeep_mobile/infrastructure/repositories/store.repository.dart';
import 'package:upkeep_mobile/providers/infrastructure/db.provider.dart';

part 'store.provider.g.dart';

@Riverpod(keepAlive: true)
IStoreRepository storeRepository(Ref ref) =>
    IsarStoreRepository(ref.watch(isarProvider));

@Riverpod(keepAlive: true)
StoreService storeService(Ref _) => StoreService.I;
