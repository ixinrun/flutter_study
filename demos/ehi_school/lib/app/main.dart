import 'package:ehi_school/modules/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EHI SCHOOL',
      home: WelcomePage(),
    );
  }
}
