import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_mobile_app/UI/colors.dart';
import 'package:quiz_mobile_app/UI/custom.dart';
import 'package:quiz_mobile_app/UI/global_class.dart';
import 'package:quiz_mobile_app/UI/strings.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int? select;
  late int counter = 1;
  void _incrementCounter() {
    setState(() {
        if(counter < 12){
          counter++;
          print(counter);
        } else{
          print('Question End');
          Fluttertoast.showToast(msg: "Questions End");
        }
    });
  }
  List<String> options = [
    'a',
    'a',
    'a',
    'a',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.selectClr,
        actions: [
          Row(
            children: [
              Icon(Icons.question_answer),
              SizedBox(
                width: 15,
              )
            ],
          )
        ],
        centerTitle: true,
         title: Text(
           MyStrings.englishFor,
           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
         ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: NetworkImage("https://png.pngtree.com/png-vector/20191021/ourmid/pngtree-speech-sign-text-quiz-time-vector-illustration-png-image_1824077.jpg")
                  )
                ),
              ),
            ),
              Text("Name : ${Global.userDetails.username}")
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            //     Text(
            //       MyStrings.englishFor,
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //     ),
            //     IconButton(onPressed: () {}, icon: Icon(Icons.question_answer)),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Question $counter/12",
                        style:
                            TextStyle(color: MyColors.orangeClr, fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    MyStrings.question,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                      children: List.generate(options.length, (index) {
                    return AnswerCont(
                      onTap: () {
                        select = index;
                        setState(() {});
                      },
                      shadow: select == index? Colors.black.withOpacity(0.2): Colors.transparent,
                      fontClr: select == index? Colors.white: Colors.black,
                      color: select == index
                          ? MyColors.selectClr
                          : Colors.white,
                      answer: 'hii',
                      borderClr: select == index ? Colors.white : Colors.black,
                    );
                  })),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    onTap: (){
                      _incrementCounter();
                    },
                    title: MyStrings.next,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
