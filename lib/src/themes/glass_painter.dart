import 'package:flutter/material.dart';

class GlassPainter extends CustomPainter {
  double filledPercent;

  GlassPainter({this.filledPercent});

  @override
  void paint(Canvas canvas, Size size) {
    Paint glassPaint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Paint waterPaint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill;

    Path glassPath = Path();
    glassPath.lineTo(size.width * 0.25, size.height);
    glassPath.lineTo(size.width * 0.75, size.height);
    glassPath.lineTo(size.width, 0);

    canvas.drawPath(glassPath, glassPaint);

    Path waterPath = Path();
    double _factorInside = 0.05;
    double smallHeight = size.height * 0.05 + size.height * (1 - filledPercent);
    double smallWidth = 0.25 * size.width * smallHeight / size.height;

    waterPath.moveTo((smallWidth + size.width * _factorInside), smallHeight);

    waterPath.lineTo((size.width * 0.25 + size.width * _factorInside),
        (size.height - size.height * _factorInside));

    waterPath.lineTo((size.width * 0.75 - size.width * _factorInside),
        (size.height - size.height * _factorInside));

    waterPath.lineTo(
        size.width - (smallWidth + size.width * _factorInside), smallHeight);

    canvas.drawPath(waterPath, waterPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
