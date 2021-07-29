import 'package:ehi_school/base/utils/utils.dart';
import 'package:ehi_school/common/config/global.dart';
import 'package:ehi_school/common/utils/utils.dart';
import 'package:ehi_school/common/widgets/widgets.dart';
import 'package:ehi_school/values/values.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "login_page";

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: setHeight(80)),
      child: Column(
        children: [
          Image.asset(
            "assets/images/ehi_school_logo.png",
            fit: BoxFit.fitWidth,
          ),
          Container(
            margin: EdgeInsets.only(top: setHeight(10)),
            child: Text(
              "ehi school",
              style: TextStyles.detailContent,
            ),
          ),
        ],
      ),
    );
  }

  /// 登录按钮
  Widget _buildStartBtn() {
    return buttonWrap(
      "登录",
      onPressed: _handlerLogin,
      width: setWidth(296),
      height: setHeight(40),
      margin: EdgeInsets.only(top: setHeight(20)),
    );
  }

  /// 登录验证逻辑
  _handlerLogin() async {
    if (!Validator.miniStringLength(_oprNoCtl.value.text, 1)) {
      toast("请正确输入工号");
      return;
    }
    if (!Validator.miniStringLength(_passwordCtl.value.text, 1)) {
      toast("请正确输入密码");
      return;
    }
  }

  // 工号输入框控制器
  final TextEditingController _oprNoCtl = TextEditingController();

  // 密码输入框控制器
  final TextEditingController _passwordCtl = TextEditingController();

  /// 表单
  Widget _buildLoginForm() {
    return Container(
      width: setWidth(296),
      margin: EdgeInsets.only(top: setHeight(80)),
      child: Column(
        children: [
          textFieldWrap(
            controller: _oprNoCtl,
            inputType: TextInputType.number,
            hint: "请输入工号",
          ),
          textFieldWrap(
              controller: _passwordCtl,
              inputType: TextInputType.visiblePassword,
              hint: "请输入密码",
              isPassword: true,
              margin: EdgeInsets.only(top: setHeight(15))),
          _buildStartBtn(),
        ],
      ),
    );
  }

  Widget _buildVersionInfo() {
    return Container(
      margin: EdgeInsets.only(bottom: setHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "一嗨学院",
            style: TextStyle(
              fontSize: setFontSize(10),
              color: AppColors.textGray,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "v" + (Global.packageInfo?.version ?? ""),
            style: TextStyle(
              fontSize: setFontSize(10),
              color: AppColors.textGray,
            ),
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildLoginForm(),
            Spacer(),
            _buildVersionInfo()
          ],
        ),
      ),
    );
  }
}
