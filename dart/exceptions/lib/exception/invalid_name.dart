class InvalidName implements Exception {
  String error() => "Invalid Name";

  @override
  String toString() {
    return "invalidName: ${error()}";
  }
}