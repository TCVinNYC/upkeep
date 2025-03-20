/// Base class which is used to check if an Exception is a custom exception
sealed class UpkeepErrors {
  const UpkeepErrors();
}

class NoResponseDtoError extends UpkeepErrors implements Exception {
  @override
  String toString() => "Response Dto is null";
}
