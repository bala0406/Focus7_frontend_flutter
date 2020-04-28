/////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
/////////////////////////////////////////////////////////////
import 'package:focus7/Configurations/styles.dart';
/////////////////////////////////////////////////////////////

class SettingsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings, color: Styles.highlightColor),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
      },
    );
  }
}

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
              fit: BoxFit.contain,
              child: Image.asset("Assets/under_construction.png")),
              SizedBox(height:20),
              Text("There is nothing here, you can go back!",style: Styles.titleWhiteTextStyle,)
        ],
      ),
    );
  }
}
