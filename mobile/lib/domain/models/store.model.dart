import 'package:upkeep_mobile/domain/models/user.model.dart';

/// Key for each possible value in the `Store`.
/// Defines the data type for each value
enum StoreKey<T> {
  version<int>._(0),
  currentUser<UserDto>._(1),
  deviceIdHash<int>._(2),
  deviceId<String>._(3),

  //server settings
  serverUrl<String>._(10),
  accessToken<String>._(11),
  serverEndpoint<String>._(12),
  sslClientCertData<String>._(13),
  sslClientPasswd<String>._(14),

  // user settings from [AppSettingsEnum] below:
  themeMode<String>._(100),
  advancedTroubleshooting<bool>._(101),
  logLevel<int>._(102),
  storageIndicator<bool>._(103),
  enableHapticFeedback<bool>._(104),

  // theme settings
  primaryColor<String>._(128),
  dynamicTheme<bool>._(129),
  colorfulInterface<bool>._(130),

  // Auto endpoint switching
  autoEndpointSwitching<bool>._(132),
  preferredWifiName<String>._(133),
  localEndpoint<String>._(134),
  externalEndpointList<String>._(135),
  ;

  const StoreKey._(this.id);
  final int id;
  Type get type => T;
}

class StoreUpdateEvent<T> {
  final StoreKey<T> key;
  final T? value;

  const StoreUpdateEvent(this.key, this.value);

  @override
  String toString() {
    return '''
StoreUpdateEvent: {
  key: $key,
  value: ${value ?? '<NA>'},
}''';
  }

  @override
  bool operator ==(covariant StoreUpdateEvent<T> other) {
    if (identical(this, other)) return true;

    return other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}
