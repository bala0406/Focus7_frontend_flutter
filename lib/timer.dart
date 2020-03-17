import 'package:flutter/material.dart';

import 'package:focus7/styles.dart';

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
    controller = AnimationController(vsync: this, duration: Duration(minutes: 7));
    animation = Tween<double>(begin: 0.1, end: 1).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return CustomPaint(painter: TimerBar(animation: animation, height: height));
                    }),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return Text(
                        timerString,
                        style: Theme.of(context).textTheme.display1,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimerBar extends CustomPainter {
  final Gradient gradient = Styles.primaryGradient;
  final Color timerBarColor = Styles.primaryLightBlue;
  final Animation animation;
  final double width;
  final double height;

  TimerBar({this.width, this.height, this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = timerBarColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Rect rect = new Rect.fromLTWH(0, 0, size.width, height / 25);

    RRect rrectBorder = new RRect.fromRectAndRadius(rect, Radius.circular(50));
    canvas.drawRRect(rrectBorder, paint);

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 0;
    paint.shader = gradient.createShader(rect);

    Rect rectAnim = new Rect.fromLTWH(0, 0, size.width * animation.value, height / 25);
    RRect rrect = new RRect.fromRectAndRadius(rectAnim, Radius.circular(50));

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(TimerBar oldDelegate) {
    // TODO: implement shouldRepaint
    return animation != oldDelegate.animation || height != oldDelegate.height;
  }
}
