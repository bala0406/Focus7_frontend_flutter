import 'package:flutter/material.dart';
import 'package:focus7/Configurations/styles.dart';


//class moved to home.dart
class IconGradientMask extends StatelessWidget {
  final Widget child;
  IconGradientMask({this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: Styles.primaryGradient.colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      blendMode: BlendMode.srcIn,
      child: child,
    );
  }
}
