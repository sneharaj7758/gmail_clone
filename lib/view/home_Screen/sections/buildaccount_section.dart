import 'package:flutter/material.dart';
import 'package:gmail_clone/utils/color_const.dart';
import 'package:gmail_clone/utils/image_constant.dart';
import 'package:gmail_clone/view/home_Screen/widgets/profile_widget.dart';

class BuildaccountSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorConst.APPBAR_COLOR,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.close),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    'Google',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConst.WHITE,
                ),
                child: Column(
                  children: [
                    ProfileWidget(
                      name: 'Sneha Raj',
                      mail: 'snehamol223@gmail.com',
                      imgPath: ImagePath.PROFILE2,
                      ismainprofile: true,
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 220,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: ColorConst.SECONDRY_TEXT, width: 0.5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          'Manage your Google account',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 25),
                      child: Row(
                        children: [
                          Icon(
                            Icons.cloud_outlined,
                            size: 18,
                          ),
                          SizedBox(width: 25),
                          Text("Storage used: 78% of 15 GB",
                              style: TextStyle(
                                  color: ColorConst.BG_COLOR,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13)),
                        ],
                      ),
                    ),
                    ProfileWidget(
                      name: 'Suraj Pr',
                      mail: 'surajravi45@gmail.com',
                      imgPath: ImagePath.PROFILE1,
                      notificationcount: 6,
                    ),
                    ProfileWidget(
                      name: 'Shani Vinod',
                      mail: 'shann23@gmail.com',
                      imgPath: ImagePath.PROFILE3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 18),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_add,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Text("Add another Account",
                              style: TextStyle(
                                  color: ColorConst.BG_COLOR,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 18),
                      child: Row(
                        children: [
                          Icon(
                            Icons.manage_accounts_outlined,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Text("Manage account ",
                              style: TextStyle(
                                  color: ColorConst.BG_COLOR,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Privacy policy",
                      style: TextStyle(
                          color: ColorConst.BG_COLOR,
                          fontWeight: FontWeight.w500,
                          fontSize: 15)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(".",
                      style: TextStyle(
                          color: ColorConst.BG_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Terms of service",
                      style: TextStyle(
                          color: ColorConst.BG_COLOR,
                          fontWeight: FontWeight.w500,
                          fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
