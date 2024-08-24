import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/view/syncerror_screen/syncerror_screen.dart';
import 'package:gmail_clone/view/updategmailapp_screen/updategmailapp_screen.dart';
import 'package:gmail_clone/view/webview_screen/webview_screen.dart';

class HelpandfeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help"),
          actions: [Icon(Icons.more_vert_outlined)],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Popular help resources",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                _displayOptions(
                  displaytext:
                      "How do I change or reset my Google Account Password",
                  iconData: Icons.article_outlined,
                  onOptionTap: () {
                    final url =
                        'https://support.google.com/mail/answer/41078?hl=en&sjid=2095941361487559592-AP';

                    _navigateToWebPage(context, url);
                  },
                ),
                _displayOptions(
                  displaytext: "Update your Gmail App",
                  iconData: Icons.article_outlined,
                  onOptionTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdategmailappScreen(),
                      ),
                    );
                  },
                ),
                _displayOptions(
                  displaytext: "Sign Out of Gmail",
                  iconData: Icons.article_outlined,
                  onOptionTap: () {
                    final url =
                        'https://support.google.com/mail/answer/8154?hl=en&ref_topic=2467017&sjid=2095941361487559592-AP';

                    _navigateToWebPage(context, url);
                  },
                ),
                _displayOptions(
                  displaytext: "Gmail message Recovery Tool",
                  iconData: Icons.add,
                  onOptionTap: () {},
                ),
                _displayOptions(
                  displaytext: "Fix sync error with the Gmail Android App",
                  iconData: Icons.article_outlined,
                  onOptionTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SyncerrorScreen(),
                      ),
                    );
                  },
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Color(0xffe9edf6)),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 24,
                            color: Colors.black54,
                          ),
                          onPressed: () {},
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search help',
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              isDense: false,
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                _displayOptions(
                  displaytext: "send Feedback",
                  iconData: Icons.feedback_outlined,
                  onOptionTap: () {},
                ),
                Divider(),
              ]),
        )));
  }

  void _navigateToWebPage(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebviewScreen(url: url),
      ),
    );
  }
}

class _displayOptions extends StatelessWidget {
  _displayOptions(
      {required this.displaytext,
      required this.iconData,
      required this.onOptionTap});
  final String displaytext;
  final IconData iconData;
  final Function() onOptionTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onOptionTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: ColorConst.SECONDBLUE,
              child: Icon(
                iconData,
                color: ColorConst.THIRDBLUE,
                size: 25,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(child: Text(displaytext))
          ],
        ),
      ),
    );
  }
}
