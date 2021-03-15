import 'package:flutter/material.dart';
import 'board_widgets.dart';
import '../constants.dart';

//MenuItem represents an item selection on the board
class MenuItem extends StatelessWidget {
  final String producer;
  final String image;
  final String product;
  final double thc;
  final double chd;
  final double size;
  final int price;
  final String additional;
  //Fill out the information needed for the item
  MenuItem(
      {this.product,
      this.thc,
      this.chd,
      this.producer,
      this.size,
      this.price,
      this.additional,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  image,
                  scale: 25.0,
                ),
                Text(
                  product,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
            size: HeaderConstants.ProductWidth,
          ),
          ConstrainedContainer(
            child: Text(
              '$thc%',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            size: HeaderConstants.PercentWidth,
          ),
          ConstrainedContainer(
            child: Text(
              '$chd%',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            size: HeaderConstants.PercentWidth,
          ),
          ConstrainedContainer(
            child: Text(
              producer,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            size: HeaderConstants.ProducerWidth,
          ),
          ConstrainedContainer(
            child: Text(
              '$size UOM',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            size: HeaderConstants.SizeWidth,
          ),
          ConstrainedContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ColorContainer(
                  width: 50.0,
                  height: 20.0,
                  color: Colors.grey,
                  child: Text(
                    '\$$price.00',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                ColorContainer(
                  width: 50.0,
                  height: 20.0,
                  color: additional == 'NEW' ? Colors.green : Colors.blue,
                  child: Text(
                    additional,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              ],
            ),
            size: HeaderConstants.PriceWidth,
          ),
        ],
      ),
    );
  }
}
