import 'package:flutter/material.dart';
import 'package:pstravel/screens/login.dart';
import 'package:pstravel/screens/start.dart';

class signup extends StatefulWidget {
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<signup> {
  Widget build(BuildContext context) {
    return Scaffold(
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
                width: 150.0,
                height: 113.77,
                image: AssetImage(
                  'images/sub_logo.PNG',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 420,
              child: Row(
                children: [
                  Text("SIGN UP",
                      style: const TextStyle(
                          color: const Color(0xff02171a),
                          fontWeight: FontWeight.normal,
                          fontFamily: "SpoqaHanSansNeo",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                      textAlign: TextAlign.left),
                ],
              ),
            ),
            Form(
                child: Theme(
                    data: ThemeData(
                        primaryColor: const Color(0xff7c825f),
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0))),
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(labelText: 'id'),
                            keyboardType: TextInputType.text,
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'password'),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'e-mail'),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 50.0,
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
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => start()),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    )))
          ],
        ),
      )),
    );
  }
}
