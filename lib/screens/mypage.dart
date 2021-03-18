import 'package:flutter/material.dart';
import 'package:pstravel/screens/money.dart';
import 'package:pstravel/screens/home.dart';
import 'package:pstravel/screens/start.dart';

class mypage extends StatefulWidget {
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<mypage> {
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
            selectedFontSize: 10.0,
            unselectedFontSize: 10.0,
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
                  color: Color(0xffbac9cb),
                ),
                title: Text("calculation",
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
                  Icons.person,
                  size: 25,
                  color: Color(0xff54767a),
                ),
                title: Text("mypage",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      color: Color(0xff54767a),
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
                      MaterialPageRoute(builder: (context) => money()),
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
                      MaterialPageRoute(builder: (context) => home()),
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
              height: 40.0,
            ),
            Center(
              child: Image(
                width: 70,
                height: 70,
                image: AssetImage(
                  'images/user.PNG',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: const Color(0x29424248)),
              child: (Center(
                child: Text("YoonJ00",
                    style: const TextStyle(
                        color: const Color(0xff02171a),
                        fontWeight: FontWeight.bold,
                        fontFamily: "SpoqaHanSansNeo",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.left),
              )),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 75.0,
                    ),
                    Image(
                      width: 170.0,
                      height: 170.0,
                      image: AssetImage(
                        'images/uploadimg1.png',
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Image(
                      width: 170.0,
                      height: 170.0,
                      image: AssetImage(
                        'images/uploadimg2.PNG',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 73.0,
                    ),
                    Image(
                      width: 172.0,
                      height: 172.0,
                      image: AssetImage(
                        'images/uploadimg3.png',
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Image(
                      width: 170.0,
                      height: 170.0,
                      image: AssetImage(
                        'images/uploadimg4.PNG',
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
