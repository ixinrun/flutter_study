import 'package:flutter/material.dart';
import 'package:flutter_app/home/four_page.dart';
import 'package:flutter_app/home/one_page.dart';
import 'package:flutter_app/home/three_page.dart';
import 'package:flutter_app/home/two_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPage createState() {
    return _IndexPage();
  }
}

class _IndexPage extends State<IndexPage> {
  // 底部导航项
  final List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'one', backgroundColor: Colors.blue),
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'two', backgroundColor: Colors.green),
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'three', backgroundColor: Colors.amber),
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'four', backgroundColor: Colors.red)
  ];

  // 所有页面
  final pages = [OnePage(), TwoPage(), ThreePage(), FourPage()];

  // 当前页指示
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter Demo'),
      ),
      body: pages[currentIndex],
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          _DrawerItem(1, '列表1'),
          _DrawerItem(2, '列表2'),
          _DrawerItem(3, '列表3'),
          _DrawerItem(4, '列表4'),
          _DrawerItem(5, '列表5')
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: navItems,
        currentIndex: currentIndex,
        // shifting or fixed
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          _changePage(index);
        },
      ),
    );
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}

/**
 * 侧边栏item
 */
class _DrawerItem extends StatelessWidget {
  final int id;
  final String name;

  _DrawerItem(this.id, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9)))),
      height: 52,
      child: TextButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(id.toString()), Text(' - '), Text(name)],
        ),
      ),
    );
  }
}
