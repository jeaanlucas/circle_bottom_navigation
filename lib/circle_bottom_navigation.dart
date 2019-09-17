library circle_bottom_navigation;

import 'package:circle_bottom_navigation/widget/tab_data.dart';
import 'package:flutter/material.dart';

class CircleBottomNavigation extends StatefulWidget {
  final List<TabData> tabs;
  final Function(int position) onTabChangedListener;
  final Key key;
  final int initialSelection;
  final Color circleColor;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final Color textColor;
  final Color barBackgroundColor;
  final double circleSize;
  final double barHeight;
  final double arcHeight;
  final double arcWidth;
  final double circleOutline;
  final double shadowAllowance;

  CircleBottomNavigation({
    @required this.tabs,
    @required this.onTabChangedListener,
    this.key,
    this.initialSelection = 0,
    this.circleColor,
    this.activeIconColor,
    this.inactiveIconColor,
    this.textColor,
    this.barBackgroundColor,
    this.circleSize = 60,
    this.barHeight = 60,
    this.arcHeight = 70,
    this.arcWidth = 90,
    this.circleOutline = 10,
    this.shadowAllowance = 20,
  }) : assert(onTabChangedListener != null),
       assert(tabs != null);

  @override
  _CircleBottomNavigationState createState() => _CircleBottomNavigationState();
}

class _CircleBottomNavigationState extends State<CircleBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

