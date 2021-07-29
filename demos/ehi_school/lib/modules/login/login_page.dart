import 'package:ehi_school/common/config/global.dart';
import 'package:ehi_school/common/utils/screen_util.dart';
import 'package:ehi_school/common/utils/validator.dart';
import 'package:ehi_school/common/widgets/toast.dart';
import 'package:ehi_school/res/colors.dart';
import 'package:ehi_school/res/styles.dart';
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

  /// 编辑框
  Widget _inputEditText({
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

  /// 登录按钮
  Widget _buildStartBtn() {
    return Container(
      width: setWidth(296),
      height: setHeight(40),
      margin: EdgeInsets.only(top: setHeight(20)),
      child: TextButton(
        child: Text(
          "登录",
          style: TextStyle(
            color: Colors.white,
            fontSize: setFontSize(16),
            fontFamily: "Montserrat",
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          foregroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
        ),
        onPressed: _handlerLogin,
      ),
    );
  }

  /// 登录验证逻辑
  _handlerLogin() async {
    if (!miniStringLength(_oprNoCtl.value.text, 1)) {
      toast("请正确输入工号");
      return;
    }
    if (!miniStringLength(_passwordCtl.value.text, 1)) {
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
          _inputEditText(
            controller: _oprNoCtl,
            inputType: TextInputType.number,
            hint: "请输入工号",
          ),
          _inputEditText(
            controller: _passwordCtl,
            inputType: TextInputType.visiblePassword,
            hint: "请输入密码",
            isPassword: true,
            marginTop: 15,
          ),
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
