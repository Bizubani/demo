import 'dart:math';
import 'package:simple_animations/simple_animations.dart';
import 'package:clickspace_demo/animations/objects.dart';
import 'package:clickspace_demo/animations//background_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ColorEnum {
  AnimatedBlendTop,
  AnimatedBlendBottom,
  StaticBlendTop,
  StaticBlendBottom,
  DarkAnimatedTop,
  DarkAnimatedBottom
}

class AnimatedBackground extends StatefulWidget {
  AnimatedBackground(
      {this.child,
      this.playAnimation = false,
      this.radius = 0.0,
      this.darkTop = false});

  final bool playAnimation;
  final Widget child;
  final double radius;
  final bool darkTop;

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  @override
  void initState() {
    super.initState();
  }

  double width;
  double height;
  Size widgetSize;
  var tween;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    widgetSize = new Size(width, height);
    circles = List.generate(
        75,
        (index) => CustomCircle(
            radius: (Random().nextDouble() + 0.5) * 5,
            startX: Random().nextDouble() * widgetSize.width,
            startY: Random().nextDouble() * widgetSize.height,
            screenHeight: height,
            screenWidth: width));
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<CustomCircle> circles;

  @override
  Widget build(BuildContext context) {
    int duration = 2;

    tween = MultiTween<ColorEnum>()
      ..add(
          ColorEnum.AnimatedBlendTop,
          ColorTween(begin: Color(0xFFFFDDDD), end: Color(0xFFFFFFFF)),
          Duration(seconds: duration));

    return MirrorAnimation<MultiTweenValues<ColorEnum>>(
      tween: tween,
      duration: tween.duration,
      builder: (context, child, value) {
        return SizedBox(
          height: height,
          width: width,
          child: CustomPaint(
            painter: BackgroundPainter(circles: circles),
            size: widgetSize,
            child: widget.child,
          ),
        );
      },
    );
  }
}
