import 'dart:math';

abstract class PrimitiveObjects
{
  double x;
  double y;
  double maxHeight;
  double maxWidth;


  void updatePosition(double newX, double newY)
  {
    x = newX;
    if( x > maxWidth) x = 0;
    if(x < 0) x = maxWidth;
    y = newY;
    if(y > maxHeight) y = 0;
    if(y < 0) y = maxHeight;

  }
}

class CustomCircle extends PrimitiveObjects
{

  CustomCircle({this.radius, double startX, double startY, double screenHeight, double screenWidth})
  {
    // make a random decision on the movement direction
    var ran = Random().nextDouble();
    if(ran > 0.5)
    {
      movementX = -1;
    }
    else{
      movementX = 1;
    }
    ran = Random().nextDouble();
    if(ran > 0.5)
    {
      movementY = 1;
    }
    else {
      movementY = -1;
    }
    maxWidth = screenWidth;
    maxHeight = screenHeight;
    x = startX;
    y = startY;
    print('I am a custom circle, $x is my x coordinate and $y this is my y.\n I am moving $movementX in the x and $movementY in the y');
  }
  int movementX;
  int movementY;
  double radius;

}

class CustomRectangle extends PrimitiveObjects
{

}