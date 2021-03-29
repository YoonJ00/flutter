import 'package:flutter/material.dart';
import 'package:bookhub/screens/start.dart';

class books extends StatefulWidget {
  _BookState createState() => _BookState();
}

class _BookState extends State<books> {
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
                    width: 50.0,
                    height: 13.77,
                    image: AssetImage(
                      'images/back.png',
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Image(
                width: 180.0,
                height: 55.77,
                image: AssetImage(
                  'images/sub_logo.PNG',
                ),
              ),
            ),
            SizedBox(
              height: 27.0,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                      width: 380,
                      height: 520,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: const Color(0x14000000))),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Books",
                        style: const TextStyle(
                            color: const Color(0xff373737),
                            fontWeight: FontWeight.w500,
                            fontFamily: "HCRBatang",
                            fontStyle: FontStyle.normal,
                            fontSize: 15.0),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            SizedBox(
                              width: 51.0,
                            ),
                            Image(
                              width: 140.0,
                              height: 180.77,
                              image: AssetImage(
                                'images/addBook.PNG',
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Image(
                              width: 140.0,
                              height: 180.77,
                              image: AssetImage(
                                'images/booktest.png',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 51.0,
                            ),
                            Image(
                              width: 140.0,
                              height: 180.77,
                              image: AssetImage(
                                'images/booktest1.png',
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Image(
                              width: 140.0,
                              height: 180.77,
                              image: AssetImage(
                                'images/booktest2.png',
                              ),
                            ),
                          ],
                        )
                      ],
                    )
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
