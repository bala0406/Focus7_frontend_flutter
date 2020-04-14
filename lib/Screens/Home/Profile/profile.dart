import 'package:flutter/material.dart';
import 'package:focus7/Configurations/styles.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Profile",
        style: Styles.headlineWhiteTextStyle,
      )),
    );
  }
}
