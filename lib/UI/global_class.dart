import 'dart:convert';
import 'package:quiz_mobile_app/UI/model_class/question_model_class.dart';
import 'package:quiz_mobile_app/UI/model_class/register_model_class.dart';
import 'package:http/http.dart' as http;

class Global{

  static List<String>? resultValue = [];

  static UserDetails userDetails = UserDetails();
  static List<Questions> questions = [];


  static getQuestion() async {
    List<Questions> questionsList = [];
    http.Response response = await http.get(Uri.parse("http://quiz.quiz99.online/api/Quizquestion"));
    var questionData = jsonDecode(response.body);
    print("questionData $questionData");
    var getData = questionData['data'] as List;
    questionsList = getData.map((e) => Questions.fromJson(e)).toList();
    print(jsonEncode(questionsList));
    return questionsList;
  }
}