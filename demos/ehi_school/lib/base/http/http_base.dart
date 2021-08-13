import 'package:dio/dio.dart';
import 'package:ehi_school/base/http/http_callback.dart';
import 'package:ehi_school/base/http/http_config.dart';
import 'package:ehi_school/base/http/http_error.dart';
import 'package:ehi_school/base/http/http_interceptor.dart';
import 'package:ehi_school/base/http/http_response.dart';

abstract class BaseHttp {
  // 请求标识
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String DELETE = 'DELETE';
  static const String PUT = 'PUT';

  Dio? _dio;

  /// get
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? query,
    Options? options,
    HttpCallBack? callback,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return request(path, GET,
        query: query,
        options: options,
        callback: callback,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }

  /// post
  Future<dynamic> post(String path, dynamic data,
      {Options? options,
      HttpCallBack? callback,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return request(path, POST,
        data: data,
        options: options,
        callback: callback,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }

  /// 上传文件
  Future<dynamic> uploadFile(String uploadUrl, FormData data,
      {Options? options,
      HttpCallBack? callback,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return request(uploadUrl, POST,
        data: data,
        options: Options(
            // 设置请求头
            headers: {
              HttpConfig.HEADER_CONTENT_TYPE: HttpConfig.CONTENT_TYPE_FORM
            },
            // 设置内容类型为“multipart/form-data”
            contentType: HttpConfig.CONTENT_TYPE_FORM),
        callback: callback,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }

  /// 统一请求体
  Future<dynamic> request(
    String path,
    String method, {
    dynamic data,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    HttpCallBack? callback,
    bool isShowProgress = true,
    bool isShowMessage = true,
  }) async {
    callback?.onStart();
    if (isShowProgress) {
      showProgress(true);
    }
    final Response response = await _getDio()
        .request(path,
            data: data,
            queryParameters: query,
            cancelToken: cancelToken,
            options: checkOptions(method, options),
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress)
        .catchError((e) {
      if (e is HttpError) {
        callback?.onError(e);
        if (isShowMessage && e.message.isNotEmpty) {
          showMessage(e.message, false);
        }
      }
    }).whenComplete(() {
      if (isShowProgress) {
        showProgress(false);
      }
      callback?.onComplete();
    });

    if (response.data is Map<String, dynamic>) {
      HttpResponse r = buildResponse(response.data);
      if (isShowMessage && r.message.isNotEmpty) {
        showMessage(r.message, !r.isSuccess);
      }
    }

    callback?.onSuccess(response.data);
    return response.data;
  }

  Options checkOptions(method, options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  /// 获取Dio单例
  Dio _getDio() {
    /// 设计思路：请求拦截器 >> 请求转换器 >> 发起请求 >> 响应转换器 >> 响应拦截器 >> 最终结果
    if (_dio != null) {
      return _dio!;
    }
    final BaseOptions options = BaseOptions(
      baseUrl: getBaseUrl(),
      connectTimeout: HttpConfig.TIME_OUT,
      sendTimeout: HttpConfig.SEND_TIMEOUT,
      receiveTimeout: HttpConfig.RECEIVE_TIMEOUT,
    );
    _dio = Dio(options);
    _addInterceptors(_dio!);

    // /// 自定义 jsonDecodeCallback,
    // /// 这里先不解析json的原因是因为后台返回的浮点数（100.0000解析之后变成100.0），解析成json之后验签没法通过，所以这里先直接返回后台返回的字符串
    // /// 所以这里把json转换放到验签拦截器里面，验签完成之后转成json
    // (_dio!.transformer as DefaultTransformer).jsonDecodeCallback = _trans;
    return _dio!;
  }

  void _addInterceptors(Dio dio) {
    var interceptors = getInterceptors();
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }
    dio.interceptors.add(HttpInterceptor());
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  static String _trans(String text) {
    return text;
  }

  /// 获取BaseUrl
  String getBaseUrl();

  /// 自定义拦截器
  List<Interceptor>? getInterceptors();

  /// 构建响应体
  HttpResponse buildResponse(Map<String, dynamic> map);

  /// 展示进度条
  void showProgress(bool show);

  /// 展示提示文本
  void showMessage(String message, bool isDialog);
}
