import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/view/dummy_db.dart';
import 'package:gmail_clone/view/helpandfeedback_screen/helpandfeedback_screen.dart';
import 'package:gmail_clone/view/home_Screen/home_screen.dart';
import 'package:gmail_clone/view/setting_screen/setting_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerSection extends StatefulWidget {
  @override
  State<DrawerSection> createState() => _DrawerSectionState();
}

class _DrawerSectionState extends State<DrawerSection> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConst.APPBAR_COLOR,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gmail",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,

                  color: Colors.red, // Adjust color as needed
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 2,
                color: ColorConst.DIV_COLOR,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: drawerItems.length,
                  itemBuilder: (context, index) {
                    final item = drawerItems[index];
                    return buildDrawerItem(
                      item['icon'],
                      item['title'],
                      index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    if (index == 0) {
                      return Divider(
                        height: 2,
                        color: ColorConst.DIV_COLOR,
                      );
                    } else if (index == 5) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: Text(
                          'All labels',
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorConst.SECONDRY_TEXT,
                          ),
                        ),
                      );
                    } else if (index == 13) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 10, top: 10),
                        child: Text(
                          'Google apps',
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorConst.SECONDRY_TEXT,
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(height: 10);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = index;
          print("selctedindex$_selectedItem");

          Navigator.pop(context);

          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              print(_selectedItem);
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              print(_selectedItem);

              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              print(_selectedItem);

              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              break;
            case 5:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              break;
            case 6:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              break;
            case 7:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              break;
            case 8:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              break;
            case 9:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              break;
            case 10:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              break;
            case 11:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              break;
            case 12:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              break;
            case 13:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title, _selectedItem)),
              );
              break;
            case 14:
              lauchurl(
                  "https://play.google.com/store/apps/details?id=com.google.android.calendar");
              break;
            case 15:
              lauchurl(
                  "https://play.google.com/store/apps/details?id=com.google.android.contacts");

              break;
            case 16:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
              break;
            case 17:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HelpandfeedbackScreen()),
              );
              break;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.only(right: kPadding),
        decoration: BoxDecoration(
          color: index == _selectedItem ? Colors.blue.withOpacity(0.2) : null,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 24),
            SizedBox(width: kPadding),
            Text(title, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Future<void> lauchurl(String url) async {
    final Uri uri = Uri.parse(url); // Correctly parse the string URL to a Uri
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
