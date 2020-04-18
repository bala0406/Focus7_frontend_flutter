import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus7/Configurations/size_config.dart';
import 'package:focus7/Configurations/styles.dart';

class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
          body: Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
      Container(
        child: Text('Item1')
      ),
      VerticalDivider(color: Colors.red,thickness: 20,width: 20,),
      Container(
        child: Text('Item2'),
      ),
      VerticalDivider(),
      Container(
        child: Text('Item3'),
      ),
  ],
),
    );
  }
}
