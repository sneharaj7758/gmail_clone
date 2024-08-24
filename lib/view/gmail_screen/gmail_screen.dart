import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/utils/image_constant.dart';
import 'package:gmail_clone/view/dummy_db.dart';
import 'package:gmail_clone/view/home_Screen/sections/buildaccount_section.dart';
import 'package:gmail_clone/view/home_Screen/sections/drawer_section.dart';
import 'package:gmail_clone/view/home_Screen/widgets/fab_widget.dart';
import 'package:gmail_clone/view/home_Screen/widgets/mailitem_widget.dart';
import 'package:gmail_clone/view/mail_detail_screen/mail_detail_screen.dart';

class GmailScreen extends StatefulWidget {
  final String title;
  final int index;

  GmailScreen({required this.title, required this.index});
  @override
  State<GmailScreen> createState() => _GmailScreenState();
}

class _GmailScreenState extends State<GmailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool _isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!_isScrollingDown) {
        setState(() {
          _isScrollingDown = true;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (_isScrollingDown) {
        setState(() {
          _isScrollingDown = false;
        });
      }
    }
  }

  List<MailItem> _getFilteredMailList() {
    if (widget.index == 1) {
      return mailList.where((mail) => mail.is_primary).toList();
    } else if (widget.index == 2) {
      return mailList.where((mail) => mail.is_social).toList();
    } else if (widget.index == 3) {
      return mailList.where((mail) => mail.is_promotion).toList();
    } else if (widget.index == 4) {
      return mailList.where((mail) => mail.is_stared).toList();
    } else if (widget.index == 5) {
      return mailList.where((mail) => mail.is_snoozed).toList();
    } else if (widget.index == 6) {
      return mailList.where((mail) => mail.isimportant).toList();
    } else if (widget.index == 7) {
      return mailList.where((mail) => mail.issent).toList();
    } else if (widget.index == 8) {
      return mailList.where((mail) => mail.issheduled).toList();
    } else if (widget.index == 9) {
      return mailList.where((mail) => mail.isoutbox).toList();
    } else if (widget.index == 10) {
      return mailList.where((mail) => mail.isdraft).toList();
    } else {
      return mailList;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMailList = _getFilteredMailList();

    return Scaffold(
      backgroundColor: ColorConst.WHITE,
      key: _scaffoldKey,
      drawer: DrawerSection(),
      body: SafeArea(
          child: Column(
        children: [
          !_isScrollingDown
              ? _BuildHomeheader(
                  scaffoldKey: _scaffoldKey,
                  index: widget.index,
                  title: widget.title,
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: filteredMailList.isEmpty
                ? _buildNoResultsWidget(widget.title)
                : ListView.builder(
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    itemCount: filteredMailList.length,
                    itemBuilder: (context, index) {
                      final mail = filteredMailList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MailDetailScreen(
                              heading: mail.description,
                              mail: mail.title,
                              time: mail.time,
                              is_stared: mail.is_stared,
                              logourl: mail.logourl,
                              logocolor: mail.logocolor,
                              content: mail.content,
                              title: mail.content,
                            ),
                          ));
                        },
                        child: MailItemWidget(
                          title: mail.title,
                          description: mail.description,
                          content: mail.content,
                          time: mail.time,
                          isRead: mail.isRead,
                          isstared: mail.is_stared,
                          logourl: mail.logourl,
                          logocolor: mail.logocolor,
                        ),
                      );
                    },
                  ),
          ),
        ],
      )),
      floatingActionButton: FabWidget(isScrollingDown: _isScrollingDown),
    );
  }

  Widget _buildNoResultsWidget(String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagePath.NOMAIL,
            height: 200,
            width: 200,
          ),
          Text(
            " Nothing in $title",
            style: TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}

Widget _buildButton(BuildContext context, String text) {
  return GestureDetector(
    onTap: () {
      _showBottomSheet(context, text);
    },
    child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorConst.GREY),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: ColorConst.BG_COLOR,
              ),
            ),
            Icon(Icons.arrow_drop_down)
          ],
        )),
  );
}

void _showBottomSheet(BuildContext context, String title) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Details about $title',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    },
  );
}

class _BuildHomeheader extends StatelessWidget {
  const _BuildHomeheader(
      {required this.scaffoldKey, required this.index, required this.title});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    int importantCount = mailList.where((mail) => mail.isimportant).length;
    int sentCount = mailList.where((mail) => mail.issent).length;
    int sheduledCount = mailList.where((mail) => mail.issheduled).length;
    int outboxCount = mailList.where((mail) => mail.isoutbox).length;
    int draftCount = mailList.where((mail) => mail.isdraft).length;
    int allmailsCount = mailList.length;

    bool shouldShowSecondHeader = (index == 6 && importantCount > 0) ||
        (index == 7 && sentCount > 0) ||
        (index == 8 && sheduledCount > 0) ||
        (index == 9 && outboxCount > 0) ||
        (index == 10 && draftCount > 0) ||
        (index == 11 && allmailsCount > 0);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xffe9edf6)),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 24,
                  color: Colors.black54,
                ),
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search here',
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      isDense: false,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => BuildaccountSection(),
                  );
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(ImagePath.PROFILE1),
                ),
              ),
              SizedBox(width: kPadding - 15),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        shouldShowSecondHeader ? buildSecondHeader(title: title) : SizedBox()
      ],
    );
  }
}

class buildSecondHeader extends StatelessWidget {
  const buildSecondHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildButton(context, title),
          SizedBox(width: 10),
          _buildButton(context, 'From'),
          SizedBox(width: 10),
          _buildButton(context, 'To'),
          SizedBox(width: 10),
          _buildButton(context, 'Attachment'),
          SizedBox(width: 10),
          _buildButton(context, 'Date'),
          SizedBox(width: 10),
          _buildButton(context, 'Is Unread'),
          SizedBox(width: 10),
          _buildButton(context, 'Exclude Calendar Updates'),
        ],
      ),
    );
  }
}
