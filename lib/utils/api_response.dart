class ApiResponse<T> {
  bool confirma;
  String msg;
  T result;

  ApiResponse.ok(this.result) {
    confirma = true;
  }

  ApiResponse.error(this.msg) {
    confirma = false;
  }
}
