import 'package:dio/src/interceptor.dart';
import 'package:ehi_school/base/http/http_base.dart';
import 'package:ehi_school/base/http/http_response.dart';
import 'package:ehi_school/common/widgets/toast.dart';

class Http extends BaseHttp {
  static Http _instance = Http._internal();

  factory Http() => _instance;

  Http._internal() {}

  @override
  String getBaseUrl() {
    return "https://yapi.ducafecat.tech/mock/11";
  }

  @override
  List<Interceptor>? getInterceptors() {
    return null;
  }

  @override
  void showProgress(bool show) {
    toast(show ? "开始加载" : "加载结束");
  }

  @override
  HttpResponse buildResponse(Map<String, dynamic> map) {
    return HttpResponse(true, "");
  }

  @override
  void showMessage(String message, bool isDialog) {
    toast(message + "----->$isDialog");
  }
}
