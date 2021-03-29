import 'package:flutter/material.dart';
import 'package:bookhub/screens/start.dart';

class about extends StatefulWidget {
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<about> {
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
                      'images/back.png',
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
                  'images/main_logo.PNG',
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: 370.0,
              child: Text(
                'Book Hub is ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "SpoqaHanSansNeo",
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
