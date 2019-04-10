import 'dart:math';

import 'package:flutter/material.dart';

class Advance extends StatefulWidget {
  @override
  _AdvanceState createState() => _AdvanceState();
}

class _AdvanceState extends State<Advance> {
  String output = "0";
  String ans = "0";
  double num1 = 0;
  double num2 = 0;
  String operator="";
  double f=1;
  void pressed(data){
    if(data=="clear")
      { output = "0";
       ans = "0";
       num1 = 0;
       num2 = 0;
       operator="";
       f=1;
      }
    else if(data=="^"||data=="!"||data=="1/x"||data=="sqrt")
      {
        num1=double.parse(output);
        operator=data;
        ans="0";
      }
    else if(data=="=")
      { if(operator=="!")
        {
          for(int i=1;i<=num1;i++)
            {
              f=i*f;

            }
            ans=f.toString();

        }
       else if(operator=="^")
         {
           num2=double.parse(output);
           ans=(pow(num1,num2)).toString();
         }
        else if(operator=="1/x")
          {
            ans=(1/num1).toString();

          }
        else if(operator=="sqrt")
          {
            ans=sqrt(num1).toString();
          }
      }
      else{ if (ans!="0")
      {  ans += data;}
             else
        ans=data;
    }
    setState(() {
      output=ans;
    });
  }

  Widget button(buttondata,Color color) {
    return Expanded(
      child: RaisedButton(color: color,
        elevation: 5,
        padding: EdgeInsets.all(22),
        onPressed: () {
          pressed(buttondata);
        },
        child: Text(
          buttondata,
          style: TextStyle(fontSize: 20,color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              output,
              style: TextStyle(fontSize: 30,color: Colors.black),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            children: <Widget>[
              button("7",Colors.black),
              button("8",Colors.black),
              button("9",Colors.black),
              button("!",Colors.grey),
            ],
          ),
          Row(
            children: <Widget>[
              button("4",Colors.black),
              button("5",Colors.black),
              button("6",Colors.black),
              button("1/x",Colors.grey),
            ],
          ),
          Row(
            children: <Widget>[
              button("1",Colors.black),
              button("2",Colors.black),
              button("3",Colors.black),
              button("^",Colors.grey),
            ],
          ),
          Row(
            children: <Widget>[
              button("clear",Colors.grey),
              button("sqrt",Colors.grey),
              button("00",Colors.grey),
              button("=",Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
