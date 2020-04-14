import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:focus7/Configurations/styles.dart';

class WelcomeUser extends StatelessWidget {
  final Shader textGradient = Styles.primaryGradient.createShader(Rect.fromLTWH(0.0, 0.0, 200, 70));

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Good Morning,",
          style: Styles.headlineWhiteTextStyle.copyWith(foreground: Paint()..shader = textGradient),
        ),
        Text(
          "Bala",
          style: Styles.headlineWhiteTextStyle,
        ),
      ],
    );
  }
}
