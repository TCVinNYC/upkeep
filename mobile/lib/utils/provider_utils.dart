import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:upkeep_mobile/providers/infrastructure/user.provider.dart';

void invalidateAllApiRepositoryProviders(WidgetRef ref) {
  ref.invalidate(userApiRepositoryProvider);
}
