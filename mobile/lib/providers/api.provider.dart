import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:upkeep_mobile/services/api.service.dart';

part 'api.provider.g.dart';

@Riverpod(keepAlive: true)
ApiService apiService(ref) => ApiService();
