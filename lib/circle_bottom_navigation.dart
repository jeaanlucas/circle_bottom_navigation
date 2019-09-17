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

class _CircleBottomNavigationState extends State<CircleBottomNavigation>
    with TickerProviderStateMixin, RouteAware {
  IconData nextIcon = Icons.search;
  IconData activeIcon = Icons.search;

  int currentSelected = 0;
  double _circleAlignX = 0;
  double _circleIconAlpha = 1;

  Color circleColor;
  Color activeIconColor;
  Color inactiveIconColor;
  Color barBackgroundColor;
  Color textColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    activeIcon = widget.tabs[currentSelected].iconData;

    circleColor = (widget.circleColor == null)
      ? (Theme.of(context).brightness == Brightness.dark)
        ? Colors.white
        : Theme.of(context).primaryColor
      : widget.circleColor;

    activeIconColor = (widget.activeIconColor == null)
      ? (Theme.of(context).brightness == Brightness.dark)
        ? Colors.black54
        : Colors.white
      : widget.activeIconColor;

    barBackgroundColor = (widget.barBackgroundColor == null)
      ? (Theme.of(context).brightness == Brightness.dark)
        ? Color(0xFF212121)
        : Colors.white
      : widget.barBackgroundColor;

    textColor = (widget.textColor == null)
      ? (Theme.of(context).brightness == Brightness.dark)
        ? Colors.white
        : Colors.black54
      : widget.textColor;

    inactiveIconColor = (widget.inactiveIconColor == null)
      ? (Theme.of(context).brightness == Brightness.dark)
        ? Colors.white
        : Theme.of(context).primaryColor
      : widget.inactiveIconColor;
  }

  @override
  void initState() {
    super.initState();

    _setSelected(widget.tabs[widget.initialSelection].key);
  }

  _setSelected(UniqueKey key) {
    int selected = widget.tabs.indexWhere((tabData) => tabData.key == key);

    if (mounted) {
      setState(() {
        currentSelected = selected;
        _circleAlignX = -1 + (2 / (widget.tabs.length - 1) * selected);
        nextIcon = widget.tabs[selected].iconData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack();
  }
}

