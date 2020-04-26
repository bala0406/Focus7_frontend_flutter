import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus7/Configurations/size_config.dart';
import 'package:focus7/Configurations/styles.dart';

class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
        
          
          children: <Widget>[
            Align(
              alignment: Alignment.center,
                          child: Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 20,
                  runSpacing: 20,
                  
                  children: <Widget>[
                    Container(
              color: Colors.amber,
              height: 180,
              width: 180,
              child: Text(
                "bala",
                style: Styles.headlineWhiteTextStyle,
              )),
                    
                    Container(
              height: 180,
              width: 180,
              color: Colors.amber,
              child: Text(
                "bala",
                style: Styles.headlineWhiteTextStyle,
              )),
              Container(
                  color: Colors.amber,
                  height: 180,
                  width: 180,
                  child: Text(
                    "bala",
                    style: Styles.headlineWhiteTextStyle,
                  )),
              
              Container(
                  height: 180,
                  width: 180,
                  color: Colors.amber,
                  child: Text(
                    "bala",
                    style: Styles.headlineWhiteTextStyle,
                  )),
                    
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
