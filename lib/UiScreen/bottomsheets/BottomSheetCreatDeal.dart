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

class BottomSheetCreatDeal extends StatefulWidget {
  const BottomSheetCreatDeal({Key? key}) : super(key: key);

  @override
  State<BottomSheetCreatDeal> createState() => _BottomSheetCreatDealState();
}

class _BottomSheetCreatDealState extends State<BottomSheetCreatDeal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 22.h,
              ),
              // Daily Opportunities
              Center(
                child: Image.asset(
                  img_girl_creat_deal,
                  width: 210.w,
                  height: 102.h,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              Text(
                  "Fill the form to publish an offer to the \nBluedip and attract more customers to \nyour restaurant.",
                  style: TextStyle(
                      color: black_354356,
                      fontFamily: fontMavenProMedium,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                      height: 1.5),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: 164.w,
                child: CommonBlueButton("OK".toUpperCase(),
                    () => Navigator.pop(context, false), blue_3653f6),
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
