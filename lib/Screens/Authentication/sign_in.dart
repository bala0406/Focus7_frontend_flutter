import 'package:flutter/material.dart';
import 'package:focus7/Services/auth.dart';



class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlatButton(onPressed: (){
        AuthService().signInWithGoogle().then((user)=>print(user));
      }, child: Text("click"))
    );
  }
}