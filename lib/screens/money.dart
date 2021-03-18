import 'package:flutter/material.dart';
import 'package:pstravel/screens/planner.dart';
import 'package:pstravel/screens/mypage.dart';
import 'package:pstravel/screens/start.dart';

class money extends StatefulWidget {
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<money> {
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: Color(0xffbac9cb),
                ),
                title: Text("home",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      color: Color(0xffbac9cb),
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.book_rounded,
                  size: 25,
                  color: Color(0xffbac9cb),
                ),
                title: Text("guide",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      color: Color(0xffbac9cb),
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.schedule_rounded,
                  size: 25,
                  color: Color(0xffbac9cb),
                ),
                title: Text("planner",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      color: Color(0xffbac9cb),
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.calculate_rounded,
                  size: 25,
                  color: Color(0xff54767a),
                ),
                title: Text("calculation",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      color: Color(0xff54767a),
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                  color: Color(0xffbac9cb),
                ),
                title: Text("mypage",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      color: Color(0xffbac9cb),
                    ),
                    textAlign: TextAlign.left),
              ),
            ]),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => planner()),
                    );
                  },
                  child: new Image(
                    width: 53.0,
                    height: 16.77,
                    image: AssetImage(
                      'images/back.PNG',
                    ),
                  ),
                ),
                SizedBox(
                  width: 390.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => mypage()),
                    );
                  },
                  child: new Image(
                    width: 53.0,
                    height: 16.77,
                    image: AssetImage(
                      'images/next.PNG',
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => start()),
                  );
                },
                child: Image(
                  width: 130.0,
                  height: 40.77,
                  image: AssetImage(
                    'images/sub_logo.PNG',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 250.0,
            ),
            Text("calculation",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "SpoqaHanSansNeo",
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.left),
          ],
        ),
      )),
    );
  }
}
