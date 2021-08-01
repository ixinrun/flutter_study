import 'package:ehi_school/common/utils/screen_util.dart';
import 'package:ehi_school/values/colors.dart';
import 'package:flutter/material.dart';

/// 統一标题栏
PreferredSize titlebar(
  BuildContext context,
  String? title, {
  bool backIconVisible = true,
  Function? backFunc,
  List<Widget>? actions,
  Color background = AppColors.titlebarBg,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + 1),
    child: Column(
      children: [
        AppBar(
          backgroundColor: background,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: backIconVisible ? _leading(context, backFunc) : null,
          centerTitle: true,
          title: title != null
              ? Text(
                  title,
                  style: TextStyle(
                      color: AppColors.titlebarTitle,
                      fontSize: setFontSize(18),
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.normal),
                )
              : null,
        ),
        Divider(
          height: 1,
          color: AppColors.divider,
        ),
      ],
    ),
  );
}

_leading(BuildContext context, Function? backFunc) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: AppColors.titlebarTitle,
    ),
    onPressed: () {
      if (backFunc == null) {
        Navigator.maybePop(context);
      } else {
        backFunc();
      }
    },
  );
}
