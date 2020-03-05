import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:gradient_widgets/gradient_widgets.dart' as widgetGradient;
import 'size_config.dart';

class Login extends StatelessWidget {
  //gradient colors
  final Color gradientColor1 = Color.fromRGBO(120, 255, 134, 1);
  final Color gradientColor2 = Color.fromRGBO(4, 216, 203, 1);

  //button colors
  final Color googleSignInButtonColor = Color.fromRGBO(241, 241, 241, 1);

  static final String assetName = "Assets/focus7.svg";
  static final String bgName = "Assets/bg.svg";
  static final String googleIcon = "Assets/google.svg";

  //vector logo focus 7
  Widget logoImage(context) => SvgPicture.asset(
        assetName,
        height: SizeConfiguration.blockSizeVertical * 26,
        // width: SizeConfiguration.blockSizeHorizontal * 25,
      );

  //background vector image
  Widget bgImage(context) => SvgPicture.asset(bgName, fit: BoxFit.contain, alignment: Alignment.center);

  //Google vector image
  Widget googleLogo(context) => SvgPicture.asset(
        googleIcon,
        height: SizeConfiguration.blockSizeVertical * 4,
        // width: SizeConfiguration.blockSizeHorizontal * 4,
      );

  Widget userName(context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment(-0.68, 1),
              child: Text("Username",
                  style: TextStyle(fontSize: SizeConfiguration.safeBlockHorizontal * 4, fontWeight: FontWeight.w500))),
          SizedBox(
            height: SizeConfiguration.safeBlockHorizontal * 1.3,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConfiguration.safeBlockHorizontal * 12),
            child: Form(
              child: TextFormField(
                style: TextStyle(fontSize: SizeConfiguration.safeBlockHorizontal * 3.5),
                decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(fontSize: SizeConfiguration.safeBlockHorizontal * 3.5),
                    filled: true,
                    fillColor: Color.fromRGBO(241, 241, 241, 1),
                    border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10))),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget password(context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment(-0.68, 1),
              child: Text("Password",
                  style: TextStyle(fontSize: SizeConfiguration.safeBlockHorizontal * 4, fontWeight: FontWeight.w500))),
          SizedBox(
            height: SizeConfiguration.safeBlockHorizontal * 1.3,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConfiguration.safeBlockHorizontal * 12),
            child: Form(
              child: TextFormField(
                style: TextStyle(fontSize: SizeConfiguration.safeBlockHorizontal * 3.5),
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(fontSize: SizeConfiguration.safeBlockHorizontal * 3.5),
                    filled: true,
                    fillColor: Color.fromRGBO(241, 241, 241, 1),
                    border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10))),
                obscureText: true,
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget forgotPassword(context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () {},
        child: GradientText(
          "Forgot Password?",
          gradient: LinearGradient(
            colors: [gradientColor1, gradientColor2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          style: TextStyle(fontSize: SizeConfiguration.safeBlockHorizontal * 3.5, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget loginButton(context) {
    return Container(
      child: widgetGradient.GradientButton(
        callback: () {
          //TODO Implement login function
        },
        child: Text(
          "LOGIN",
          style: TextStyle(fontSize: SizeConfiguration.safeBlockHorizontal * 4, fontWeight: FontWeight.w600),
        ),
        gradient: LinearGradient(
            colors: [gradientColor1, gradientColor2], begin: Alignment.topLeft, end: Alignment.bottomRight),
        increaseHeightBy: SizeConfiguration.safeBlockVertical * 3.5,
        increaseWidthBy: SizeConfiguration.safeBlockHorizontal * 12,
        shapeRadius: BorderRadius.circular(10),
        elevation: 10,
        shadowColor: Colors.black45,
      ),
    );
  }

  Widget googleSignIn(context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfiguration.safeBlockHorizontal * 20,
      ),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: SizeConfiguration.safeBlockVertical * 2.3),
        color: googleSignInButtonColor,
        elevation: 0,
        focusElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            googleLogo(context),
            SizedBox(
              width: 10,
            ),
            Text(
              "SIGN IN WITH GOOGLE",
              style: TextStyle(fontSize: SizeConfiguration.safeBlockHorizontal * 3.5, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  Widget signUp(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Don't have an Account?",
              style: TextStyle(fontSize: SizeConfiguration.safeBlockHorizontal * 3.5, fontWeight: FontWeight.w600)),
          Container(
            child: FlatButton(
              padding: EdgeInsets.all(SizeConfiguration.safeBlockHorizontal * 1),
              onPressed: () {},
              child: GradientText(
                "Sign up here",
                gradient: LinearGradient(
                  colors: [gradientColor1, gradientColor2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                style: TextStyle(fontSize: SizeConfiguration.safeBlockHorizontal * 3.5, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfiguration class Initialization
    SizeConfiguration.init(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          // fit: StackFit.expand,
          children: <Widget>[
            bgImage(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logoImage(context),
                userName(context),
                SizedBox(
                  height: SizeConfiguration.safeBlockHorizontal * 3,
                ),
                password(context),
                SizedBox(height: SizeConfiguration.safeBlockHorizontal * 5),
                loginButton(context),
                forgotPassword(context),
                googleSignIn(context),
                signUp(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
