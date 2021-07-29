import 'package:ehi_school/common/utils/screen_util.dart';
import 'package:ehi_school/values/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  /// 正文标题
  static TextStyle detailTitle = TextStyle(
      color: AppColors.textDark,
      fontSize: setFontSize(20),
      height: 1.5,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w600);

  /// 正文内容
  static TextStyle detailContent = TextStyle(
      color: AppColors.textNormal,
      fontSize: setFontSize(15),
      height: 1.5,
      fontFamily: "Avenir",
      fontWeight: FontWeight.normal);

  /// 列表标题
  static TextStyle itemTitle = TextStyle(
      color: AppColors.textDark,
      fontSize: setFontSize(17),
      height: 1.5,
      fontFamily: "Avenir",
      fontWeight: FontWeight.normal);

  /// 列表内容
  static TextStyle itemContent = TextStyle(
      color: AppColors.textNormal,
      fontSize: setFontSize(14),
      height: 1.5,
      fontFamily: "Avenir",
      fontWeight: FontWeight.normal);

  /// 附加信息
  static TextStyle contentExtra = TextStyle(
      color: AppColors.textGray,
      fontSize: setFontSize(12),
      height: 1.5,
      fontFamily: "Avenir",
      fontWeight: FontWeight.normal);
}
