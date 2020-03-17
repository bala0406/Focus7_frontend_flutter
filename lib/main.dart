import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focus7/styles.dart';
import 'question_display.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);

    return MaterialApp(
        title: 'Flutter Demo',
        home: QuestionDisplay(),
        theme: ThemeData(
            fontFamily: "Roboto regular",
            primaryColorDark: Styles.primaryLightBlue,
            backgroundColor: Styles.primaryDarkBlue,
            disabledColor: Styles.secondaryBlue,
            splashColor: Styles.secondaryBlue,
            errorColor: Styles.errorRed,
            scaffoldBackgroundColor: Styles.primaryDarkBlue,
            textTheme: TextTheme(
                display1: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Styles.primaryWhite),
                display2: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Styles.primaryWhite),
                body1: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Styles.primaryLightBlue),
                body2: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Styles.primaryLightBlue))
            
            ));
  }
}
