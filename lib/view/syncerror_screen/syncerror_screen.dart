import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/view/helpandfeedbackheader_section.dart';
import 'package:gmail_clone/view/home_Screen/widgets/displaytext_widget.dart';

class SyncerrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HelpandfeedbackheaderSection(true),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  DisplaytextWidget(
                      "Fix sync errors with the Gmail Android app",
                      25,
                      FontWeight.normal,
                      Colors.black),
                  DisplaytextWidget(
                      "If your Gmail app isn't syncing automatically, you might notice the following problems:",
                      17,
                      FontWeight.normal,
                      Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      DisplaytextWidget(".", 25, FontWeight.bold, Colors.black),
                      SizedBox(
                        width: 7,
                      ),
                      DisplaytextWidget(
                          "Can't send emails, or emails are stuck in send",
                          16,
                          FontWeight.normal,
                          Colors.black),
                    ],
                  ),
                  Row(
                    children: [
                      DisplaytextWidget(".", 25, FontWeight.bold, Colors.black),
                      SizedBox(
                        width: 7,
                      ),
                      DisplaytextWidget("Not receiving new emails", 16,
                          FontWeight.normal, Colors.black),
                    ],
                  ),
                  Row(
                    children: [
                      DisplaytextWidget(".", 25, FontWeight.bold, Colors.black),
                      SizedBox(
                        width: 7,
                      ),
                      DisplaytextWidget(
                        "Can't open or read emails",
                        16,
                        FontWeight.normal,
                        Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DisplaytextWidget(".", 25, FontWeight.bold, Colors.black),
                      SizedBox(
                        width: 7,
                      ),
                      DisplaytextWidget(
                        "'Account not synced' error",
                        16,
                        FontWeight.normal,
                        Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DisplaytextWidget(".", 25, FontWeight.bold, Colors.black),
                      SizedBox(
                        width: 7,
                      ),
                      DisplaytextWidget(
                        "Gmail app is very slow",
                        16,
                        FontWeight.normal,
                        Colors.black,
                      ),
                    ],
                  ),
                  CustomExpansionTile(
                    title: 'Not receiving notifications',
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DisplaytextWidget(
                                  'Check your Gmail notifications settings. If that doesnt work, try the troubleshooting steps below.',
                                  16,
                                  FontWeight.normal,
                                  ColorConst.BG_COLOR),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          )),
                    ],
                  ),
                  CustomExpansionTile(
                    title:
                        'Not receiving mail from Yahoo, Outlook or other non-Gmail accounts ',
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DisplaytextWidget(
                                "on your computer open your non-Gmail account.",
                                16,
                                FontWeight.normal,
                                Colors.black,
                              ),
                              Row(
                                children: [
                                  DisplaytextWidget(
                                      ".", 25, FontWeight.normal, Colors.black),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  DisplaytextWidget(
                                      "If you're not receiving new messages, search for tips from that email provider.",
                                      16,
                                      FontWeight.normal,
                                      Colors.black),
                                ],
                              ),
                              Row(
                                children: [
                                  DisplaytextWidget(
                                      ".", 25, FontWeight.normal, Colors.black),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  DisplaytextWidget(
                                      "If everything looks fine, try the troubleshooting steps below.",
                                      16,
                                      FontWeight.normal,
                                      Colors.black),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              DisplaytextWidget('Troubleshooting steps', 16,
                                  FontWeight.normal, ColorConst.DARK_BLUE),
                              DisplaytextWidget(
                                  'After youve tried each step, check to see if the problem has been fixed.',
                                  16,
                                  FontWeight.normal,
                                  ColorConst.DARK_BLUE),
                              DisplaytextWidget('Step 1: Update your Gmail app',
                                  16, FontWeight.normal, ColorConst.DARK_BLUE),
                              DisplaytextWidget(
                                  'To get the latest fixes on problems with sending or receiving email, update your Gmail app.',
                                  16,
                                  FontWeight.normal,
                                  ColorConst.DARK_BLUE),
                              DisplaytextWidget('Step 2: Restart your device',
                                  16, FontWeight.normal, ColorConst.DARK_BLUE),
                              DisplaytextWidget('Step 3: Check your settings',
                                  16, FontWeight.normal, ColorConst.DARK_BLUE),
                            ],
                          )),
                    ],
                  ),
                ]))));
  }

  Column buildtabview(String displaytext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          width: 170,
          height: 30,
          decoration: BoxDecoration(
              color: ColorConst.DARK_BLUE,
              borderRadius: BorderRadius.circular(5)),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                "Update your Gmail app",
                style: TextStyle(color: ColorConst.WHITE),
              )),
        ),
        SizedBox(
          height: 20,
        ),

        DisplaytextWidget(
          displaytext,
          16,
          FontWeight.normal,
          Colors.black,
        ),

        DisplaytextWidget(
          "What you can do with the latest Gmail app",
          23,
          FontWeight.bold,
          Colors.black,
        ),
        DisplaytextWidget(
          "After you update the app, you’ll find these changes to Gmail.",
          16,
          FontWeight.normal,
          Colors.black,
        ),
        CustomExpansionTile(
          title: 'Secure your Account',
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DisplaytextWidget(
                      "You get the latest security fixes and alerts, such as:",
                      16,
                      FontWeight.normal,
                      Colors.black,
                    ),
                    Row(
                      children: [
                        DisplaytextWidget(
                            ".", 25, FontWeight.normal, Colors.black),
                        SizedBox(width: 7),
                        DisplaytextWidget(
                          "Warnings when messages aren't secure",
                          16,
                          FontWeight.normal,
                          Colors.black,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DisplaytextWidget(
                            ".", 25, FontWeight.normal, Colors.black),
                        SizedBox(width: 7),
                        DisplaytextWidget(
                          "Warnings about suspicious senders",
                          16,
                          FontWeight.normal,
                          Colors.black,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DisplaytextWidget(
                            ".", 25, FontWeight.normal, Colors.black),
                        SizedBox(width: 7),
                        DisplaytextWidget(
                          "Better authentication and sync ",
                          16,
                          FontWeight.normal,
                          Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    DisplaytextWidget(
                        'Learn how to check security alerts in the latest Gmail app.',
                        16,
                        FontWeight.normal,
                        ColorConst.DARK_BLUE),
                  ],
                )),
          ],
        ),

        CustomExpansionTile(
          title: 'Secure your Account',
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DisplaytextWidget(
                      "You get the latest security fixes and alerts, such as:",
                      16,
                      FontWeight.normal,
                      Colors.black,
                    ),
                    Row(
                      children: [
                        DisplaytextWidget(
                            ".", 25, FontWeight.normal, Colors.black),
                        SizedBox(
                          width: 7,
                        ),
                        DisplaytextWidget(
                            "Warnings when messages aren't secure",
                            16,
                            FontWeight.normal,
                            Colors.black),
                      ],
                    ),
                    Row(
                      children: [
                        DisplaytextWidget(
                            ".", 25, FontWeight.normal, Colors.black),
                        SizedBox(
                          width: 7,
                        ),
                        DisplaytextWidget("Warnings about suspicious senders",
                            16, FontWeight.normal, Colors.black),
                      ],
                    ),
                    Row(
                      children: [
                        DisplaytextWidget(
                            ".", 25, FontWeight.normal, Colors.black),
                        SizedBox(
                          width: 7,
                        ),
                        DisplaytextWidget("Better authentication and sync ", 16,
                            FontWeight.normal, Colors.black),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    DisplaytextWidget(
                        'Learn how to check security alerts in the latest Gmail app.',
                        16,
                        FontWeight.normal,
                        ColorConst.DARK_BLUE),
                  ],
                )),
          ],
        ),
        CustomExpansionTile(
          title: 'Change font, colors and formats',
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DisplaytextWidget(
                        'Make messages easier to read with bold, colours and other formats. Gmail shows your messages as though you sent them from a computer.',
                        16,
                        FontWeight.normal,
                        ColorConst.BG_COLOR),
                    SizedBox(
                      height: 15,
                    ),
                    DisplaytextWidget('Learn how to change your formatting.',
                        16, FontWeight.normal, ColorConst.DARK_BLUE)
                  ],
                )),
          ],
        ),
        CustomExpansionTile(
          title: 'Block unwanted mails',
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DisplaytextWidget(
                        'If you get messages you dont want, you can now block or unsubscribe from those messages.',
                        16,
                        FontWeight.normal,
                        ColorConst.BG_COLOR),
                    SizedBox(
                      height: 15,
                    ),
                    DisplaytextWidget('Learn how to block senders.', 16,
                        FontWeight.normal, ColorConst.DARK_BLUE)
                  ],
                )),
          ],
        ),
        CustomExpansionTile(
          title: 'Use Gmail features with other accounts',
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DisplaytextWidget(
                        'You can use Gmail features on other accounts that you add to the Gmail app.',
                        16,
                        FontWeight.normal,
                        ColorConst.BG_COLOR),
                    SizedBox(
                      height: 15,
                    ),
                    DisplaytextWidget(
                        'Learn how to get Gmail features for Yahoo, Outlook and other non-Gmail accounts.',
                        16,
                        FontWeight.normal,
                        ColorConst.DARK_BLUE)
                  ],
                )),
          ],
        ),
        CustomExpansionTile(
          title: 'See all your inboxes',
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DisplaytextWidget(
                      'If youve added other accounts to the Gmail app, you can now check all your accounts in one inbox.',
                      16,
                      FontWeight.normal,
                      ColorConst.BG_COLOR),
                  SizedBox(
                    height: 15,
                  ),
                  DisplaytextWidget('Learn how to check all your accounts.', 16,
                      FontWeight.normal, ColorConst.DARK_BLUE)
                ],
              ),
            ),
          ],
        ),

        // Add more Android-specific features here
      ],
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;

  CustomExpansionTile({required this.title, required this.children});

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.title,
        style: TextStyle(color: ColorConst.DARK_BLUE),
      ),
      trailing: Icon(
        _expanded
            ? Icons.keyboard_arrow_up_outlined
            : Icons.keyboard_arrow_down_outlined,
        color: ColorConst.DARK_BLUE,
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _expanded = expanded;
        });
      },
      children: widget.children,
    );
  }
}
