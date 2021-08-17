import 'package:flutter/material.dart';
import 'package:quiz_mobile_app/UI/colors.dart';
import 'package:quiz_mobile_app/UI/custom.dart';
import 'package:quiz_mobile_app/UI/global_class.dart';

class ResultLogPage extends StatefulWidget {
  @override
  _ResultLogPageState createState() => _ResultLogPageState();
}

class _ResultLogPageState extends State<ResultLogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.selectClr,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Global.questions.length,
                  itemBuilder: (c,i){
                    return ResultLog(
                      question: Global.questions[i],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
