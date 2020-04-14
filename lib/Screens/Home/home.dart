import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus7/Configurations/styles.dart';

import 'package:focus7/Screens/Home/Dashboard/dashboard.dart';
import 'package:focus7/Screens/Home/Forums/forums.dart';
import 'package:focus7/Screens/Home/Profile/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  // TabController _tabController;

  int _currentIndex = 0;
  double selectedIconSize = 26;
  List<Widget> _children = [Dashboard(), Forums(), Profile()];

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(vsync: this,length: _children.length);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomNavigationBar(
            backgroundColor: Styles.primaryColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentIndex,
            unselectedItemColor: Theme.of(context).highlightColor,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  activeIcon: IconGradientMask(child: Icon(Icons.dashboard,size: selectedIconSize,)),
                  icon: Icon(Icons.dashboard),
                  title: Text("Dashboard")),
              BottomNavigationBarItem(
                  activeIcon: IconGradientMask(child: Icon(Icons.forum,size: selectedIconSize)),
                  icon: Icon(Icons.forum),
                  title: Text("Forums")),
              BottomNavigationBarItem(
                  activeIcon:
                      IconGradientMask(child: Icon(Icons.account_circle,size: selectedIconSize)),
                  icon: Icon(Icons.account_circle),
                  title: Text("Profile"))
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
      ).createShader(bounds),
      blendMode: BlendMode.srcIn,
      child: child,
    );
  }
}
