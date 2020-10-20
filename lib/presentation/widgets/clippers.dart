import 'package:flutter/material.dart';

final double triangleHeight = 14;
final double triangleBase = 18;

class UpWardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path = Path()
      ..lineTo(0, triangleHeight)
      ..lineTo(size.width / 2 - triangleBase / 2, triangleHeight)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width / 2 + triangleBase / 2, triangleHeight)
      ..lineTo(size.width, triangleHeight)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DownwardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path = Path()
      ..lineTo(0, size.height - triangleHeight)
      ..lineTo(size.width / 2 - triangleBase / 2, size.height - triangleHeight)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width / 2 + triangleBase / 2, size.height - triangleHeight)
      ..lineTo(size.width, size.height - triangleHeight)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
