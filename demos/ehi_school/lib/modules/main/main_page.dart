import 'package:ehi_school/common/utils/screen_util.dart';
import 'package:ehi_school/modules/main_notice/notice_page.dart';
import 'package:ehi_school/modules/main_study/study_page.dart';
import 'package:ehi_school/modules/main_user/user_page.dart';
import 'package:ehi_school/values/colors.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/main_page";

  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// 页面指针
  int _pageIndex = 0;

  /// 所有页面
  final _pages = [NoticePage(), StudyPage(), UserPage()];

  /// 导航item
  _item(String label, String icon, String activeIcon) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        "assets/images/$icon.png",
        width: setWidth(22),
        height: setHeight(22),
      ),
      activeIcon: Image.asset(
        "assets/images/$activeIcon.png",
        width: setWidth(22),
        height: setHeight(22),
      ),
      label: label,
    );
  }

  /// 更改页面
  void _changePage(int index) {
    if (index != _pageIndex) {
      setState(() {
        _pageIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _item("公告", "main_bottom_notice_unselected",
              "main_bottom_notice_selected"),
          _item("学习", "main_bottom_study_unselected",
              "main_bottom_study_selected"),
          _item(
              "我的", "main_bottom_user_unselected", "main_bottom_user_selected"),
        ],
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changePage(index);
        },
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.textGray,
      ),
    );
  }
}
