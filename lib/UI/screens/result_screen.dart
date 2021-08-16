import 'package:flutter/material.dart';
import 'package:quiz_mobile_app/UI/colors.dart';
import 'package:quiz_mobile_app/UI/global_class.dart';

class ResultScreen extends StatefulWidget {
  static String route = "ResultScreen";

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  int correctAnswers = 0;

  @override
  void initState() {
    // TODO: implement initState

    for(int i=0;i<Global.questions.length;i++){
      if(Global.questions[i].selectAnswer==Global.questions[i].answer){
        correctAnswers++;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Result  $correctAnswers/${Global.questions.length}",
                style: TextStyle(
                    color: MyColors.orangeClr,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))
          ],
        ),
      ),
    );
  }
}
