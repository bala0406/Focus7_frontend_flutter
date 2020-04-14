import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus7/Configurations/styles.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 40),
          child: Align(alignment: Alignment.centerRight, child: SettingsIcon()),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(alignment: Alignment.centerLeft, child: WelcomeUser()),
        ),
        Container(),//notifcations container
        
      ]),
    );
  }
}

class SettingsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings, color: Styles.highlightColor),
      onPressed: () {},
    );
  }
}

//good morning ,good afternoon or good evening wishes to welcome the user
class WelcomeUser extends StatelessWidget {
  final Shader textGradient =
      Styles.primaryGradient.createShader(Rect.fromLTWH(0.0, 0.0, 200, 70));

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Good Morning,",
          style: Styles.headlineWhiteTextStyle
              .copyWith(foreground: Paint()..shader = textGradient),
        ),
        Text(
          "Bala",
          style: Styles.headlineWhiteTextStyle,
        ),
      ],
    );
  }
}
