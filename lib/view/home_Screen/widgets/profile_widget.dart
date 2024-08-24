import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    required this.name,
    required this.mail,
    required this.imgPath,
    this.ismainprofile = false,
    this.notificationcount = 0,
    this.isicon = false,
    this.profileicon,
  });
  final String name, mail, imgPath;
  final bool ismainprofile, isicon;
  final int notificationcount;
  final IconData? profileicon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          isicon
              ? Icon(profileicon)
              : CircleAvatar(radius: 20, backgroundImage: AssetImage(imgPath)),
          Positioned(
              bottom: -5,
              right: -3,
              child: ismainprofile
                  ? CircleAvatar(
                      radius: 12,
                      backgroundColor: ColorConst.WHITE,
                      child: Icon(
                        Icons.camera_alt,
                        size: 16,
                      ),
                    )
                  : SizedBox())
        ],
      ),
      title: Text(
        name,
        style: TextStyle(
            color: ColorConst.BG_COLOR,
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ),
      subtitle: Row(
        children: [
          Text(mail,
              style: TextStyle(
                  color: ColorConst.SECONDRY_TEXT,
                  fontWeight: FontWeight.normal,
                  fontSize: 14)),
          Spacer(),
          Text(notificationcount == 0 ? '' : notificationcount.toString())
        ],
      ),
      onTap: () {},
    );
  }
}
