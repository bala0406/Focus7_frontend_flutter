import 'package:flutter/material.dart';
import 'package:focus7/Screens/Test/question.dart';
import 'package:focus7/Screens/Test/timer.dart';

class QuestionDisplay extends StatefulWidget {
  @override
  _QuestionDisplayState createState() => _QuestionDisplayState();
}

class _QuestionDisplayState extends State<QuestionDisplay> {
  Widget previousNextButton() {
    return Row(
      children: <Widget>[
        MaterialButton(
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[Timer(), Question(), previousNextButton()],
      )),
    );
  }
}
