import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus7/Configurations/styles.dart';
import 'package:focus7/Services/auth.dart';
import 'package:gradient_text/gradient_text.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  final Widget logoImage = SvgPicture.asset(
    "Assets/focus7.svg",
    height: 180,
    // width: SizeConfiguration.blockSizeHorizontal * 25,
  );

  final Widget googleLogo = SvgPicture.asset(
    "Assets/google.svg",
    height: 25,
    // width: SizeConfiguration.blockSizeHorizontal * 4,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            behavior: HitTestBehavior.opaque,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  logoImage,
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                        child: TextFormField(
                      style: Styles.titleWhiteTextStyle.copyWith(fontSize: 16),
                      autofocus: false,
                      decoration: InputDecoration(
                          labelStyle: Styles.titleHighlightTextStyle
                              .copyWith(fontSize: 16),
                          labelText: "Email",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          hintStyle: Styles.titleHighlightTextStyle
                              .copyWith(fontSize: 16),
                          filled: true,
                          fillColor: Styles.primaryColor,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20))),
                      textAlignVertical: TextAlignVertical.center,
                    )),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                        child: TextFormField(
                      style: Styles.titleWhiteTextStyle.copyWith(fontSize: 16),
                      autofocus: false,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelStyle: Styles.titleHighlightTextStyle
                              .copyWith(fontSize: 16),
                          labelText: "Password",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          hintStyle: Styles.titleHighlightTextStyle
                              .copyWith(fontSize: 16),
                          filled: true,
                          fillColor: Styles.primaryColor,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20))),
                      textAlignVertical: TextAlignVertical.center,
                    )),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              //validate

                              // _authService.signInWithEmailAndPassword(email, password);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Forgot Password?",
                                  style: Styles.titleHighlightTextStyle
                                      .copyWith(fontSize: 13)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 130),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(new Radius.circular(20.0)),
                        gradient: Styles.primaryGradient,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: () {
                            //validate

                            // _authService.signInWithEmailAndPassword(email, password);
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              child: Text("Login",
                                  style: Styles.titleWhiteTextStyle
                                      .copyWith(color: Styles.primaryColor))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: MaterialButton(
                      animationDuration: Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      color: Styles.primaryColor,
                      elevation: 10,
                      focusElevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        _authService.signInWithGoogle();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          googleLogo,
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sign in with Google",
                            style: Styles.titleWhiteTextStyle
                                .copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account?",
                        style:
                            Styles.titleWhiteTextStyle.copyWith(fontSize: 16),
                      ),
                      Container(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              //validate

                              // _authService.signInWithEmailAndPassword(email, password);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                alignment: Alignment.center,
                                child: GradientText("Sign up",
                                    gradient: Styles.primaryGradient,
                                    style: Styles.titleWhiteTextStyle
                                        .copyWith(fontSize: 16))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
