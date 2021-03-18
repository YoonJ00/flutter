import 'package:flutter/material.dart';
import 'package:pstravel/screens/home.dart';
import 'package:pstravel/screens/guide.dart';
import 'package:pstravel/screens/planner.dart';
import 'package:pstravel/screens/money.dart';
import 'package:pstravel/screens/mypage.dart';

class BasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'p\'s travel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Basic(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Basic extends StatefulWidget {
  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  int _currentindex = 0;
  final List<Widget> _screen = [
    home(),
    guide(),
    planner(),
    money(),
    mypage(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentindex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
            selectedFontSize: 10.0,
            selectedItemColor: Color(0xff54767a),
            unselectedFontSize: 10.0,
            unselectedItemColor: Color(0xffbac9cb),
            type: BottomNavigationBarType.fixed,
            elevation: 5.0,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 25,
                ),
                title: Text("home",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.book_rounded,
                  size: 25,
                ),
                title: Text("guide",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.schedule_rounded,
                  size: 25,
                ),
                title: Text("planner",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.calculate_rounded,
                  size: 25,
                ),
                title: Text("calculation",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                ),
                title: Text("mypage",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.left),
              ),
            ]),
      ),
    );
  }
}
