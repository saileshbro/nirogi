import 'package:flutter/material.dart';

class HomePageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.24, size.height * .955,
        size.width * .4, size.height * .8);
    path.quadraticBezierTo(
        size.width * .5, size.height * .73, size.width * .6, size.height * .75);
    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.8, size.width, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.9255, size.height * 0.555,
        size.width * 0.885, size.height * 0.38);
    path.quadraticBezierTo(size.width * .85, size.height * .12,
        size.width * .95, size.height * .2);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.04, size.width, size.height * 0.09);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class HomePageBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.24, size.height * .955,
        size.width * .4, size.height * .8);
    path.quadraticBezierTo(
        size.width * .5, size.height * .73, size.width * .6, size.height * .75);
    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.8, size.width, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.93, size.height * 0.5,
        size.width * 0.899, size.height * 0.375);
    path.quadraticBezierTo(size.width * .87, size.height * .159,
        size.width * .96225, size.height * .195);
    path.quadraticBezierTo(
        size.width * 0.96, size.height * 0.07, size.width, size.height * 0.09);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class LoginPageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, 0.61 * size.height);
    path.lineTo(size.width, 0.29 * size.height);
    path.lineTo(size.width, 0.49 * size.height);
    path.lineTo(0, 0.81 * size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
