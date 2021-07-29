import 'package:ehi_school/common/config/global.dart';
import 'package:flutter/material.dart';

/// 应用程序启动初始化操作
void init() async {
  // 运行初始
  WidgetsFlutterBinding.ensureInitialized();

  // 全局配置初始化
  Global.init();
}
