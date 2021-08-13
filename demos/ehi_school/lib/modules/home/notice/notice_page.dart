import 'package:ehi_school/base/http/http_callback.dart';
import 'package:ehi_school/common/entitys/category_entity.dart';
import 'package:ehi_school/common/utils/screen_util.dart';
import 'package:ehi_school/http/http.dart';
import 'package:ehi_school/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  EasyRefreshController? _refreshController; // EasyRefresh控制器
  List<CategoryEntity>? _categories; // 分类

  int? _categoryId;

  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
    _loadCategories();
  }

  _loadCategories() async {
    _categories = [];
    // _categoryId = _categories?.first?.id;
    var response = await Http().post('/app/update', null,
        callback: HttpCallBack(
          start: () {
            print("++++++++++++++++++1");
          },
          success: (dynamic) {
            print("++++++++++++++++++2");
          },
          error: (e) {
            print("++++++++++++++++++3");
          },
          complete: () {
            print("++++++++++++++++++4");
          },
        ));
  }

  /// search_bar
  PreferredSize _searchBar() {
    return PreferredSize(
        child: Row(
          children: [
            Image.asset(
              "assets/images/ehi_school_logo.png",
              fit: BoxFit.fitWidth,
            ),
            InkWell(
              child: Container(
                height: setHeight(30),
                decoration: BoxDecoration(
                    color: AppColors.textFieldBg,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/searchbar_search_ic.png",
                      fit: BoxFit.fitWidth,
                    ),
                    Text(
                      "热点学习内容",
                      style: TextStyle(
                        color: AppColors.textGray,
                        fontSize: setFontSize(14),
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
        preferredSize: Size.fromHeight(kToolbarHeight + 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchBar(),
    );
  }
}
