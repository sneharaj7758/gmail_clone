import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/view/home_Screen/widgets/displaytext_widget.dart';

class SettingScreen extends StatelessWidget {
  final List<String> menuTabItems = ['Manage Accounts', "help and feedback"];
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: ColorConst.WHITE,
      appBar: AppBar(
          backgroundColor: ColorConst.WHITE,
          title: Text("setting"),
          actions: [
            PopupMenuButton(
              color: ColorConst.DRAWER_BG,
              iconSize: 24,
              icon: Icon(
                Icons.more_vert_rounded,
                color: ColorConst.BG_COLOR,
              ),
              itemBuilder: (context) => menuTabItems
                  .map(
                    (itemName) => PopupMenuItem(
                      child: Text(
                        itemName,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                      value: itemName,
                    ),
                  )
                  .toList(),
            )
          ]),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DisplaytextWidget(
                "General Setting", 20, FontWeight.normal, ColorConst.BG_COLOR),
            SizedBox(
              height: 15,
            ),
            DisplaytextWidget("snehamol223@gmail.com", 20, FontWeight.normal,
                ColorConst.BG_COLOR),
            SizedBox(
              height: 15,
            ),
            DisplaytextWidget("surajravi45@gmail.com", 20, FontWeight.normal,
                ColorConst.BG_COLOR),
            SizedBox(
              height: 15,
            ),
            DisplaytextWidget("shann23@gmail.com", 20, FontWeight.normal,
                ColorConst.BG_COLOR),
            SizedBox(
              height: 15,
            ),
            DisplaytextWidget(
                "Add Account", 20, FontWeight.normal, ColorConst.BG_COLOR),
          ],
        ),
      )),
    ));
  }
}
