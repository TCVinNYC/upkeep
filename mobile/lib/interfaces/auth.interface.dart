import 'package:upkeep_mobile/interfaces/database.interface.dart';

abstract interface class IAuthRepository implements IDatabaseRepository {
  Future<void> clearLocalData();
  String getAccessToken();
}
