import 'package:ehi_school/common/utils/screen_util.dart';
import 'package:ehi_school/modules/home/notice/notice_page.dart';
import 'package:ehi_school/modules/home/study/study_page.dart';
import 'package:ehi_school/modules/home/user/user_page.dart';
import 'package:ehi_school/values/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/main_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
