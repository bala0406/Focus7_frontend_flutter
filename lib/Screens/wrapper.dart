import 'package:flutter/material.dart';
import 'package:focus7/Models/user_model.dart';
import 'package:focus7/Screens/Authentication/login.dart';
import 'package:focus7/Screens/Authentication/sign_in.dart';
import 'package:focus7/Screens/Home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);
    if(user == null){
      return SignIn();
    }else{
      return Home();
    }
  }
}