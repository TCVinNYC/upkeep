dynamic upgradeDto(dynamic value, String targetType) {
  switch (targetType) {
    case 'UserResponseDto':
      if (value is Map) {
        addDefault(value, 'profileChangedAt', DateTime.now().toIso8601String());
      }
      break;
    case 'UserAdminResponseDto':
      if (value is Map) {
        addDefault(value, 'profileChangedAt', DateTime.now().toIso8601String());
      }
      break;
  }
}

addDefault(dynamic value, String keys, dynamic defaultValue) {
  // Loop through the keys and assign the default value if the key is not present
  List<String> keyList = keys.split('.');
  dynamic current = value;

  for (int i = 0; i < keyList.length - 1; i++) {
    if (current[keyList[i]] == null) {
      current[keyList[i]] = {};
    }
    current = current[keyList[i]];
  }

  if (current[keyList.last] == null) {
    current[keyList.last] = defaultValue;
  }
}
