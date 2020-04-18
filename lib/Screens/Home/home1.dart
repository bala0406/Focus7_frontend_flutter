//This is a an alternative to the home Widget
//This enables user to slide across the navigation items and are also provided with tap to change abilty
//But this is not a true material bottom navigation bar
//This uses Tabbar and its views to simulate the bottom navigation bar

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus7/Configurations/styles.dart';
import 'package:focus7/Screens/Home/Dashboard/Welcome.dart';
import 'package:focus7/Screens/Home/Dashboard/dashboard.dart';
import 'package:focus7/Screens/Home/Forums/forums.dart';
import 'package:focus7/Screens/Home/Profile/profile.dart';


class Home1 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home1> with TickerProviderStateMixin {
  // TabController _tabController;

  int _currentIndex = 0;
  List<Widget> _children = [Dashboard(), Forums(), Profile()];

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(vsync: this,length: _children.length);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return DefaultTabController(
      length: _children.length,
      initialIndex: 2,
      child: Scaffold(
        body: TabBarView(children: _children),
        bottomNavigationBar: TabBar(
            unselectedLabelColor: Styles.highlightColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Styles.highlightColor,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: <Widget>[
              Tab(
                  child: _currentIndex == 0
                      ? IconGradientMask(child: Icon(Icons.dashboard))
                      : Icon(Icons.dashboard)),
              Tab(
                child: _currentIndex == 1
                    ? IconGradientMask(child: Icon(Icons.forum))
                    : Icon(Icons.forum),
              ),
              Tab(
                child: _currentIndex == 2
                    ? IconGradientMask(child: Icon(Icons.account_circle))
                    : Icon(Icons.account_circle),
              ),
            ]),
      ),
    );
  }
}


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
        tileMode: TileMode.mirror,
        stops: [0.3,0.8]
      ).createShader(bounds),
      blendMode: BlendMode.srcIn,
      
      child: child,
    );
  }
}