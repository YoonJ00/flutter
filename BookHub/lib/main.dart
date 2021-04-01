import 'package:flutter/material.dart';
import 'package:bookhub/screens/start.dart';
import 'package:bookhub/screens/record.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: start(),
      debugShowCheckedModeBanner: false,
    );
  }
}
