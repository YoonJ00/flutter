import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bookhub/screens/books.dart';
import 'package:bookhub/screens/record.dart';
import 'package:bookhub/screens/start.dart';
import 'package:bookhub/Bar_chart.dart';
import 'package:bookhub/Dropdown.dart';
import 'package:bookhub/Input_State.dart';

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  File imageFile;
  String imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}

class book_detail extends StatefulWidget {
  @override
  _SingleImageUploadState createState() {
    return _SingleImageUploadState();
  }
}

class _SingleImageUploadState extends State<book_detail> {
  List<Object> images = List<Object>();
  Future<File> _imageFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
    });
  }

  //전체적인 위젯
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
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
                      MaterialPageRoute(builder: (context) => books()),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => start()),
                );
              },
              child: Center(
                child: Image(
                  width: 180.0,
                  height: 55.77,
                  image: AssetImage(
                    'images/sub_logo.PNG',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                      width: 380,
                      height: 538,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: const Color(0x14000000))),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35.0, top: 18),
                  child: Text(
                    "Book Detail",
                    style: const TextStyle(
                        color: const Color(0xff373737),
                        fontWeight: FontWeight.w500,
                        fontFamily: "HCRBatang",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0),
                    textAlign: TextAlign.left,
                  ),
                ),
                //책 이미지 넣는 곳
                Container(
                  margin: const EdgeInsets.only(left: 40.0, top: 50),
                  child: Text(
                    "C언어 콘서트",
                    style: const TextStyle(
                        color: const Color(0xff373737),
                        fontWeight: FontWeight.w600,
                        fontFamily: "HCRBatang",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40.0, top: 75),
                  child: Text(
                    "천인국 교수님",
                    style: const TextStyle(
                        color: const Color(0xff373737),
                        fontWeight: FontWeight.w500,
                        fontFamily: "HCRBatang",
                        fontStyle: FontStyle.normal,
                        fontSize: 10.0),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 40.0, top: 98),
                    width: 168,
                    height: 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: const Color(0xFF1B311E))),
                //그래프 넣을 곳!!!!!!!!
                Container(
                  //margin: const EdgeInsets.only(top: 180),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 40, right: 30, top: 180),
                            height: 100,
                            width: 150,
                            child: InputSample(),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 131),
                            height: 150,
                            width: 150,
                            child: DropDown(),
                          ),
                        ],
                      ),
                      Container(
                        //margin: const EdgeInsets.only(top: 80),
                        height: 250,
                        width: 350,
                        child: BarChartSample2(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => XD_diary_record(),
              ),
            );
          },
          backgroundColor: const Color(0xFFECA549),
          child: Icon(
            Icons.add,
            size: 25,
          ),
        ),
      ),
    );
  }
}
