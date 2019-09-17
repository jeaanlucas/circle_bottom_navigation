import 'package:flutter/material.dart';

class TabData {
  IconData icon;
  String title;
  Function onClick;
  final UniqueKey key = UniqueKey();

  TabData({
    @required this.icon,
    @required this.title,
    this.onClick,
  });
}