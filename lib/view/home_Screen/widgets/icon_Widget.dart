import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.IconData,
    required this.onpressed,
  });
  final IconData;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: IconData,
      iconSize: 24,
      color: ColorConst.BG_COLOR,
      onPressed: () {},
    );
  }
}
