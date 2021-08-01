import 'package:ehi_school/app/init.dart';
import 'package:ehi_school/app/routes.dart';
import 'package:ehi_school/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  debugPaintSizeEnabled = false;
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //填入设计稿中设备的屏幕尺寸,单位dp
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: true,
        title: '一嗨学院',
        routes: staticRoutes,
        home: HomePage(),
      ),
    );
  }
}
