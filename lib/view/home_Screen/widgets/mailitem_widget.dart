import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/view/dummy_db.dart';

class MailItemWidget extends StatelessWidget {
  const MailItemWidget({
    required this.title,
    required this.description,
    required this.content,
    required this.time,
    required this.isRead,
    required this.isstared,
    this.logourl = "",
    this.logocolor = Colors.transparent,
  });
  final String title, description, content, time, logourl;
  final Color logocolor;
  final bool isRead, isstared;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7, bottom: 7, left: 3),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Expanded(
        flex: 1,
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
            SizedBox(width: kPadding - 10),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight:
                                isRead ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: isRead ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          content,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      isstared
                          ? Icon(
                              Icons.star,
                              color: ColorConst.DARK_BLUE,
                            )
                          : Icon(Icons.star_border),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
