import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/view/dummy_db.dart';

class BottomnavSection extends StatefulWidget {
  const BottomnavSection({
    Key? key,
    required this.isScrollingDown,
    required this.selectedIndex,
    required this.onNavItemTapped,
  }) : super(key: key);

  final bool isScrollingDown;
  final int selectedIndex;
  final void Function(int) onNavItemTapped;

  @override
  State<BottomnavSection> createState() => _BottomnavSectionState();
}

class _BottomnavSectionState extends State<BottomnavSection> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    int readCount = mailList.where((mail) => mail.isRead).length;

    return !widget.isScrollingDown
        ? Container(
            color: ColorConst.BOTTON_APPBARCOLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildNavItem(
                    Icons.mail, Icons.mail_outline, 'Mail', 0, readCount),
                _buildNavItem(Icons.videocam, Icons.videocam_outlined,
                    'Video Call', 1, 0),
              ],
            ),
          )
        : SizedBox.shrink();
  }

  Widget _buildNavItem(IconData selectedIcon, IconData unselectedIcon,
      String label, int index, int readCount) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
          widget.onNavItemTapped(index);
        });
      },
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: currentIndex == index ? ColorConst.LIGHT_BLUE : null,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              currentIndex == index ? selectedIcon : unselectedIcon,
            ),
          ),
        ),
        Positioned(
            right: 0,
            top: 5,
            child: readCount > 0
                ? Container(
                    width: 25,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorConst.RED),
                    child: Center(
                      child: Text(
                        readCount > 0 ? readCount.toString() : '',
                        style: TextStyle(color: ColorConst.WHITE),
                      ),
                    ))
                : SizedBox())
      ]),
    );
  }
}
