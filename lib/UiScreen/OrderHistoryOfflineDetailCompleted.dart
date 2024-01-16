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
import '../Widget/customer_detail_widget.dart';
import '../Widget/toolbar_with_title.dart';

class OrderHistoryOfflineDetailCompleted extends StatefulWidget {
  const OrderHistoryOfflineDetailCompleted({Key? key}) : super(key: key);

  @override
  State<OrderHistoryOfflineDetailCompleted> createState() =>
      _OrderHistoryOfflineDetailCompletedState();
}

class _OrderHistoryOfflineDetailCompletedState
    extends State<OrderHistoryOfflineDetailCompleted> {
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
          ToolbarWithTitleType("Order #13311212", "Completed", green_5cb85c),
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
                        ],
                      ),
                    ),

                    /*customer detail*/
                    const CustomerDetail(),

                    /*Coupon layout*/
                    Container(
                      width: double.infinity,
                      decoration: boxDecoration,
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Customer Detail
                          Text("Coupon".toUpperCase(),
                              style: TextStyle(
                                  color: grey_969da8,
                                  fontFamily: fontMavenProMedium,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 10.h,
                          ),
                          // Make it little spicy
                          Text("-50% off (FLAT50)",
                              style: TextStyle(
                                  color: Blue_5468ff,
                                  fontFamily: fontMavenProMedium,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp),
                              textAlign: TextAlign.left)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    /*Payment Summary*/
                    Container(
                      width: double.infinity,
                      decoration: boxDecoration,
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Customer Detail
                          Text("Payment Summary".toUpperCase(),
                              style: TextStyle(
                                  color: grey_969da8,
                                  fontFamily: fontMavenProMedium,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 14.h,
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text("Sub total",
                                    style: TextStyle(
                                        color: light_black_5f6d7b,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),
                              ),
                              // 250
                              Text("₹300",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Text("GST (5%)",
                                        style: TextStyle(
                                            color: light_black_5f6d7b,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    PopupMenuButton(
                                        offset: const Offset(15, -100),
                                        itemBuilder: (context) => [
                                              PopupMenuItem(
                                                  value: 1,
                                                  child: // Edit
                                                      // CGST(2.5%)
                                                      Text("CGST(2.5%)",
                                                          style: TextStyle(
                                                              color:
                                                                  light_black_5f6d7b,
                                                              fontFamily:
                                                                  fontMavenProMedium,
                                                              fontSize: 12.sp),
                                                          textAlign:
                                                              TextAlign.left)),
                                              PopupMenuItem(
                                                  value: 2,
                                                  child: // Edit
                                                      Text("SGST(2.5%)",
                                                          style: TextStyle(
                                                              color:
                                                                  light_black_5f6d7b,
                                                              fontFamily:
                                                                  fontMavenProMedium,
                                                              fontSize: 12.sp),
                                                          textAlign:
                                                              TextAlign.left)),
                                            ],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 10),
                                        child:
                                            SvgPicture.asset(icon_info_cirlce))
                                  ],
                                ),
                              ),
                              // 250
                              Text("₹15",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text("Packing Charges",
                                    style: TextStyle(
                                        color: light_black_5f6d7b,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),
                              ),
                              // 250
                              Text("₹35",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          const DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1.0,
                            dashLength: 4.0,
                            dashColor: divider_d4dce7,
                            dashRadius: 0.0,
                            dashGapLength: 4.0,
                            dashGapColor: Colors.transparent,
                            dashGapRadius: 0.0,
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text("Grand Total",
                                    style: TextStyle(
                                        color: light_black_5f6d7b,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),
                              ),
                              // 250
                              Text("₹350",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),

                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text("Coupon Discount",
                                    style: TextStyle(
                                        color: Blue_5468ff,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),
                              ),
                              // 250
                              Text("-₹50",
                                  style: TextStyle(
                                      color: Blue_5468ff,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text("Net Payable",
                                    style: TextStyle(
                                        color: black_354356,
                                        fontFamily: fontMavenProBold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),
                              ),
                              // Paid
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    color: Color(0x215cb85c)),
                                child: Text("PAID",
                                    style: TextStyle(
                                        color: green_5cb85c,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.right),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              // 250
                              Text("₹300",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                        ],
                      ),
                    ),
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
