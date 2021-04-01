import 'package:flutter/material.dart';
import 'Bar_chart.dart';
import 'Dropdown.dart';

class InputSample extends StatefulWidget {
  @override
  State createState() => InputSampleState();
}

class InputSampleState extends State<InputSample> {
  String inputs = '';

  void getinputs() {
    this.inputs = inputs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Container(
            child: TextField(
              style: TextStyle(fontSize: 10, color: Colors.red),
              textAlign: TextAlign.center,
              // 입력
              decoration:
                  InputDecoration(hintText: '공부한 페이지 수 입력', labelText: '페이지'),
              onChanged: (String str) {
                setState(() => inputs = str);

                var dayName = DropDownState.get_selectedCompany();
                print(dayName);
                switch (dayName) {
                  case 1:
                    BarChartSample1State.one = double.parse(inputs);
                    break;
                  case 2:
                    BarChartSample1State.two = double.parse(inputs);
                    break;
                  case 3:
                    BarChartSample1State.three = double.parse(inputs);
                    break;
                  case 4:
                    BarChartSample1State.four = double.parse(inputs);
                    break;
                  case 5:
                    BarChartSample1State.five = double.parse(inputs);
                    break;
                  case 6:
                    BarChartSample1State.six = double.parse(inputs);
                    break;
                }
              },
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            width: 100,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ));
  }
}
