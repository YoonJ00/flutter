import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGetHttpData(),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}

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

class MyGetHttpDataState extends State<MyGetHttpData> {
  //query 기본 값 설정
  String query = 'C언어 콘서트';
  int page = 1;

  List data;

  //GET
  Future<String> getJSONData() async {
    var response = await http.get(
        Uri.parse(
            'https://dapi.kakao.com/v3/search/book?sort=accuracy&target=title&size=50&query=$query &page= $page'),
        headers: {
          "Accept": "application/json",
          'Authorization':
              'KakaoAK ac25f2e92971bd280055f11874b9f955' //카카오 rest api키 입력
        });
    String jsonString = response.body;
    print(jsonString); //결과 출력

    Map<String, dynamic> user = jsonDecode(jsonString);
    title = user["documents"][0]["title"];
    contents = user["documents"][0]["contents"];
    authors = user["documents"][0]["authors"][0];

    print('책 제목: $title');
    print('책 소개: $contents');
    print('저자: $authors');

    setState(() {
      var dataConvertedToJSON = json.decode(response.body); //json 디코딩
      data = dataConvertedToJSON['documents'];
    });

    return "Successfull";
  }

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widgettitle'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {},
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Center(
              child: new RaisedButton(
                child: new Text("GET"),
                onPressed: getJSONData,
              ),
            ),
            Text('책 제목: $title'),
            SizedBox(
              height: 20,
            ),
            Text('저자: $authors'),
            SizedBox(
              height: 20,
            ),
            Text('책 소개: $contents'),
          ],
        ),
      ),
    );
  }
}

SharedPreferences prefs;
List<String> list;
// ...
