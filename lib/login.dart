import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:gradient_widgets/gradient_widgets.dart' as widgetGradient;

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
  final Widget logoimage = SvgPicture.asset(
    assetName,
    height: 200,
    width: 200,
  );

  //background vector image
  final Widget bgimage = SvgPicture.asset(
    bgName,
    alignment: Alignment(0,-.23),
    fit: BoxFit.contain,
  );

  //Google vector image
  final Widget googleLogo = SvgPicture.asset(
    googleIcon,
    height: 25,
    width: 25,
  );

  Widget userName() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment(-0.65, 1),
              child: Text("Username",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(241, 241, 241, 1),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget password() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment(-0.65, 1),
              child: Text("Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(241, 241, 241, 1),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
                obscureText: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Container(
      alignment: Alignment(0.6, 1),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {},
        child: GradientText(
          "Forgot Password?",
          gradient: LinearGradient(
            colors: [gradientColor1, gradientColor2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      child: widgetGradient.GradientButton(
        callback: () {
          //TODO Implement login function
        },
        child: Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        gradient: LinearGradient(
            colors: [gradientColor1, gradientColor2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        increaseHeightBy: 25,
        increaseWidthBy: 50,
        shapeRadius: BorderRadius.circular(10),
        elevation: 10,
        shadowColor: Colors.black45,
      ),
    );
  }

  Widget googleSignIn() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 80,
      ),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 15),
        color: googleSignInButtonColor,
        elevation: 0,
        focusElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            googleLogo,
            SizedBox(
              width: 10,
            ),
            Text(
              "SIGN IN WITH GOOGLE",
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  Widget signUp() {
    return Container(
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Don't have an Account?",
              style: TextStyle(fontWeight: FontWeight.w600)),
          Container(
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              child: GradientText(
                "Sign up here",
                gradient: LinearGradient(
                  colors: [gradientColor1, gradientColor2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          bgimage,
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                SizedBox(height: 100),
                logoimage,
                SizedBox(
                  height: 10,
                ),
                userName(),
                SizedBox(
                  height: 20,
                ),
                password(),
                //NOTE no sized box added as both of their paddings made enough space
                forgotPassword(),
                SizedBox(
                  height: 10,
                ),
                loginButton(),
                SizedBox(
                  height: 20,
                ),
                googleSignIn(),
                SizedBox(
                  height: 10,
                ),
                signUp()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
