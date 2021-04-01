import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bookhub/screens/start.dart';

class MyGetHttpData extends StatefulWidget {
  @override
  MyGetHttpDataState createState() => MyGetHttpDataState();
}

class Book {
  final List<Document> documents;

  Book({this.documents});

  factory Book.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['documents'] as List;
    print(list.runtimeType);
    List<Document> documentsList =
        list.map((i) => Document.fromJson(i)).toList();

    return Book(documents: documentsList);
  }
}

class Document {
  final String title;
  final String publisher;

  Document({this.title, this.publisher});

  factory Document.fromJson(Map<String, dynamic> parsedJson) {
    return Document(
        title: parsedJson['title'], publisher: parsedJson['publisher']);
  }
}

String title;
String contents;
String authors;
String imgUrl;
final _nameTextEditController = TextEditingController();

class MyGetHttpDataState extends State<MyGetHttpData> {
  //query 기본 값 설정
  String query = 'C언어 콘서트';
  int page = 1;

  List data;

  //GET
  Future<String> getJSONData() async {
    var response = await http.get(
        Uri.parse(
            'https://dapi.kakao.com/v3/search/book?sort=accuracy&target=title&size=50&query= $query &page= $page'),
        headers: {
          "Accept": "application/json",
          'Authorization':
              'KakaoAK ac25f2e92971bd280055f11874b9f955' //카카오 rest api키 입력
        });
    String jsonString = response.body;
    print(jsonString); //결과 출력

    Map<String, dynamic> user = jsonDecode(jsonString); //json 디코딩
    title = user["documents"][0]["title"];
    contents = user["documents"][0]["contents"];
    authors = user["documents"][0]["authors"][0];
    imgUrl = user["documents"][0]["thumbnail"];

    print('책 제목: $title');
    print('책 소개: $contents');
    print('저자: $authors');
    print('이미지: $imgUrl');

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      data = dataConvertedToJSON['documents'];
    });

    return "Successfull";
  }

  TextEditingController editingController = TextEditingController();

  @override
  void dispose() {
    _nameTextEditController.dispose();
    super.dispose();
  }

  @override
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
                height: 20.0,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (text) {
                          print(text);
                        },
                        controller: _nameTextEditController,
                        decoration: InputDecoration(
                            labelText: "Search",
                            hintText: "Search",
                            fillColor: Color(0xff607463),
                            focusColor: Color(0xff607463),
                            hoverColor: Color(0xff607463),
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)))),
                      ),
                    ),
                    Center(
                      child: new RaisedButton(
                        child: new Text("GET"),
                        onPressed: getJSONData,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 0.0, top: 0.0),
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Image.network('$imgUrl'),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: 200.0,
                              margin:
                                  const EdgeInsets.only(left: 15.0, top: 0.0),
                              child: Text('책 제목: $title'),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 0.0, top: 18),
                              child: Text('저자: $authors'),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.only(left: 0.0, top: 18),
                      child: Text('책 소개: $contents'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

SharedPreferences prefs;
List<String> list;
// ...
