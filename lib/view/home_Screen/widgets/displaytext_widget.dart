import 'package:flutter/material.dart';

class DisplaytextWidget extends StatelessWidget {
  DisplaytextWidget(
      this.textlabel, this.labelsize, this.labelweight, this.labelcolor);
  final String textlabel;
  final double labelsize;
  final FontWeight labelweight;
  final Color labelcolor;
  @override
  Widget build(BuildContext context) {
    return Text(
      textlabel,
      style: TextStyle(
        fontSize: labelsize,
        color: labelcolor,
        fontWeight: labelweight,
      ),
    );
  }
}
