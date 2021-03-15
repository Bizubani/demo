import 'package:flutter/material.dart';
import 'board/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BudVue',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline1: TextStyle(
                fontFamily: "Damion",
                fontSize: 48.0,
                fontWeight: FontWeight.w400,
                color: Colors.white60),
            headline2: TextStyle(
                fontFamily: "Damion", fontSize: 24.0, color: Colors.white60),
            bodyText1: TextStyle(fontSize: 16.0, color: Colors.white60),
            bodyText2: TextStyle(fontSize: 9.0, color: Colors.white60),
            button: TextStyle(fontSize: 10.0, color: Colors.white)),
      ),
      home: MenuScreen(),
    );
  }
}
