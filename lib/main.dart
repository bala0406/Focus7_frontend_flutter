////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
////////////////////////////////////////////////////////////////////
import 'package:focus7/Configurations/styles.dart';
import 'package:focus7/Screens/Authentication/sign_in.dart';
import 'package:focus7/Screens/Home/home.dart';
import 'package:focus7/Screens/Home/home1.dart';
import 'package:focus7/Screens/Test/question_display.dart';
import 'package:focus7/demo.dart';
import 'package:focus7/demo2.dart';
////////////////////////////////////////////////////////////////////

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Home(),
        theme: ThemeData(
            fontFamily: "Roboto regular",
            scaffoldBackgroundColor: Styles.backgroundColor,
            textTheme: TextTheme(
                display1: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Styles.primaryWhite),
                display2: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Styles.primaryWhite),
                body1: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Styles.primaryColor),
                body2: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Styles.primaryColor))));
  }
}
