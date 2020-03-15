import 'package:flutter/material.dart';
import 'package:focus7/styles.dart';
import 'package:focus7/timer.dart';
import 'login.dart';
import 'question_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Timer(),
        theme: ThemeData(
          fontFamily: "Roboto regular",
        ));
  }
}
