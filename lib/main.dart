import 'package:flutter/material.dart';

import 'package:gmail_clone/view/home_Screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen("", 0),
    );
  }
}
