import 'package:flutter/material.dart';
import 'package:quiz_mobile_app/UI/screens/Question%20Screen.dart';
import 'package:quiz_mobile_app/UI/screens/login_screen.dart';
import 'package:quiz_mobile_app/UI/screens/register_screen.dart';
import 'package:quiz_mobile_app/UI/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Splashscreen(),
    );
  }
}


class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {

  int? radioGroup = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: List.generate(4, (index) => MyRadioList(
          value: index,
          groupVal: radioGroup,
          color: radioGroup == index ?Colors.green:Colors.transparent,
          onChanged: (val){
            radioGroup = index;
            setState(() {

            });
          },
        ))
      ),
    );
  }
}



// ignore: must_be_immutable
class MyRadioList extends StatelessWidget {

  int? value;
  var onChanged;
  int? groupVal;
  Color? color;

  MyRadioList({this.value,this.onChanged,this.groupVal,this.color});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: RadioListTile(
          value: value!, groupValue: groupVal, onChanged: onChanged),
    );
  }
}


