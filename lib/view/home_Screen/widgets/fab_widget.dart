import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/view/compose_email_screen/compose_email.dart';

class FabWidget extends StatelessWidget {
  FabWidget({required this.isScrollingDown});
  final bool isScrollingDown;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ComposeScreen()));
      },
      isExtended: !isScrollingDown,
      backgroundColor: ColorConst.LIGHT_BLUE,
      icon: Icon(
        Icons.edit,
        color: ColorConst.BG_COLOR,
      ),
      label: !isScrollingDown
          ? Text(
              "Compose",
              style: TextStyle(color: ColorConst.BG_COLOR),
            )
          : SizedBox.shrink(),
    );
  }
}
