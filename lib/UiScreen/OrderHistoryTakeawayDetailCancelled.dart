import 'dart:async';

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/Widget/toolbar_with_title_type.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Styles/my_strings.dart';
import '../Widget/Textfield.dart';
import '../Widget/box_shadow.dart';
import '../Widget/common_blue_border_button.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/cooking_instruction_widget.dart';
import '../Widget/customer_detail_widget.dart';
import '../Widget/items_widget.dart';
import '../Widget/payment_summery_widget.dart';
import '../Widget/toolbar_with_title.dart';

class OrderHistoryTakeawayDetailCancelled extends StatefulWidget {
  const OrderHistoryTakeawayDetailCancelled({Key? key}) : super(key: key);

  @override
  State<OrderHistoryTakeawayDetailCancelled> createState() =>
      _OrderHistoryTakeawayDetailCancelledState();
}

class _OrderHistoryTakeawayDetailCancelledState
    extends State<OrderHistoryTakeawayDetailCancelled> {
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
          ToolbarWithTitleType("Order #13311212", "Cancelled", red_d9534f),
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

                    /*pickup layout*/
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
                                text: "Pickup at: "),
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
                                text: "Order: "),
                            TextSpan(
                                style: TextStyle(
                                    color: light_black_5f6d7b,
                                    fontFamily: fontMavenProMedium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                text: "12 Arp, 2022 at 8.30 PM")
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
                                text: "Cancelled: "),
                            TextSpan(
                                style: TextStyle(
                                    color: red_d9534f,
                                    fontFamily: fontMavenProMedium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                text: "by customer")
                          ]))
                        ],
                      ),
                    ),

                    /*customer detail*/
                    const CustomerDetail(),

                    /*item layout*/
                    const Items(),

                    /*Cooking Instructions*/
                    const CookingInstruction(),

                    /*Payment Summary*/
                    const PaymentSummery()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
