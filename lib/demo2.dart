import 'dart:math';

import 'package:flutter/material.dart';
import 'package:focus7/Configurations/size_config.dart';

class Demo2 extends StatefulWidget {
  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> with TickerProviderStateMixin {


  Animation animation;
  AnimationController controller;

  @override
  void initState()
  {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds:3));
    animation = Tween<double>(begin: 0,end: 1).animate(controller)..addListener((){
      setState((){});
      controller.forward();
    });
  }


  Random random = Random();
  List<Widget> containersList = [
    Container(
      color: Colors.amberAccent,
      height: 100,
    ),
    Container(
      color: Colors.red,
      height: 100,
    ),
    Container(
      color: Colors.brown,
      height: 100,
    ),
    Container(
      color: Colors.green,
      height: 100,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        reverse: true,
        child:AnimatedBuilder(
          builder: (context,child){
            return Column(children: <Widget>[
            ...containersList,
            RaisedButton(
              onPressed: () {
                setState(() {
                  containersList.insert(
                      random.nextInt(containersList.length),
                      Container(
                        color: Color.fromARGB(
                            random.nextInt(255), random.nextInt(255), random.nextInt(255), 0),
                        height: 100,
                        
                      ));
                });
              },
              child: Text("click"),
            )
          ]);

          },
           animation: animation,      
        ),
      ),
    ));
  }
}
