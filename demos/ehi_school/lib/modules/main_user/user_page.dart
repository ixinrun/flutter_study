import 'package:ehi_school/values/colors.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "个人中心",
            style: TextStyle(color: AppColors.textNormal),
          ),
        ),
      ),
      body: Container(
        child: Text("个人中心"),
      ),
    );
  }
}
