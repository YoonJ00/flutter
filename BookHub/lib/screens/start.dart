import 'package:bookhub/screens/about.dart';
import 'package:bookhub/screens/books.dart';
import 'package:bookhub/screens/search.dart';
import 'package:flutter/material.dart';

class start extends StatefulWidget {
  _StartState createState() => _StartState();
}

class _StartState extends State<start> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 125.0,
            ),
            Center(
              child: Image(
                width: 252.0,
                height: 154.0,
                image: AssetImage(
                  'images/main_logo.PNG',
                ),
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            Text("Welcome to BookHub",
                style: const TextStyle(
                    color: const Color(0xff889506),
                    fontWeight: FontWeight.w600,
                    fontFamily: "HCRBatang",
                    fontStyle: FontStyle.normal,
                    fontSize: 10.0),
                textAlign: TextAlign.left),
            SizedBox(
              height: 5.0,
            ),
            Text("Grow by managing books",
                style: const TextStyle(
                    color: const Color(0xff889506),
                    fontWeight: FontWeight.w400,
                    fontFamily: "HCRBatang",
                    fontStyle: FontStyle.normal,
                    fontSize: 10.0),
                textAlign: TextAlign.left),
            SizedBox(
              height: 30.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 120.0,
                    ),
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      minWidth: 83.0,
                      height: 74.0,
                      child: RaisedButton(
                        color: const Color(0xff619168),
                        child: Text(
                          'Books',
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => books()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      minWidth: 83.0,
                      height: 74.0,
                      child: RaisedButton(
                        color: const Color(0xff619168),
                        child: Text(
                          'Search',
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyGetHttpData()),
                          );
                        },
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
                      width: 120.0,
                    ),
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      minWidth: 83.0,
                      height: 74.0,
                      child: RaisedButton(
                        color: const Color(0xff619168),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      minWidth: 83.0,
                      height: 74.0,
                      child: RaisedButton(
                        color: const Color(0xffeca549),
                        child: Text(
                          'About',
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => about()),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
