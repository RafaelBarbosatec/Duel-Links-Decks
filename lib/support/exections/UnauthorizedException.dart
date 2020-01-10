class UnauthorizedException implements Exception {

  final String msg;

  UnauthorizedException(this.msg);

  @override
  String toString() {
    return 'UnauthorizedException{msg: $msg}';
  }


}
