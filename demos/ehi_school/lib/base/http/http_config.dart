import 'package:dio/dio.dart';

class HttpConfig {
  HttpConfig._();

  // 超时时间 20s
  static const int TIME_OUT = 20000;

  // 发送超时时间 20s
  static const int SEND_TIMEOUT = 20000;

  // 接收超时时间 20s
  static const int RECEIVE_TIMEOUT = 20000;

  // 请求内容类型 json，UTF-8
  static const String CONTENT_TYPE_JSON = Headers.jsonContentType;

  // 请求内容类型 form，UTF-8
  static const String CONTENT_TYPE_FORM = 'multipart/form-data;charset=utf-8';

  // heads
  static const String HEADER_CONTENT_TYPE = "content-type";
}
