import 'package:flutter/material.dart';
import 'package:focus7/Configurations/styles.dart';


class TestSummary extends StatelessWidget {

  final int marks;

  TestSummary(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("marks: $marks",style: Styles.headlineWhiteTextStyle,)),
    );
  }
}