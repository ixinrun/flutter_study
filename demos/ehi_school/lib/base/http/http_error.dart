import 'package:dio/dio.dart';

/// Http异常封装
class HttpError implements Exception {
  String message;
  int code;

  HttpError(this.code, this.message);

  String toString() => "Exception: code $code, $message";

  void toPrint() {
    print(toString());
  }

  factory HttpError.create(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return HttpError(-1, "网络连接超时，请稍后重试!");
      case DioErrorType.response:
        int errCode = error.response?.statusCode ?? -1;
        return HttpError(errCode, "请求失败，请稍后重试[$errCode]");
      case DioErrorType.cancel:
        return HttpError(-1, "请求已取消");
      default:
        return HttpError(-1, '未知错误：' + error.message);
    }
  }
}
