import 'package:flutter/material.dart';
import 'package:pstravel/screens/guide.dart';
import 'package:pstravel/screens/money.dart';
import 'package:pstravel/screens/start.dart';
import 'dart:core';
import 'dart:ui';
import 'package:table_calendar/table_calendar.dart';

class planner extends StatefulWidget {
  @override
  _HomeCalendarPageState createState() => _HomeCalendarPageState();
}

class _HomeCalendarPageState extends State<planner> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
            selectedFontSize: 10.0,
            selectedItemColor: Color(0xff54767a),
            unselectedFontSize: 10.0,
            unselectedItemColor: Color(0xffbac9cb),
            type: BottomNavigationBarType.fixed,
            elevation: 5.0,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 25,
                  color: Color(0xffbac9cb),
                ),
                title: Text("home",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      color: Color(0xffbac9cb),
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.book_rounded,
                  size: 25,
                  color: Color(0xffbac9cb),
                ),
                title: Text("guide",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      color: Color(0xffbac9cb),
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.schedule_rounded,
                  size: 25,
                  color: Color(0xff54767a),
                ),
                title: Text("planner",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      color: Color(0xff54767a),
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.calculate_rounded,
                  size: 25,
                  color: Color(0xffbac9cb),
                ),
                title: Text("calculation",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      color: Color(0xffbac9cb),
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                  color: Color(0xffbac9cb),
                ),
                title: Text("mypage",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                      color: Color(0xffbac9cb),
                    ),
                    textAlign: TextAlign.left),
              ),
            ]),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => guide()),
                    );
                  },
                  child: new Image(
                    width: 53.0,
                    height: 16.77,
                    image: AssetImage(
                      'images/back.PNG',
                    ),
                  ),
                ),
                SizedBox(
                  width: 390.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => money()),
                    );
                  },
                  child: new Image(
                    width: 53.0,
                    height: 16.77,
                    image: AssetImage(
                      'images/next.PNG',
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => start()),
                  );
                },
                child: Image(
                  width: 130.0,
                  height: 40.77,
                  image: AssetImage(
                    'images/sub_logo.PNG',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 450.0,
                    child: TableCalendar(
                      initialCalendarFormat: CalendarFormat.month,
                      calendarStyle: CalendarStyle(
                          todayColor: Colors.green[800],
                          selectedColor: Theme.of(context).primaryColor,
                          todayStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.white)),
                      headerStyle: HeaderStyle(
                        centerHeaderTitle: true,
                        formatButtonDecoration: BoxDecoration(
                          color: const Color(0xff79AAB1),
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        formatButtonTextStyle: TextStyle(color: Colors.white),
                        formatButtonShowsNext: false,
                      ),
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      builders: CalendarBuilders(
                        selectedDayBuilder: (context, date, events) =>
                            Container(
                                margin: const EdgeInsets.all(3.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE1BF12),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: FlatButton(
                                    child: Text(
                                      date.day.toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {})),
                        todayDayBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(3.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      calendarController: _controller,
                    ),
                  )
                ]),
            SizedBox(
              height: 10.0,
            ),
            Stack(
              children: <Widget>[
                Container(
                    width: 370,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: const Color(0x29424248))),
                Container(
                  margin: EdgeInsets.only(left: 165.0, top: 40.0),
                  child: Text("Plans",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "SpoqaHanSansNeo",
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
