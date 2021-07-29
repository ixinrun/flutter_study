import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Global {
  /// 包信息
  static PackageInfo? packageInfo;

  /// android设备信息
  static AndroidDeviceInfo? androidDeviceInfo;

  /// ios设备信息
  static IosDeviceInfo? iosDeviceInfo;

  /// 是否是web
  static bool isWeb = Platform.isWindows;

  /// 是否是Ios
  static bool isIos = Platform.isIOS;

  /// 是否是release环境
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// 是否是第一次打开
  static bool isFirstOpen = false;

  /// Global初始化
  static Future init() async {
    // 包信息
    Global.packageInfo = await PackageInfo.fromPlatform();

    // 读取设备信息
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    } else if (Platform.isIOS) {
      Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    }
  }
}
