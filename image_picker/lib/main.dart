import 'package:flutter/material.dart';
import 'package:imagepicker_multiple/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SingleImageUpload(),
      debugShowCheckedModeBanner: false,
    );
  }
}
