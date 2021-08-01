import 'package:ehi_school/common/utils/screen_util.dart';
import 'package:ehi_school/common/widgets/titlebar.dart';
import 'package:ehi_school/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  /// 用户信息
  Widget _buildUserInfo() {
    return Container(
      height: setHeight(110),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/images/user_info_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: setWidth(64),
            height: setHeight(64),
            margin: EdgeInsets.only(left: setWidth(24), right: setWidth(20)),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/user_avatar_boy_ic.png"),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "黄珍",
                style: TextStyle(
                    fontSize: setFontSize(20),
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(top: setHeight(12)),
                child: Text(
                  "11968",
                  style:
                      TextStyle(fontSize: setFontSize(14), color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: setHeight(10)),
                child: Text(
                  "技术部/移动应用",
                  style:
                      TextStyle(fontSize: setFontSize(14), color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// 内容区
  Widget _buildContent() {
    return GridView(
      padding: EdgeInsets.only(top: setHeight(40)),
      shrinkWrap: true,
      physics: new NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //横轴元素个数
        crossAxisCount: 3,
      ),
      children: [
        _contentItem("浏览历史", "user_history_ic", () {}),
        _contentItem("我的考试", "user_exam_ic", () {}),
      ],
    );
  }

  /// item
  Widget _contentItem(String name, String imgName, Function onTap) {
    return InkWell(
      onTap: onTap(),
      child: Column(
        children: [
          Image.asset(
            "assets/images/$imgName.png",
            width: setWidth(25),
            height: setHeight(25),
          ),
          Container(
            margin: EdgeInsets.only(top: setHeight(5)),
            child: Text(
              name,
              style: TextStyle(
                fontSize: setFontSize(14),
                color: AppColors.textGray,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titlebar(context, "个人中心", backIconVisible: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildUserInfo(),
            _buildContent(),
          ],
        ),
      ),
    );
  }
}
