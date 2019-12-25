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
    fit: BoxFit.contain,
    alignment: Alignment(1, -.35),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Username",
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              child: TextFormField(
                decoration: InputDecoration(
                  
                    hintText: "Password",
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
      alignment: Alignment(0.7, 1),
      child: FlatButton(
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
      body: SafeArea(
        child: Stack(
          // fit: StackFit.expand,
          children: <Widget>[
            bgimage,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    logoimage,
                  ],
                ),
                Column(children: <Widget>[
                  userName(),
                  SizedBox(
                    height: 10,
                  ),
                  password(),
                ]),
                Container(child: forgotPassword()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    loginButton(),
                    SizedBox(
                      height: 20,
                    ),
                    googleSignIn(),
                    signUp()
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
