import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/utils/image_constant.dart';
import 'package:gmail_clone/view/dummy_db.dart';
import 'package:gmail_clone/view/home_Screen/sections/buildaccount_section.dart';
import 'package:gmail_clone/view/home_Screen/sections/drawer_section.dart';

class GooglemeetScreen extends StatefulWidget {
  @override
  _GooglemeetScreenState createState() => _GooglemeetScreenState();
}

class _GooglemeetScreenState extends State<GooglemeetScreen> {
  PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerSection(),
      backgroundColor: ColorConst.WHITE,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            GooglemeetHeader_Section(),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    child: InkWell(
                      onTap: () {
                        Scaffold.of(context).showBottomSheet(
                          (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                ),
                                color: ColorConst.SECOND_BLUE,
                              ),
                              height: 200,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(Icons.photo,
                                          color: ColorConst.BG_COLOR),
                                      title: Text('Get a meeting link to share',
                                          style: TextStyle(
                                              color: ColorConst.BG_COLOR)),
                                      onTap: () {
                                        // Handle tap
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.videocam_outlined,
                                          color: ColorConst.BG_COLOR),
                                      title: Text('Start an instant meeting',
                                          style: TextStyle(
                                              color: ColorConst.BG_COLOR)),
                                      onTap: () {
                                        // Handle tap
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.calendar_today,
                                          color: ColorConst.BG_COLOR),
                                      title: Text('Shedule in Google Calender',
                                          style: TextStyle(
                                              color: ColorConst.BG_COLOR)),
                                      onTap: () {
                                        // Handle tap
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: ColorConst.DARK_BLUE,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "New Meeting",
                            style: TextStyle(color: ColorConst.WHITE),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Join with Code",
                          style: TextStyle(color: ColorConst.DARK_BLUE),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Carousel section
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildCarouselPage(ImagePath.GOOGLEMEET1),
                  _buildCarouselPage(ImagePath.GOOGLEMEET2),
                ],
              ),
            ),
            // Carousel Indicator
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: _buildPageIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselPage(String imagePath) {
    return Container(
      color: ColorConst.WHITE, // Background color for images
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        2, // Number of pages in the carousel
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? ColorConst.DARK_BLUE : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget GooglemeetHeader_Section() {
    return Container(
      color: ColorConst.WHITE,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 24,
              color: Colors.black54,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Meet",
                  style: TextStyle(
                      color: ColorConst.BG_COLOR,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                ))),
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
    );
  }
}
