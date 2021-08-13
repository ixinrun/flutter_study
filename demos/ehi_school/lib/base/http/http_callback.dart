import 'package:ehi_school/base/http/http_error.dart';

/// 定义“请求开始”函数类型
typedef Start();

/// 定义“请求成功”函数类型
typedef Success(dynamic);

/// 定义“请求失败”函数类型
typedef Error(Exception e);

/// 定义“请求结束”函数类型
typedef Complete();

class HttpCallBack {
  final Start? start;
  final Success? success;
  final Error? error;
  final Complete? complete;

  HttpCallBack({this.start, this.success, this.error, this.complete});

  /// 开始
  void onStart() {
    start?.call();
  }

  /// 成功
  void onSuccess(dynamic resp) {
    success?.call(resp);
  }

  /// 错误
  void onError(HttpError e) {
    error?.call(e);
  }

  /// 结束
  onComplete() {
    complete?.call();
  }
}
