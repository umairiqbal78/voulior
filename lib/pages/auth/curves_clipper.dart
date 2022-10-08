import 'package:flutter/material.dart';

class UpperClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 308;
    path.lineTo(0 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      375 * _xScaling,
      0 * _yScaling,
      375 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      375 * _xScaling,
      0 * _yScaling,
      375 * _xScaling,
      163.195 * _yScaling,
      375 * _xScaling,
      163.195 * _yScaling,
    );
    path.cubicTo(
      375 * _xScaling,
      163.195 * _yScaling,
      282.118 * _xScaling,
      308 * _yScaling,
      189.5 * _xScaling,
      308 * _yScaling,
    );
    path.cubicTo(
      96.8822 * _xScaling,
      308 * _yScaling,
      0 * _xScaling,
      163.195 * _yScaling,
      0 * _xScaling,
      163.195 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      163.195 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 308;
    path.lineTo(0 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      375 * _xScaling,
      0 * _yScaling,
      375 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      375 * _xScaling,
      0 * _yScaling,
      375 * _xScaling,
      237.945 * _yScaling,
      375 * _xScaling,
      237.945 * _yScaling,
    );
    path.cubicTo(
      375 * _xScaling,
      237.945 * _yScaling,
      280.118 * _xScaling,
      308 * _yScaling,
      187.5 * _xScaling,
      308 * _yScaling,
    );
    path.cubicTo(
      94.8822 * _xScaling,
      308 * _yScaling,
      0 * _xScaling,
      237.945 * _yScaling,
      0 * _xScaling,
      237.945 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      237.945 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
