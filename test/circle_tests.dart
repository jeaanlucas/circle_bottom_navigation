import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';

void main() {
  Widget makeTestableWidget({
    Widget child,
  }) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        brightness: Brightness.light,
      ),
      home: Scaffold(
        body: Center(),
        bottomNavigationBar: child,
      ),
    );
  }
}
