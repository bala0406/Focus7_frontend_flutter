////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
////////////////////////////////////////////////////////////////////
import 'package:focus7/Configurations/styles.dart';
import 'package:focus7/Models/question_model.dart';
import 'package:focus7/Screens/Test/focus_test_loading.dart';
import 'package:focus7/Screens/Test/question_display.dart';
import 'package:focus7/Services/question.dart';
import 'package:focus7/Widgets/settings.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:loading/loading.dart';
////////////////////////////////////////////////////////////////////

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  QuestionService questionService = QuestionService();
  List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      dragStartBehavior: DragStartBehavior.start,
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 0, top: 40),
          child: Align(alignment: Alignment.centerRight, child: SettingsIcon()),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(alignment: Alignment.centerLeft, child: WelcomeUser()),
        ),
        Container(), //notifcations container

        SizedBox(height: 20), // after heading
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SubjectContainer(
                  subjectName: Text(
                    "Physics",
                    style: Styles.titleWhiteTextStyle,
                  ),
                  image: "Assets/subject_icons/physics_icon.svg",
                  onTap: () {},
                ),
                SizedBox(
                  width: 15,
                ),
                SubjectContainer(
                  subjectName: Text(
                    "Chemistry",
                    style: Styles.titleWhiteTextStyle,
                  ),
                  image: "Assets/subject_icons/chemistry_icon.svg",
                  onTap: () {},
                ),
              ]),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SubjectContainer(
                  subjectName: Text(
                    "Mathematics",
                    style: Styles.titleWhiteTextStyle,
                  ),
                  image: "Assets/subject_icons/mathematics_icon.svg",
                  onTap: () {},
                ),
                SizedBox(
                  width: 15,
                ),
                SubjectContainer(
                  subjectName: Text(
                    "Biology",
                    style: Styles.titleWhiteTextStyle,
                  ),
                  image: "Assets/subject_icons/biology_icon.svg",
                  onTap: () {},
                ),
              ]),
        ),
        SizedBox(height: 15),
        NotificationContainer(
          text: "Focus Test",
          image: "Assets/focus_icon.svg",
          time: "7 minutes",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FocusTestLoading()));
          },
        ),
        SizedBox(height: 15),
        NotificationContainer(
          text: "Full Test",
          image: "Assets/test_icon.svg",
          time: "customizable",
          onTap: () {},
        ),
        SizedBox(height: 20),
      ]),
    );
  }
}

//good morning ,good afternoon or good evening wishes to welcome the user
class WelcomeUser extends StatelessWidget {
  // final Shader textGradient =
  //     Styles.primaryGradient.createShader(Rect.fromLTWH(0.0, 0.0, 200, 70));

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GradientText("Good Morning",
            gradient: LinearGradient(
                colors: Styles.primaryGradient.colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            style: Styles.headlineWhiteTextStyle),
        Text(
          "Bala",
          style: Styles.headlineWhiteTextStyle,
        ),
      ],
    );
  }
}

class SubjectContainer extends StatelessWidget {
  final Text subjectName;
  final String image;
  final Function onTap;

  SubjectContainer({this.subjectName, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Styles.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Styles.highlightColor,
              borderRadius: BorderRadius.circular(20),
              onTap: onTap,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    subjectIcon(),
                    SizedBox(height: 15),
                    subjectName,
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget subjectIcon() {
    return ShaderMask(
        shaderCallback: (Rect bounds) => LinearGradient(
            colors: Styles.primaryGradient.colors,
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            tileMode: TileMode.mirror,
            stops: [0.2, 0.8]).createShader(Rect.fromLTWH(0.0, 0.0, 50, 50)),
        blendMode: BlendMode.srcIn,
        child: SvgPicture.asset(
          image,
          height: 50,
        ));
  }
}

class NotificationContainer extends StatelessWidget {
  final String text;
  final String image;
  final double height;
  final double width;
  final Function onTap;
  final String time;

  const NotificationContainer(
      {this.text, this.image, this.height, this.width, this.onTap, this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Styles.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Styles.highlightColor,
            borderRadius: BorderRadius.circular(20),
            onTap: onTap,
            child: Container(
                height: 100,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              text,
                              style: Styles.titleWhiteTextStyle,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  "Assets/clock.svg",
                                  color: Styles.highlightColor,
                                  height: 26,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  time,
                                  style: Styles.normalHighlightTextStyle,
                                )
                              ],
                            )
                          ],
                        ),
                        Align(
                            alignment: Alignment.centerRight, child: testIcon())
                      ]),
                )),
          ),
        ),
      ),
    );
  }

  Widget testIcon() {
    return ShaderMask(
        shaderCallback: (Rect bounds) => LinearGradient(
            colors: Styles.primaryGradient.colors,
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            tileMode: TileMode.mirror,
            stops: [0.2, 0.8]).createShader(Rect.fromLTWH(0.0, 0.0, 35, 35)),
        blendMode: BlendMode.srcATop,
        child: SvgPicture.asset(
          image,
          height: 35,
        ));
  }
}
