import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double num1 = 0;
  double num2 = 0;
  String ans = '0';
  String output = "00";
  String operator = "";
  bool col = false;

  void pressed(data) {
    if (data == "clear") {
      num1 = 0;
      num2 = 0;
      output = "0";
      ans = "0";
      operator = "";
    } else if (data == "+" || data == "-" || data == "*" || data == "/") {
      num1 = double.parse(output);
      operator = data;
      ans = "0";
    } else if (data == ".") {
      if (ans.contains(".")) {
        print("already contain");
        return;
      }
      ans = output + data;
      operator = ".";
    } else if (operator == ".") {
      ans = output + data;
    } else if (data == "0" || data == "00") {
      ans = ans + data;
    } else if (data == "=") {
      num2 = double.parse(output);
      if (operator == "+") {
        ans = (num1 + num2).toString();
      }
      if (operator == "-") {
        ans = (num1 + num2).toString();
      }
      if (operator == "-") {
        ans = (num1 + num2).toString();
      }
      if (operator == "-") {
        ans = (num1 + num2).toString();
      }
      if (operator == "-") {
        ans = (num1 - num2).toString();
      }
      if (operator == "*") {
        ans = (num1 * num2).toString();
      }
      if (operator == "/") {
        ans = (num1 / num2).toString();
      }
    } else {
            if (ans!="0"){  ans += data;}
            else
              ans=data;
    }

    setState(() {
      output = ans;
    });
  }

  Widget Button(buttondata, Color color) {
    return Expanded(
      child: RaisedButton(
        highlightColor: Colors.pink[100],
        color: color,
        highlightElevation: 5,
        elevation: 15,

        padding: EdgeInsets.all(20),
        onPressed: () {
          pressed(buttondata);
          print(buttondata);
        },
        child: Text(
          buttondata,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     // decoration:
       //   BoxDecoration(gradient: LinearGradient(colors: [Colors.cyan[700],
         //   Colors.teal,
          //])),
     // margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(20),
            child: Text(
              output,
              style: TextStyle(fontSize: 35,color: Colors.black),
            ),
          ),
          new Expanded(child: Divider()),
          Row(
            children: <Widget>[
              Button("7", Colors.black),
              Button("8", Colors.black),
              Button("9", Colors.black),
              Button("/", Colors.grey),
            ],
          ),
          Row(
            children: <Widget>[
              Button("4", Colors.black),
              Button("5", Colors.black),
              Button("6", Colors.black),
              Button("*", Colors.grey),
            ],
          ),
          Row(
            children: <Widget>[
              Button("1", Colors.black),
              Button("2", Colors.black),
              Button("3", Colors.black),
              Button("-", Colors.grey),
            ],
          ),
          Row(
            children: <Widget>[
              Button(".", Colors.black),
              Button("0", Colors.black),
              Button("00", Colors.black),
              Button("+", Colors.grey),
            ],
          ),
          Row(
            children: <Widget>[
              Button("clear", Colors.grey),
              Button("=", Colors.grey)
            ],
          )
        ],
      ),
    );
  }
}
