import 'package:flutter/material.dart';
import '../constants.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = 40;
    double _height = 20;
    Size _size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              "assets/Buds.png",
              scale: 2.5,
            ),
            Text(
              'You place here',
              style: Theme.of(context).textTheme.headline2,
            )
          ],
        ),
        Text(
          "Specials",
          style: Theme.of(context).textTheme.headline1,
        ),
        Container(
            width: _size.width * 0.20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ColorContainer(
                  width: _width,
                  height: _height,
                  color: Colors.blueAccent,
                  child: Text(
                    "Indica",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                ColorContainer(
                  width: _width,
                  height: _height,
                  color: Colors.pink,
                  child: Text(
                    "Stavia",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                ColorContainer(
                  width: _width,
                  height: _height,
                  color: Colors.orange,
                  child: Text(
                    "Hybrid",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                ColorContainer(
                  width: _width,
                  height: _height,
                  color: Colors.purple,
                  child: Text(
                    "Blend",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}

//Colored boxes to hold the cannabis type
class ColorContainer extends StatelessWidget {
  ColorContainer(
      {this.width = 60.0,
      this.height = 30.0,
      this.color = const Color(0x00000000),
      this.child});

  final double width;
  final double height;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Center(child: child),
      color: color,
    );
  }
}

//The heading for the product categories
class Headings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedContainer(
            child: Center(
              child:
                  Text('Product', style: Theme.of(context).textTheme.bodyText2),
            ),
            size: HeaderConstants.ProductWidth,
          ),
          ConstrainedContainer(
              child: Center(
                child:
                    Text('THC', style: Theme.of(context).textTheme.bodyText2),
              ),
              size: HeaderConstants.PercentWidth),
          ConstrainedContainer(
              child: Center(
                child:
                    Text('CHD', style: Theme.of(context).textTheme.bodyText2),
              ),
              size: HeaderConstants.PercentWidth),
          ConstrainedContainer(
              child: Center(
                child: Text('Producer',
                    style: Theme.of(context).textTheme.bodyText2),
              ),
              size: HeaderConstants.ProducerWidth),
          ConstrainedContainer(
              child: Center(
                child:
                    Text('Size', style: Theme.of(context).textTheme.bodyText2),
              ),
              size: HeaderConstants.SizeWidth),
          ConstrainedContainer(
              child: Center(
                child:
                    Text('Price', style: Theme.of(context).textTheme.bodyText2),
              ),
              size: HeaderConstants.PriceWidth),
        ],
      ),
    );
  }
}

//Creates the containers that the headings and column entries
class ConstrainedContainer extends StatelessWidget {
  final Widget child;
  final double size;

  ConstrainedContainer({
    this.child,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(width: _size.width * size, child: Center(child: child));
  }
}
