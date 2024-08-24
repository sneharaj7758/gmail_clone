import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/utils/image_constant.dart';
import 'package:gmail_clone/view/home_Screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return HomeScreen("", 0);
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.WHITE,
      body: Center(
          child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ImagePath.GMAIL_LOGO))),
      )),
    );
  }
}
