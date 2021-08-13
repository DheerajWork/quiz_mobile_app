import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_mobile_app/UI/colors.dart';
import 'package:quiz_mobile_app/UI/custom.dart';
import 'package:quiz_mobile_app/UI/global_class.dart';
import 'package:quiz_mobile_app/UI/model_class/register_model_class.dart';
import 'package:quiz_mobile_app/UI/screens/Question%20Screen.dart';
import 'package:quiz_mobile_app/UI/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences? pref;

  getLogin() async{
    http.Response response = await http.post(Uri.parse("http://quiz.quiz99.online/api/userlogin"),body: {
      "email": email.text,
      "password": password.text
    });

    var loginData = jsonDecode(response.body);

    if(loginData['status'] == 200){
      Global.userDetails = UserDetails.fromJson(loginData['data']);
      pref!.setString("UserDetail", jsonEncode(loginData['data']).toString());
      print("asdkflja;sdflkjas;dflkj");
      Navigator.push(context, MaterialPageRoute(builder: (c)=>QuestionScreen()));
      Fluttertoast.showToast(msg: loginData['message']);
    } else{
      print("${loginData['message']}");
      Fluttertoast.showToast(msg: loginData['message']);
    }

  }

  getPref ()async{
    pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.selectClr,
        title: Text(MyStrings.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomField(
                validator: (email){
                  if (email!.length == 0) {
                    return 'Enter email!';
                  } else if ( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
                controller: email,
                labelText: MyStrings.email,
              ),
              CustomField(
                validator: (pass){
                  if (pass!.length <=6 ) {
                    return 'Enter Strong Password!';
                  }
                  return null;
                },
                controller: password,
                labelText: MyStrings.password,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                title: MyStrings.login,
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    print("Validation Successfully");
                    getLogin();
                    CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
