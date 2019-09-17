import 'package:flutter/material.dart';

class TabData {
  IconData iconData;
  String title;
  Function onclick;
  final UniqueKey key = UniqueKey();

  TabData({
    @required this.iconData,
    @required this.title,
    this.onclick,
  });
}