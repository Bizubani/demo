import 'dart:async';

import 'package:clickspace_demo/animations/animated_background.dart';
import 'package:clickspace_demo/board/item.dart';
import 'package:flutter/material.dart';
import 'board_widgets.dart';

class MenuScreen extends StatefulWidget
{
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
{
  List<String> images = ["assets/1.png", "assets/2.png", "assets/3.png"];
  ScrollController _controller;
  @override
  void initState() {
    _controller = new ScrollController();
    super.initState();
    Timer.periodic(Duration(seconds: 15), (_){
      if(mounted)
      {
        setState(() {
          if(_controller.offset == _controller.position.maxScrollExtent) {
            _controller.animateTo(_controller.position.minScrollExtent,
                duration: Duration(seconds: 12), curve: Curves.linear);
          }
           else{
            _controller.animateTo(_controller.position.maxScrollExtent,
                duration: Duration(seconds: 12), curve: Curves.easeIn);
          }
        });
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: _size.width,
        height: _size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: <Color>[
              Color(0xff333333),
              Color(0xff171717)
            ],
          ),
        ),
        child: AnimatedBackground(
          playAnimation: true,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(48, 16, 8, 12),
                child: Header(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 1),
                child: Headings(),
              ),
              Divider(color: Colors.white, thickness: 0.5,),
              Expanded(
                  child: ListView(
                    controller: _controller,
                    children: List.generate(25, (index) {
                      int imageSelect = 0;
                      if(index % 3 == 0)
                        {
                          imageSelect = 1;
                        }
                      else if(index % 5 == 0)
                        {
                          imageSelect = 2;
                        }

                     return MenuItem(
                      product: 'PRODUCT HERE',
                      image: images[imageSelect],
                      thc: 0.0,
                      chd: 0.0,
                      producer: 'LP PRODUCER NAME',
                      size: 0.00,
                      price: 0,
                      additional: index > 4 && index < 10 ?  'NEW' : '30% OFF',
                    );}),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}