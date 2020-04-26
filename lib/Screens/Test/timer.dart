import 'package:flutter/material.dart';
import 'package:focus7/Configurations/styles.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, "0")}";
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(minutes: 7));
    animation = Tween<double>(begin: 0.1, end: 1).animate(controller);
    controller.forward(from: controller.value);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Transform.translate(
              offset: Offset(0, -15), //Size(0,-30).center(Offset.zero)
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return CustomPaint(
                          painter: TimerBar(animation: animation));
                    }),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Text(
                      timerString,
                      style: Styles.timerTextStyle,
                      textAlign: TextAlign.center,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

// paints the animated Timer Bar to the screen
class TimerBar extends CustomPainter {
  final Gradient gradient = Styles.primaryGradient;
  final Color timerBarColor = Styles.primaryColor;
  final Animation animation;

  TimerBar({this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = timerBarColor
      ..style = PaintingStyle.fill;

    //background painter
    Rect rect = new Rect.fromLTWH(0, 0, size.width, 30);

    RRect rrectContainer =
        new RRect.fromRectAndRadius(rect, Radius.circular(50));
    canvas.drawRRect(rrectContainer, paint);

    // foreground animated painter
    paint.shader = gradient.createShader(rect);

    Rect rectAnim = new Rect.fromLTWH(0, 0, size.width * animation.value, 30);
    RRect rrect = new RRect.fromRectAndRadius(rectAnim, Radius.circular(50));

    canvas.drawRRect(rrect, paint);
  }

  //animation callback
  @override
  bool shouldRepaint(TimerBar oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
