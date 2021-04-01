import 'package:bookhub/screens/book_detail.dart';
import 'package:bookhub/screens/start.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class XD_diary_record extends StatefulWidget {
  @override
  SecondRoute createState() => SecondRoute();
}

//일지기록화면
class SecondRoute extends State<XD_diary_record> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)))),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController;
  List<Healthy> list = new List<Healthy>();
  int length = 15;
  SharedPreferences sharedPreferences;

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 35.0,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => book_detail()),
                    );
                  },
                  child: Icon(
                    Icons.navigate_before,
                  ),
                ),
                SizedBox(
                  width: 338.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => XD_diary_record()),
                    );
                  },
                  child: Icon(
                    Icons.update,
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
            Container(
              margin: const EdgeInsets.only(left: 20.0, top: 18),
              child: Row(
                children: [
                  Text(
                    "Record",
                    style: const TextStyle(
                        color: const Color(0xff373737),
                        fontWeight: FontWeight.w500,
                        fontFamily: "HCRBatang",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 100,
              width: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: const Color(0x14000000)),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(formattedDate,
                      style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontFamily: "SpoqaHanSansNeo",
                          fontStyle: FontStyle.normal,
                          fontSize: 25.0),
                      textAlign: TextAlign.left),
                  SizedBox(
                    width: 150.0,
                  ),
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minWidth: 30.0,
                    height: 45.0,
                    child: RaisedButton(
                      color: const Color(0xFF9BAE9E),
                      elevation: 0,
                      onPressed: () => goToNewItemView(),
                      child: Text("+",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: "SpoqaHanSansNeo",
                              fontStyle: FontStyle.normal,
                              fontSize: 28.0),
                          textAlign: TextAlign.left),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Flexible(child: buildListView()),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    loadSharedPreferencesAndData();
    super.initState();
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return buildListTile(list[index], index);
      },
    );
  }

  Widget buildListTile(Healthy item, int index) {
    return Card(
        color: const Color(0xFF9BAE9E),
        child: Container(
          child: ListTile(
            title: Column(
              children: <Widget>[
                Text(
                  item.title,
                  key: Key('item-$index'),
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            trailing: FlatButton(
              child: Text(
                "삭제",
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "SpoqaHanSansNeo",
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                setState(() {
                  removeItem(item);
                  loadSharedPreferencesAndData();
                });
              },
            ),
          ),
        ));
  }

  void goToNewItemView() {
    // Here we are pushing the new view into the Navigator stack. By using a
    // MaterialPageRoute we get standard behaviour of a Material app, which will
    // show a back button automatically for each platform on the left top corner
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return NewHealthyView();
    })).then((title) {
      if (title != null) {
        addItem(Healthy(title: title));
      }
    });
  }

  void addItem(Healthy item) {
    // Insert an item into the top of our list, on index zero
    list.insert(0, item);
    saveData();
  }

  void removeItem(Healthy item) {
    list.remove(item);
    saveData();
  }

  void loadData() {
    List<String> listString = sharedPreferences.getStringList('list');
    if (listString != null) {
      list =
          listString.map((item) => Healthy.fromMap(json.decode(item))).toList();
      setState(() {});
    }
  }

  void saveData() {
    List<String> stringList =
        list.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('list', stringList);
  }
}

class Healthy {
  String title;

  Healthy({
    this.title,
  });

  Healthy.fromMap(Map map) : this.title = map['title'];

  Map toMap() {
    return {
      'title': this.title,
    };
  }
}

class NewHealthyView extends StatefulWidget {
  final Healthy item;

  NewHealthyView({this.item});

  @override
  _NewHealthyViewState createState() => _NewHealthyViewState();
}

class _NewHealthyViewState extends State<NewHealthyView> {
  TextEditingController titleController;

  File file;
  void pickImage() async {
    File pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    file = File(pickedFile.path);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    titleController = new TextEditingController(
        text: widget.item != null ? widget.item.title : null);
  }

//일지 쓰기
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: file == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 0.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => book_detail()),
                        );
                      },
                      child: Icon(
                        Icons.navigate_before,
                      ),
                    ),
                    SizedBox(
                      width: 338.0,
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
                  height: 25.0,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      width: 380,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: const Color(0xFF9BAE9E)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 170.0, top: 120),
                      child: Text("Image",
                          style: const TextStyle(
                            color: Color(0xff02171a),
                            fontWeight: FontWeight.bold,
                            fontFamily: "SpoqaHanSansNeo",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 385,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: const Color(0x14000000)),
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    controller: titleController,
                    autofocus: true,
                    onSubmitted: (value) => submit(),
                    decoration: new InputDecoration(
                      hintText: 'Memo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      minWidth: 80.0,
                      height: 40.0,
                      child: RaisedButton(
                        color: const Color(0xFF9BAE9E),
                        elevation: 0,
                        onPressed: () {
                          setState(() {
                            titleController.clear();
                            Navigator.pop(context);
                          });
                        },
                        child: Text("취소",
                            style: const TextStyle(
                              color: Color(0xff02171a),
                              fontWeight: FontWeight.bold,
                              fontFamily: "SpoqaHanSansNeo",
                              fontStyle: FontStyle.normal,
                              fontSize: 13.0,
                            ),
                            textAlign: TextAlign.left),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      minWidth: 80.0,
                      height: 40.0,
                      child: RaisedButton(
                        color: const Color(0xFF9BAE9E),
                        elevation: 0,
                        onPressed: () => submit(),
                        child: Text("저장",
                            style: const TextStyle(
                                color: Color(0xff02171a),
                                fontWeight: FontWeight.bold,
                                fontFamily: "SpoqaHanSansNeo",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                            textAlign: TextAlign.left),
                      ),
                    ),
                  ],
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 05.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => book_detail()),
                        );
                      },
                      child: Icon(
                        Icons.navigate_before,
                      ),
                    ),
                    SizedBox(
                      width: 338.0,
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
                  height: 25.0,
                ),
                Container(
                  width: 300,
                  height: 250,
                  child: Center(child: Image.file(file)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 385,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: const Color(0x14000000)),
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    controller: titleController,
                    autofocus: true,
                    onSubmitted: (value) => submit(),
                    decoration: new InputDecoration(
                      hintText: 'Memo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      minWidth: 80.0,
                      height: 40.0,
                      child: RaisedButton(
                        color: const Color(0xFF9BAE9E),
                        elevation: 0,
                        onPressed: () {
                          setState(() {
                            titleController.clear();
                            Navigator.pop(context);
                          });
                        },
                        child: Text("취소",
                            style: const TextStyle(
                              color: Color(0xff02171a),
                              fontWeight: FontWeight.bold,
                              fontFamily: "SpoqaHanSansNeo",
                              fontStyle: FontStyle.normal,
                              fontSize: 13.0,
                            ),
                            textAlign: TextAlign.left),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      minWidth: 80.0,
                      height: 40.0,
                      child: RaisedButton(
                        color: const Color(0xFF9BAE9E),
                        elevation: 0,
                        onPressed: () => submit(),
                        child: Text("저장",
                            style: const TextStyle(
                                color: Color(0xff02171a),
                                fontWeight: FontWeight.bold,
                                fontFamily: "SpoqaHanSansNeo",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                            textAlign: TextAlign.left),
                      ),
                    ),
                  ],
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        backgroundColor: const Color(0xFFECA549),
        child: Icon(
          Icons.camera_alt,
          size: 25,
        ),
      ),
    );
  }

  void submit() {
    Navigator.of(context).pop(titleController.text);
  }
}
