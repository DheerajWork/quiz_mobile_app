import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_mobile_app/UI/colors.dart';
import 'package:quiz_mobile_app/UI/custom.dart';
import 'package:quiz_mobile_app/UI/global_class.dart';
import 'package:quiz_mobile_app/UI/screens/result_screen.dart';
import 'package:quiz_mobile_app/UI/strings.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  PageController controller = PageController();

  getOptionsList() async {
    Global.questions = await Global.getQuestion();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOptionsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyStrings.englishFor),
        backgroundColor: MyColors.selectClr,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: PageView.builder(
                itemCount: Global.questions.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "${Global.questions[index].question}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              Global.questions[index].myOptionsList!.length,
                          itemBuilder: (c, i) {
                            return Column(
                              children: [
                                AnswerCont(
                                  onTap: () {
                                    Global.questions[index].selectAnswer =
                                        Global.questions[index].myOptionsList![i];
                                    print("${Global.questions[index].selectAnswer}");
                                    if(Global.questions[index].selectAnswer == Global.questions[index].answer){
                                      print(true);
                                    } else{
                                      print(false);
                                    }
                                    setState(() {});
                                  },
                                  color: Global.questions[index].selectAnswer ==
                                          Global
                                              .questions[index].myOptionsList![i]
                                      ? MyColors.selectClr
                                      : Colors.white,
                                  shadow: Global.questions[index].selectAnswer ==
                                          Global
                                              .questions[index].myOptionsList![i]
                                      ? Colors.black.withOpacity(0.2)
                                      : Colors.transparent,
                                  fontClr: Global.questions[index].selectAnswer ==
                                          Global
                                              .questions[index].myOptionsList![i]
                                      ? Colors.white
                                      : Colors.black,
                                  borderClr:
                                      Global.questions[index].selectAnswer ==
                                              Global.questions[index]
                                                  .myOptionsList![i]
                                          ? Colors.white
                                          : Colors.black,
                                  answer:
                                      Global.questions[index].myOptionsList![i],
                                )
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          title: "Next",
                          onTap: (){
                            if(Global.questions[index].selectAnswer != null){
                              controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOutCirc);
                              if(index+1 == Global.questions.length){
                                Navigator.push(context, MaterialPageRoute(builder: (c)=> ResultScreen()));
                              }
                              print("Next Question");
                            } else{
                              Fluttertoast.showToast(msg: "Select one option");
                              print("Select one option");
                            }
                          },
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
