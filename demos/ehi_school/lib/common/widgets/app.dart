import 'package:ehi_school/values/colors.dart';
import 'package:flutter/material.dart';

Widget titlebar({
  String? title,
  Widget? leading,
  List<Widget>? actions,
  Color background = AppColors.titlebarBg,
}) {
  return AppBar(
    backgroundColor: background,
    elevation: 0,
    title: title != null
        ? Center(
            child: Text(
              title,
              style: TextStyle(),
            ),
          )
        : null,
  );
}
