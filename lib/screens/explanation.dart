import 'package:flutter/material.dart';
import 'package:pstravel/screens/home.dart';
import 'package:pstravel/screens/start.dart';
import 'package:pstravel/screens/login.dart';
import 'package:pstravel/screens/planner.dart';
import 'package:pstravel/screens/signup.dart';

class explanation extends StatefulWidget {
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<explanation> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => start()),
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
              ],
            ),
            Center(
              child: Image(
                width: 200.0,
                height: 65.77,
                image: AssetImage(
                  'images/main_logo_.PNG',
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: 370.0,
              child: Text(
                'P\'s Travel is ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "SpoqaHanSansNeo",
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 250.0, top: 320.0),
              child: Image(
                width: 183.0,
                height: 146.77,
                image: AssetImage(
                  'images/visual.PNG',
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
