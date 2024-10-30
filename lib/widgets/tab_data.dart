import 'package:flutter/material.dart';

class TabData {
  final IconData icon;
  final String title;
  final void Function()? onClick;
  final double iconSize;
  final double fontSize;
  final FontWeight fontWeight;
  final UniqueKey key = UniqueKey();

  TabData({
    required this.icon,
    required this.title,
    this.onClick,
    this.iconSize = 30,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
  });
}
