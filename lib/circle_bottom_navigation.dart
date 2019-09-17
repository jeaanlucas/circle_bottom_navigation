library circle_bottom_navigation;

import 'package:circle_bottom_navigation/utils/half_clipper.dart';
import 'package:circle_bottom_navigation/utils/half_painter.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:circle_bottom_navigation/widgets/tab_item.dart';
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

  void setPage(int page) {
    widget.onTabChangedListener(page);
    _setSelected(widget.tabs[page].key);
    _initAnimationAndStart(_circleAlignX, 1);

    setState(() {
      currentSelected = page;
    });
  }

  _setSelected(UniqueKey key) {
    int selected = widget.tabs.indexWhere(
      (tabData) => tabData.key == key
    );

    if (mounted) {
      setState(() {
        currentSelected = selected;
        _circleAlignX = -1 + (2 / (widget.tabs.length - 1) * selected);
        nextIcon = widget.tabs[selected].iconData;
      });
    }
  }

  _initAnimationAndStart(double from, double to) {
    _circleIconAlpha = 0;

    Future.delayed(Duration(milliseconds: ANIM_DURATION ~/ 5), () {
      setState(() {
        activeIcon = nextIcon;
      });
    }).then((_) {
      Future.delayed(Duration(milliseconds: (ANIM_DURATION ~/ 5 * 3)), () {
        setState(() {
          _circleIconAlpha = 1;
        });
      });
    });
  }

  _callbackFunction(UniqueKey key) {
    int selected = this.widget.tabs.indexWhere(
      (tabData) => tabData.key == key
    );

    this.widget.onTabChangedListener(selected);
    _setSelected(key);
    _initAnimationAndStart(_circleAlignX, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: this.widget.barHeight,
          decoration: BoxDecoration(
            color: barBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(
                  0,
                  -1,
                ),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: this.widget.tabs.map(
              (t) => TabItem(
                uniqueKey: t.key,
                selected: t.key == this.widget.tabs[currentSelected].key,
                iconData: t.iconData,
                title: t.title,
                iconColor: inactiveIconColor,
                textColor: textColor,
                callbackFunction: (key) => _callbackFunction(key),
              ),
            ).toList(),
          ),
        ),
        Positioned.fill(
          top: -(
            this.widget.circleSize +
            this.widget.circleOutline +
            this.widget.shadowAllowance
          ) / 2,
          child: Container(
            child: AnimatedAlign(
              duration: Duration(
                milliseconds: ANIM_DURATION,
              ),
              curve: Curves.easeOut,
              alignment: Alignment(
                _circleAlignX * (Directionality.of(context) == TextDirection.rtl ? -1 : 1),
                1,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: GestureDetector(
                  onTap: this.widget.tabs[currentSelected].onclick,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: this.widget.circleSize +
                          this.widget.circleOutline +
                          this.widget.shadowAllowance,
                        width: this.widget.circleSize +
                          this.widget.circleOutline +
                          this.widget.shadowAllowance,
                        child: ClipRect(
                          clipper: HalfClipper(),
                          child: Container(
                            child: Center(
                              child: Container(
                                width: (
                                  this.widget.circleSize +
                                  this.widget.circleOutline
                                ),
                                height: (
                                  this.widget.circleSize +
                                  this.widget.circleOutline
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: this.widget.arcHeight,
                        width: this.widget.arcWidth,
                        child: CustomPaint(
                          painter: HalfPainter(barBackgroundColor),
                        ),
                      ),
                      SizedBox(
                        height: this.widget.circleSize,
                        width: this.widget.circleSize,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: circleColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                              0.0,
                            ),
                            child: AnimatedOpacity(
                              duration: Duration(
                                milliseconds: ANIM_DURATION ~/ 5,
                              ),
                              opacity: _circleIconAlpha,
                              child: Icon(
                                activeIcon,
                                color: activeIconColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

