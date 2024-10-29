library circle_bottom_navigation;

import 'package:circle_bottom_navigation/utils/half_clipper.dart';
import 'package:circle_bottom_navigation/utils/half_painter.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:circle_bottom_navigation/widgets/tab_item.dart';
import 'package:flutter/material.dart';

class CircleBottomNavigation extends StatefulWidget {
  final List<TabData> tabs;
  final Function(int position) onTabChangedListener;
  final int initialSelection;
  final Color? circleColor;
  final Color? activeIconColor;
  final Color? inactiveIconColor;
  final Color? textColor;
  final Color? barBackgroundColor;
  final double circleSize;
  final double barHeight;
  final double arcHeight;
  final double arcWidth;
  final double circleOutline;
  final double shadowAllowance;
  final bool hasElevationShadows;
  final double blurShadowRadius;

  CircleBottomNavigation({
    required this.tabs,
    required this.onTabChangedListener,
    required this.initialSelection,
    super.key,
    this.circleColor,
    this.activeIconColor,
    this.inactiveIconColor,
    this.textColor,
    this.barBackgroundColor,
    this.circleSize = 60.0,
    this.barHeight = 60.0,
    this.arcHeight = 70.0,
    this.arcWidth = 90.0,
    this.circleOutline = 10.0,
    this.shadowAllowance = 20.0,
    this.hasElevationShadows = true,
    this.blurShadowRadius = 8.0,
  });

  @override
  _CircleBottomNavigationState createState() => _CircleBottomNavigationState();
}

class _CircleBottomNavigationState extends State<CircleBottomNavigation> with TickerProviderStateMixin, RouteAware {
  IconData nextIcon = Icons.search;
  IconData activeIcon = Icons.search;

  int currentSelected = 0;
  double _circleAlignX = 0;
  double _circleIconAlpha = 1;

  late Color circleColor;
  late Color activeIconColor;
  late Color inactiveIconColor;
  late Color barBackgroundColor;
  late Color textColor;
  late double activeIconSize;
  late double nextIconSize;

  @override
  void didUpdateWidget(covariant CircleBottomNavigation oldWidget) {
    super.didUpdateWidget(oldWidget);
    final theme = Theme.of(context);

    activeIcon = widget.tabs[currentSelected].icon;
    activeIconSize = widget.tabs[currentSelected].iconSize;

    circleColor = widget.circleColor ?? theme.colorScheme.primary;

    activeIconColor = widget.activeIconColor ?? theme.colorScheme.onPrimary;

    barBackgroundColor = widget.barBackgroundColor ?? theme.colorScheme.primaryContainer;
    textColor = widget.textColor ?? theme.textTheme.bodyLarge?.color ?? Colors.black;

    inactiveIconColor = widget.inactiveIconColor ?? theme.colorScheme.onPrimary.withOpacity(0.5);

    _setSelected(widget.tabs[widget.initialSelection].key);
  }

  void setPage(int page) {
    widget.onTabChangedListener(page);
    _setSelected(widget.tabs[page].key);
    _initAnimationAndStart(_circleAlignX, 1);

    setState(() => currentSelected = page);
  }

  void _setSelected(UniqueKey key) {
    final selected = widget.tabs.indexWhere((TabData tabData) => tabData.key == key);

    if (mounted) {
      setState(() {
        currentSelected = selected;
        _circleAlignX = -1 + (2 / (widget.tabs.length - 1) * selected);
        nextIcon = widget.tabs[selected].icon;
        nextIconSize = widget.tabs[selected].iconSize;
      });
    }
  }

  void _initAnimationAndStart(double from, double to) {
    _circleIconAlpha = 0;

    Future.delayed(
      const Duration(
        milliseconds: ANIM_DURATION ~/ 5,
      ),
      () {
        setState(() {
          activeIcon = nextIcon;
          activeIconSize = nextIconSize;
        });
      },
    ).then((_) {
      Future.delayed(
          const Duration(
            milliseconds: ANIM_DURATION ~/ 5 * 3,
          ), () {
        setState(() => _circleIconAlpha = 1);
      });
    });
  }

  void _callbackFunction(UniqueKey key) {
    final selected = widget.tabs.indexWhere((TabData tabData) => tabData.key == key);

    widget.onTabChangedListener(selected);
    _setSelected(key);
    _initAnimationAndStart(_circleAlignX, 1);
  }

  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: widget.barHeight,
            decoration: BoxDecoration(
              color: barBackgroundColor,
              boxShadow: <BoxShadow>[
                widget.hasElevationShadows
                    ? BoxShadow(
                        color: Colors.black12,
                        offset: const Offset(
                          0,
                          -1,
                        ),
                        blurRadius: widget.blurShadowRadius,
                      )
                    : const BoxShadow(),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.tabs
                  .map(
                    (TabData tab) => TabItem(
                      uniqueKey: tab.key,
                      selected: tab.key == widget.tabs[currentSelected].key,
                      icon: tab.icon,
                      title: tab.title,
                      iconColor: inactiveIconColor,
                      textColor: textColor,
                      iconSize: tab.iconSize,
                      fontSize: tab.fontSize,
                      fontWeight: tab.fontWeight,
                      callbackFunction: (UniqueKey key) => _callbackFunction(key),
                    ),
                  )
                  .toList(),
            ),
          ),
          Positioned.fill(
            top: -(widget.circleSize + widget.circleOutline + widget.shadowAllowance) / 2,
            child: Container(
              child: AnimatedAlign(
                duration: const Duration(
                  milliseconds: ANIM_DURATION,
                ),
                curve: Curves.easeOut,
                alignment: Alignment(
                  _circleAlignX * (Directionality.of(context) == TextDirection.rtl ? -1 : 1),
                  1,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15,
                  ),
                  child: FractionallySizedBox(
                    widthFactor: 1 / widget.tabs.length,
                    child: GestureDetector(
                      onTap: widget.tabs[currentSelected].onClick,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: widget.circleSize + widget.circleOutline + widget.shadowAllowance,
                            width: widget.circleSize + widget.circleOutline + widget.shadowAllowance,
                            child: ClipRect(
                              clipper: HalfClipper(),
                              child: Container(
                                child: Center(
                                  child: Container(
                                    width: widget.circleSize + widget.circleOutline,
                                    height: widget.circleSize + widget.circleOutline,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: <BoxShadow>[
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
                            height: widget.arcHeight,
                            width: widget.arcWidth,
                            child: CustomPaint(
                              painter: HalfPainter(
                                paintColor: barBackgroundColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: widget.circleSize,
                            width: widget.circleSize,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: circleColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  0.0,
                                ),
                                child: AnimatedOpacity(
                                  duration: const Duration(
                                    milliseconds: ANIM_DURATION ~/ 5,
                                  ),
                                  opacity: _circleIconAlpha,
                                  child: Icon(
                                    activeIcon,
                                    color: activeIconColor,
                                    size: activeIconSize,
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
          ),
        ],
      );
}
