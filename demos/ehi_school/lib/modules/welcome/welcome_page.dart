import 'package:ehi_school/common/utils/screen_util.dart';
import 'package:ehi_school/common/widgets/button.dart';
import 'package:ehi_school/values/styles.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  /// 标题
  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: setHeight(104)),
      child: Text(
        "一嗨学院",
        textAlign: TextAlign.center,
        style: TextStyles.detailTitle,
      ),
    );
  }

  /// 描述
  Widget _buildDescription() {
    return Container(
      width: setWidth(242),
      margin: EdgeInsets.only(top: setHeight(16)),
      child: Text(
        "一嗨学院旨在帮助一嗨同事通过不断学习，更好的融入一嗨大家庭，不忘初心，服务大众。",
        textAlign: TextAlign.center,
        style: TextStyles.detailContent,
      ),
    );
  }

  /// 说明
  Widget _buildItem(String imgName, String info, double marginTop) {
    return Container(
      width: setWidth(296),
      margin: EdgeInsets.only(top: setHeight(marginTop)),
      child: Row(
        children: [
          Container(
            width: setWidth(80),
            height: setHeight(80),
            child: Image.asset(
              "assets/images/$imgName.png",
              fit: BoxFit.none,
            ),
          ),
          Spacer(),
          Container(
            width: setWidth(200),
            child: Text(
              info,
              textAlign: TextAlign.left,
              style: TextStyles.itemContent,
            ),
          ),
        ],
      ),
    );
  }

  /// 开始按钮
  Widget _buildStartBtn() {
    return buttonWrap(
      "走进学院",
      onPressed: () {},
      width: setWidth(296),
      height: setHeight(40),
      margin: EdgeInsets.only(bottom: setHeight(20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              _buildTitle(),
              _buildDescription(),
              _buildItem("welcome_item", "测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试", 70),
              _buildItem("welcome_item", "测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试", 30),
              _buildItem("welcome_item", "测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试", 30),
              Spacer(),
              _buildStartBtn()
            ],
          ),
        ),
      ),
    );
  }
}
