import 'package:flutter/material.dart';
import 'package:pstravel/screens/home.dart';
import 'package:pstravel/screens/explanation.dart';
import 'package:pstravel/screens/login.dart';
import 'package:pstravel/screens/planner.dart';
import 'package:pstravel/screens/signup.dart';

class start extends StatefulWidget {
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<start> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 160.0,
            ),
            Center(
              child: Image(
                width: 240.0,
                height: 105.77,
                image: AssetImage(
                  'images/main_logo_.PNG',
                ),
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            ButtonTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minWidth: 260.0,
              height: 53.0,
              child: RaisedButton(
                color: const Color(0xff819395),
                child: Text(
                  'Let\'s start',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minWidth: 260.0,
              height: 53.0,
              child: RaisedButton(
                color: const Color(0xffe2aa8b),
                child: Text(
                  'About  P\'s travel',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => explanation()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: new Text(
                    'Login',
                    style: TextStyle(fontSize: 11.0, color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signup()),
                    );
                  },
                  child: new Text(
                    'Sign up',
                    style: TextStyle(fontSize: 11.0, color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
