import 'dart:ui';
import 'package:clickspace_demo/animations/objects.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BackgroundPainter extends CustomPainter {
  BackgroundPainter({this.circles});
  List<CustomCircle> circles;

  @override
  void paint(Canvas canvas, Size size) {
//    canvas.drawPoints(PointMode.lines, screenPoints,
//        Paint()..color = Color.fromARGB((255 * Random().nextDouble()).floor(),
//            (255 * Random().nextDouble()).floor(),
//            (255 * Random().nextDouble()).floor(),
//            (255 * Random().nextDouble()).floor())..strokeWidth = 0.75);
    drawCircles(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //count frames since the last repaint and repaint as necessary
    return true;
  }

  void drawCircles(Canvas canvas)
  {
    for(var i = 0; i < circles.length; i++)
    {
      double ranx = Random().nextDouble() * circles[i].movementX;
      double rany = Random().nextDouble()  * circles[i].movementY;
      var paint = Paint()..color = Color.fromARGB((115 * ranx).ceil(),
          (55 ),
          (65 ),
          (125 * Random().nextDouble()).floor());
      canvas.drawCircle(Offset(circles[i].x, circles[i].y), circles[i].radius,
          paint);
      circles[i].updatePosition(circles[i].x + ranx, circles[i].y + rany);
    }
  }
}
