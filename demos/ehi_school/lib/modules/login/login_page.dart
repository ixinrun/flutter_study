import 'package:ehi_school/common/utils/screen_util.dart';
import 'package:ehi_school/res/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
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
          Text(
            "ehi school",
            style: TextStyle(
              fontSize: setFontSize(10),
              color: AppColors.textNormal,
            ),
          )
        ],
      ),
    );
  }

  /// 编辑框
  Widget inputEditText({
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
    String hint = "",
    bool isPassword = false,
    double marginTop = 0,
  }) {
    return Container(
      height: setHeight(44),
      margin: EdgeInsets.only(top: setHeight(marginTop)),
      decoration: BoxDecoration(
          color: AppColors.textFieldBg,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: TextField(
        autofocus: false,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          border: InputBorder.none,
        ),
        style: TextStyle(
            color: AppColors.textNormal,
            fontFamily: "Avenir",
            fontWeight: FontWeight.w400,
            fontSize: setFontSize(16)),
        maxLines: 1,
        autocorrect: false,
        // 自动纠正
        obscureText: isPassword, // 隐藏输入内容
      ),
    );
  }

  /// 表单
  Widget _buildLoginForm() {
    return Container(
      width: setWidth(296),
      margin: EdgeInsets.only(top: setHeight(50)),
      child: Column(
        children: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
