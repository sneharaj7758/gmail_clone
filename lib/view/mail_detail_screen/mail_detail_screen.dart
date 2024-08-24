import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/view/dummy_db.dart';
import 'package:gmail_clone/view/home_Screen/widgets/icon_Widget.dart';

class MailDetailScreen extends StatelessWidget {
  MailDetailScreen(
      {required this.heading,
      required this.mail,
      required this.time,
      required this.is_stared,
      this.logourl = "",
      this.logocolor = Colors.transparent,
      required this.content,
      required this.title});
  final String heading, mail, time, logourl, content, title;
  final bool is_stared;
  final Color logocolor;

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
          IconWidget(IconData: Icon(Icons.archive_outlined), onpressed: () {}),
          IconWidget(IconData: Icon(Icons.delete_outline), onpressed: () {}),
          IconWidget(IconData: Icon(Icons.email_outlined), onpressed: () {}),
          InkWell(
            child: PopupMenuButton(
              color: ColorConst.APPBAR_COLOR,
              iconSize: 24,
              icon: Icon(
                Icons.more_vert_rounded,
                color: ColorConst.BG_COLOR,
              ),
              itemBuilder: (context) => menuTabItems
                  .map(
                    (itemName) => PopupMenuItem(
                      child: Text(itemName),
                      value: itemName,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //-------------Title Widget
          Padding(
            padding: EdgeInsets.all(kPadding),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MySize - 10,
                    child: Text(
                      heading,
                      style:
                          TextStyle(color: ColorConst.BG_COLOR, fontSize: 20),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                IconWidget(IconData: Icon(Icons.star_border), onpressed: () {})
              ],
            ),
          ),

          //-----------Mail Heading Widget
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kPadding),
            child: Row(
              children: [
                logourl.isEmpty
                    ? CircleAvatar(
                        radius: 23,
                        backgroundColor: logocolor,
                        child: Text(
                          title.substring(0, 1),
                          style: TextStyle(color: ColorConst.WHITE),
                        ))
                    : CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage(logourl),
                      ),
                SizedBox(width: kPadding - 12),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            mail,
                            style: TextStyle(
                                fontSize: 16, color: ColorConst.BG_COLOR),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            time,
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'to me',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.expand_more,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  'Unsubscribe',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                InkWell(
                  child: PopupMenuButton(
                    color: ColorConst.APPBAR_COLOR,
                    iconSize: 24,
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: ColorConst.BG_COLOR,
                    ),
                    itemBuilder: (context) => menuMailItems
                        .map(
                          (itemName) => PopupMenuItem(
                            child: Text(itemName),
                            value: itemName,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          //-----------------------Mail Info/Content
          Padding(
            padding: EdgeInsets.all(kPadding),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
          //-----------------------Last Three Buttons

          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWidget(
                    IconData: Icon(Icons.attach_file_outlined),
                    onpressed: () {}),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: ColorConst.SECOND_BLUE),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.replay_10),
                          color: ColorConst.BLUE,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Replay',
                              hintStyle:
                                  TextStyle(color: ColorConst.SECONDRY_TEXT),
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              isDense: false,
                            ),
                          ),
                        ),
                        IconWidget(
                            IconData: Icon(Icons.forward_10), onpressed: () {}),
                        SizedBox(width: kPadding - 15),
                      ],
                    ),
                  ),
                ),
                IconWidget(IconData: Icon(Icons.mood), onpressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
