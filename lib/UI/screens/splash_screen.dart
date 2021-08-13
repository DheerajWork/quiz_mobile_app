import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_mobile_app/UI/colors.dart';
import 'package:quiz_mobile_app/UI/global_class.dart';
import 'package:quiz_mobile_app/UI/model_class/register_model_class.dart';
import 'package:quiz_mobile_app/UI/screens/Question%20Screen.dart';
import 'package:quiz_mobile_app/UI/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  SharedPreferences? pref;

  getUserDetails() async {
    pref = await SharedPreferences.getInstance();
    String? a = pref!.getString("UserDetail");
    print(a);
    if (a != null) {
      Global.userDetails = UserDetails.fromJson(jsonDecode(a));
      Navigator.push(context, MaterialPageRoute(builder: (c)=> QuestionScreen()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (c)=> RegisterScreen()));
    }
  }


  startTime() async {
    var _duration = new Duration(seconds: 5);
    Timer(_duration, navigationPage);
  }

  void navigationPage() {
    getUserDetails();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
    print("Splash Screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                  color: MyColors.selectClr,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 170),
              child: LinearProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
