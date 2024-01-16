import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_font.dart';
import '../../Styles/my_icons.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/box_shadow_ticket.dart';
import '../../Widget/box_shadow_ticket_second.dart';
import '../../Widget/common_blue_border_button.dart';
import '../../Widget/common_blue_button.dart';

class BottomSheetLogout extends StatefulWidget {
  const BottomSheetLogout({Key? key}) : super(key: key);

  @override
  State<BottomSheetLogout> createState() => _BottomSheetLogoutState();
}

class _BottomSheetLogoutState extends State<BottomSheetLogout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.h,
              ),
              // Daily Opportunities
              Center(
                child: Text("Sign out from Bluedip",
                    style: TextStyle(
                        color: black_354356,
                        fontFamily: fontJosefinSansBold,
                        fontStyle: FontStyle.normal,
                        fontSize: 18.sp,
                        height: 1.5),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 10.h,
              ),
              // Ready(1)
              Text(
                  "Are you sure you would like to sign out of \nyour Bluedip account? ",
                  style: TextStyle(
                      color: black_354356,
                      fontFamily: fontMavenProMedium,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 25.h,
              ),
              /*bottom two buttons here*/
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CommonBlueButton(
                          strCancel.toUpperCase(), () {}, blue_3653f6)),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                      flex: 1,
                      child: CommonBlueBorderButton("Sign Out".toUpperCase(),
                          () {}, Blue_5468ff, Colors.transparent, Blue_5468ff)),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
