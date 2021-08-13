import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_mobile_app/UI/colors.dart';
import 'package:quiz_mobile_app/UI/custom.dart';
import 'package:quiz_mobile_app/UI/global_class.dart';
import 'package:quiz_mobile_app/UI/model_class/register_model_class.dart';
import 'package:quiz_mobile_app/UI/screens/Question%20Screen.dart';
import 'package:quiz_mobile_app/UI/screens/login_screen.dart';
import 'package:quiz_mobile_app/UI/strings.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences? pref;

  getRegister() async{
    http.Response response = await http.post(Uri.parse("http://quiz.quiz99.online/api/user_register"),body: {
      "username": userName.text,
      "email":email.text,
      "phone_no":phone.text,
      "dob":dob.text,
      "password":password.text
    });

    var registerData = jsonDecode(response.body);

    if(registerData['status'] == 200){
      print("111111111");
      Global.userDetails = UserDetails.fromJson(registerData['data']);
      pref!.setString("UserDetail", jsonEncode(registerData['data']).toString());
      Navigator.push(context, MaterialPageRoute(builder: (c)=>QuestionScreen()));
      Fluttertoast.showToast(msg: registerData['message']);
    } else{
      print("111111111");
      print("${registerData['message']}");
      Fluttertoast.showToast(msg: registerData['message']);
    }

  }

  getPref ()async{
    pref = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userName.dispose();
    phone.dispose();
    email.dispose();
    dob.dispose();
    password.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    print("Register Screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.selectClr,
        title: Text(MyStrings.registration),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomField(
                  validator: (name){
                    if(name!.length ==0){
                      return 'Enter User Name';
                    }
                  },
                  controller: userName,
                  labelText: MyStrings.userName,
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
                  validator: (phone){
                    if (phone!.isEmpty) {
                      return 'Enter Phone Number!';
                    } else if(phone.length <=9){
                      return 'Enter 10 Digit Number';
                    }
                  },
                  controller: phone,
                  labelText: MyStrings.phone,
                ),
                CustomField(
                  controller: dob,
                  labelText: MyStrings.dob,
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
                  title: MyStrings.register,
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      print("Validation Successfully");
                      getRegister();
                      CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  title: MyStrings.goToLogin,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
