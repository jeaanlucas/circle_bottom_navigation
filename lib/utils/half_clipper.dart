import 'package:flutter/material.dart';

class HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // ignore: omit_local_variable_types
    final Rect rect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height / 2,
    );
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
