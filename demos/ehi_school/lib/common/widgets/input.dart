import 'package:ehi_school/values/colors.dart';
import 'package:flutter/material.dart';

/// 编辑框
Widget textFieldWrap({
  required TextEditingController controller,
  TextInputType inputType = TextInputType.text,
  String hint = "",
  double fontSize = 15,
  bool isPassword = false,
  bool autofocus = false,
  int maxLines = 1,
  int minLines = 1,
  Color background = AppColors.textFieldBg,
  double radius = 10,
  EdgeInsetsGeometry? margin,
  double? width,
  double? height,
}) {
  return Container(
    width: width,
    height: height,
    margin: margin,
    decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    child: TextField(
      autofocus: autofocus,
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
          fontSize: fontSize),
      maxLines: maxLines,
      minLines: minLines,
      autocorrect: false,
      obscureText: isPassword, // 隐藏输入内容
    ),
  );
}
