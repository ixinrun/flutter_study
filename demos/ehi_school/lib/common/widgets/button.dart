import 'package:ehi_school/values/colors.dart';
import 'package:flutter/material.dart';

/// 按钮包装
Widget buttonWrap(
  String data, {
  required VoidCallback? onPressed,
  double? width,
  double? height,
  double fontSize = 16,
  EdgeInsetsGeometry? margin,
  double radius = 10,
  Color backgroundColor = AppColors.primaryColor,
}) {
  return Container(
    width: width,
    height: height,
    margin: margin,
    child: TextButton(
      child: Text(
        data,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontFamily: "Montserrat",
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        )),
      ),
      onPressed: onPressed,
    ),
  );
}
