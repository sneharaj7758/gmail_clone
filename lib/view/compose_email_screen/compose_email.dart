import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/view/dummy_db.dart';
import 'package:gmail_clone/view/home_Screen/widgets/icon_Widget.dart';

class ComposeScreen extends StatelessWidget {
  final List<String> menuTabItems = [
    'Schedule send',
    "Add from Contacts",
    "Confidential Mode",
    "Discard",
    "Settings",
    "help and feedback"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          actions: [
            IconWidget(
              onpressed: () {},
              IconData: Icon(Icons.attachment_outlined),
            ),
            IconWidget(
              onpressed: () {},
              IconData: Icon(Icons.send),
            ),
            InkWell(
              child: PopupMenuButton(
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
              ),
            ),
          ],
        ),
        body: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                _buildTextField(
                  labelText: 'From',
                  hintText: 'example@mail.com',
                  suffixonpress: () {},
                ),
                _buildTextField(
                  labelText: 'To',
                  hintText: '',
                  suffixonpress: () {},
                ),
                _buildTextField(
                  hintText: 'Subject',
                  hasSuffixIcon: false,
                ),
                _buildTextField(
                  hintText: 'Compose',
                  hasSuffixIcon: false,
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildTextField({
    String? labelText,
    required String hintText,
    bool hasSuffixIcon = true,
    Function()? suffixonpress,
  }) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: kPadding),
        prefixIcon: labelText != null
            ? Padding(
                padding:
                    EdgeInsets.only(top: kPadding - 7, right: kPadding - 10),
                child: Text(
                  labelText,
                  style: TextStyle(
                      color: ColorConst.BG_COLOR,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorConst.BG_COLOR,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: hasSuffixIcon
            ? IconButton(
                icon: Icon(Icons.expand_more),
                color: ColorConst.BG_COLOR,
                onPressed: suffixonpress,
              )
            : null,
      ),
    );
  }
}
