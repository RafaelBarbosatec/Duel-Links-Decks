class ResponseErroException implements Exception {

  final String error;
  final int code;

  ResponseErroException(this.error, this.code);

  @override
  String toString() {
    return 'ResponseErroException{error: $error}';
  }

}
