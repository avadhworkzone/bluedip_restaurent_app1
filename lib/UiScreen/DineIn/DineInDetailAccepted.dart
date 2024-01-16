import 'dart:async';

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/blue_box_shadow.dart';
import '../../Widget/booking_detail_widget.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/common_blue_border_button.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/customer_detail_widget.dart';
import '../../Widget/toolbar_with_title.dart';

class DineInDetailAccepted extends StatefulWidget {
  const DineInDetailAccepted({Key? key}) : super(key: key);

  @override
  State<DineInDetailAccepted> createState() => _DineInDetailAcceptedState();
}

class _DineInDetailAcceptedState extends State<DineInDetailAccepted> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return SafeArea(
        child: Scaffold(
      backgroundColor: bg_f3f5f9,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToolbarWithTitle("Booking #13311212"),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),

                    /*booking layout*/
                    Container(
                      width: double.infinity,
                      decoration: boxDecoration,
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Pickup at: 9:00 PM
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(
                                    color: light_black_5f6d7b,
                                    fontFamily: fontMavenProRegular,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                text: "Booking for: "),
                            TextSpan(
                                style: TextStyle(
                                    color: Blue_5468ff,
                                    fontFamily: fontMavenProMedium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                text: "9:00 PM")
                          ])),
                          SizedBox(
                            height: 10.h,
                          ),
                          // Order: 12 Arp, 2022 at 8.30 PM
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(
                                    color: light_black_5f6d7b,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: fontMavenProRegular,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                text: "Booking: "),
                            TextSpan(
                                style: TextStyle(
                                    color: light_black_5f6d7b,
                                    fontFamily: fontMavenProMedium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                text: "12 Arp, 2022 at 8.30 PM")
                          ]))
                        ],
                      ),
                    ),

                    /*customer detail*/
                    const CustomerDetail(),

                    /*Booking Details*/
                    const BookingDetail()
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color(0x0f041d42),
                    offset: Offset(0, 3),
                    blurRadius: 21,
                    spreadRadius: 0)
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*bottom two buttons here*/
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 13.h),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: grey_d9dde3),
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.transparent),
                          child: // Frame 34242
                              Text("Guest didn't come",
                                  style: TextStyle(
                                      color: orange_d6483d,
                                      fontFamily: fontMavenProMedium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.center),
                        )),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(14.r),
                          decoration: blueboxDecoration,
                          child: // Frame 34242
                              Text("ACCEPT ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: fontMavenProMedium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.center),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
