

class GlobalConfig {
  /// 是否是release环境
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// 是否是第一次打开
  static bool isFirstOpen = false;
}
