import 'package:flutter/material.dart';
import 'package:pstravel/screens/start.dart';
import 'package:pstravel/screens/Basic_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: start(),
      initialRoute: '/',
      routes: {
        '/basic': (BuildContext context) => BasicPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
