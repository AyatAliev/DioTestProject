class Failure {
  final String message;
  final String exception;
  final StackTrace stackTrace;

  Failure({
    required this.message,
    required this.exception,
    required this.stackTrace,
  });


  @override
  String toString() {
    return message;
  }
}
