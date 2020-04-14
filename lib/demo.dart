import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double currentPage = 0.0;

  var colors = [Colors.orange, Colors.lightGreen, Colors.red, Colors.purple, Colors.blue, Colors.pink];

  List<Widget> get dummyContainers {
    List<Widget> dummyContainers = List();
    this.colors.forEach((i) {
      dummyContainers.add(Container());
    });

    return dummyContainers;
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = new PageController();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        margin: EdgeInsets.only(top: 150),
        height: 400,
        width: double.infinity,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          CardsStacked(currentPage, colors),
          Positioned.fill(
            child: PageView(children: this.dummyContainers, controller: controller,),
          )
        ],),
      )
    );
  }
}

class CardsStacked extends StatelessWidget {
  final double currentPage;
  final List<Color> colors;
  final padding = 20.0;
  final verticalInset = 20.0;

  CardsStacked(this.currentPage, this.colors);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(builder: (ctx, constr) {
        List<Widget> cardList = List();
        var primaryCardHeight = constr.maxHeight * 0.8;
        var primaryCardWidth = primaryCardHeight * 0.75;

        for(int i = colors.length - 1; i > -1; i--) {
          var delta = i - currentPage;
          var isOnRight = delta >= 0;

          print(delta);
          var item = Positioned.directional(
            textDirection: TextDirection.ltr,
            top: 20 * delta + 40,
//            start: delta * (primaryCardWidth / 7 - ((primaryCardWidth / 7) / 2) * delta)  + 40 - (isOnRight? 0 : (400 * -delta)),
            start: delta * (primaryCardWidth / 6)  + 40 - (isOnRight? 0 : (400 * -delta)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20 - delta * 2.2)),
                color: colors[i]
              ),
              height: primaryCardHeight - (primaryCardHeight * delta * 0.1),
              width: primaryCardWidth - (primaryCardWidth * delta * 0.1),
            ),
          );

          cardList.add(item);
        }

        return Stack(children: cardList,);
      },),
    );
  }
}