/////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
/////////////////////////////////////////////////////////////
import 'package:focus7/Configurations/styles.dart';
import 'package:focus7/Screens/Authentication/sign_in.dart';
import 'package:focus7/Screens/Home/home.dart';
import 'package:focus7/Services/auth.dart';
/////////////////////////////////////////////////////////////

class SettingsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings, color: Styles.highlightColor),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Settings()));
      },
    );
  }
}

class Settings extends StatelessWidget {
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 80,right: 80,bottom: 40),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(new Radius.circular(20.0)),
                  color: Styles.errorRed,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    onTap: () {
          _authService.signOut();

          Navigator.of(context).popUntil(ModalRoute.withName("/"));
                    },
                    child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            child:
                Text("SignOut", style: Styles.titleWhiteTextStyle)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
