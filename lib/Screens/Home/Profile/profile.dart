import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus7/Configurations/styles.dart';
import 'package:focus7/Widgets/settings.dart';
import 'package:gradient_text/gradient_text.dart';

class Profile extends StatelessWidget {
  final GradientText level = GradientText(
    "LEVEL",
    gradient: LinearGradient(
        colors: Styles.primaryGradient.colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
    style: Styles.titleWhiteTextStyle,
  );

  final GradientText fpoints = GradientText(
    "FPOINTS",
    gradient: LinearGradient(
        colors: Styles.primaryGradient.colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
    style: Styles.titleWhiteTextStyle,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Align(alignment: Alignment.centerRight, child: SettingsIcon()),
          ),
          SizedBox(height: 30),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.amber,
            backgroundImage: AssetImage("Assets/ninja_image_png.png"),
          ),
          SizedBox(height: 15),
          Text(
            "Bala Ganesh",
            style: Styles.titleWhiteTextStyle,
          ),
          SizedBox(height: 20),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    level,
                    SizedBox(height: 10),
                    Text(
                      "4",
                      style: Styles.titleWhiteTextStyle,
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Styles.primaryColor,
                  thickness: 3,
                ),
                Column(
                  children: <Widget>[
                    fpoints,
                    SizedBox(height: 10),
                    Text(
                      "250",
                      style: Styles.titleWhiteTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          NotificationContainer(
            text: "Test History",
            image: "Assets/test_history_icon.svg",
            onTap: () {},
          ),
          SizedBox(height: 20),
          NotificationContainer(
            text: "Analytics",
            image: "Assets/analytics_icon.svg",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  final String text;
  final String image;

  final Function onTap;

  const NotificationContainer({this.text, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
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
                height: 80,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          text,
                          style: Styles.titleWhiteTextStyle,
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
