import 'package:flutter/material.dart';

class TabData {
  final IconData icon;
  final String? title;
  final VoidCallback? onClick;
  final double? iconSize;
  final double? fontSize;
  final FontWeight? fontWeight;
  final UniqueKey key = UniqueKey();

  TabData({
    required this.icon,
    this.title,
    this.onClick,
    this.iconSize,
    this.fontSize,
    this.fontWeight,
  });
}
