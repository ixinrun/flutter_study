import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ehi_school/base/http/http_error.dart';
import 'package:flutter/foundation.dart';

/// 拦截器统一处理
class HttpInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.data != null && _isJsonMime(options.contentType)) {
      options.data = jsonEncode(options.data);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.responseType == ResponseType.json) {
      response.data = await _decodeJson(response.data);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    HttpError error = HttpError.create(err);
    debugPrint('HttpError===>: ${error.toString()}');
    super.onError(err, handler);
  }

  /// 判断contentType是否是Json类型
  static bool _isJsonMime(String? contentType) {
    if (contentType == null) return false;
    return Headers.jsonContentType == contentType.toLowerCase();
  }

  /// json的解码通过compute方法在后台进行，这样可以避免在解析复杂json时导致的UI卡顿。
  static dynamic _decodeJson(String text) {
    return compute(jsonDecode, text);
  }
}
