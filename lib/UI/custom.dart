import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_mobile_app/UI/colors.dart';
import 'package:quiz_mobile_app/UI/global_class.dart';
import 'package:quiz_mobile_app/UI/model_class/question_model_class.dart';

class AnswerCont extends StatelessWidget {
  final String? answer;
  final Color? color;
  final Color? borderClr;
  final Color? shadow;
  final Color? fontClr;
  final GestureTapCallback? onTap;

  const AnswerCont(
      {Key? key,
      this.answer,
      this.color,
      this.onTap,
      this.borderClr,
      this.shadow,
      this.fontClr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: color,
                  boxShadow: [
                    BoxShadow(
                        color: shadow!,
                        spreadRadius: 7,
                        blurRadius: 10,
                        offset: Offset(0, 0))
                  ],
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: borderClr!, width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Text(" "),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      answer!,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: fontClr),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.transparent, width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(" "),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomField extends StatelessWidget {
  FormFieldValidator<String>? validator;
  TextEditingController? controller;
  String? labelText;

  CustomField({this.labelText, this.validator, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: labelText,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(color: MyColors.selectClr),
            ),
            //fillColor: Colors.green
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  VoidCallback? onTap;
  String? title;

  CustomButton({this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: MyColors.selectClr),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              title!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ResultLog extends StatelessWidget {

  Questions? question;


  ResultLog({this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  question!.question!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: question!.myOptionsList!.length,
                    itemBuilder: (c, i) {
                      print("Selected Answer ${question!.selectAnswer}");
                      print("Answer:::: ${question!.answer}");
                      return Column(
                        children: [
                          Text(
                            "${i + 1}.  ${question!.myOptionsList![i]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              color: (question!.selectAnswer == question!.myOptionsList![i]) && question!.selectAnswer == question!.answer? Colors.green:
                              (question!.selectAnswer == question!.myOptionsList![i]) && question!.selectAnswer != question!.answer?Colors.red: Colors.black
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
