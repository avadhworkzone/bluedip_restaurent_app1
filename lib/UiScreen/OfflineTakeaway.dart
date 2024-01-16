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

import '../Styles/my_strings.dart';
import '../Widget/Textfield.dart';
import '../Widget/box_shadow.dart';
import '../Widget/common_blue_border_button.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/drop_down_box_shadow.dart';
import '../Widget/toolbar_with_title.dart';

class OfflineTakeaway extends StatefulWidget {
  const OfflineTakeaway({Key? key}) : super(key: key);

  @override
  State<OfflineTakeaway> createState() => _OfflineTakeawayState();
}

class _OfflineTakeawayState extends State<OfflineTakeaway> {
  final List<String> itemPercent = [
    'FLAT20',
    'FLAT230',
    'FLAT40',
    'FLAT50',
  ];
  String? selectedPercent;
  final _TextController = TextEditingController();
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
          ToolbarWithTitle("Offline Takeaway"),
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
                    Text("Enter Coupon Code",
                        style: TextStyle(
                            color: black_354356,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,
                            fontFamily: fontMavenProRegular),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 6.h,
                    ),

                    /*Percent Drop Down Menu*/
                    Container(
                      decoration: boxDecoration,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          dropdownDecoration: drop_down_box_shadow,
                          isExpanded: true,
                          icon: SvgPicture.asset(icon_down_arrow),
                          hint: Text(
                            str_select_your_role,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: black_354356,
                                fontFamily: fontMavenProMedium),
                          ),
                          items: itemPercent
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: black_354356,
                                          fontFamily: fontMavenProMedium),
                                    ),
                                  ))
                              .toList(),
                          value: selectedPercent,
                          onChanged: (value) {
                            setState(() {
                              selectedPercent = value as String;
                            });
                          },
                          itemPadding:
                              const EdgeInsets.only(left: 20, right: 0),
                          buttonPadding:
                              const EdgeInsets.only(left: 0, right: 12),
                          dropdownMaxHeight: 175,
                          scrollbarThickness: 3,
                          offset: const Offset(0, -5),
                          scrollbarAlwaysShow: true,
                        ),
                      ),
                    ),

                    /*customer detail*/
                    Container(
                      width: double.infinity,
                      decoration: boxDecoration,
                      padding: EdgeInsets.all(14.r),
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Customer Detail
                          Text("Customer Detail".toUpperCase(),
                              style: TextStyle(
                                  color: grey_969da8,
                                  fontFamily: fontMavenProMedium,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: Container(
                                  height: 48.h,
                                  width: 48.w,
                                  child: Image.asset(img_girl),
                                ),
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Jenny
                                    Text("Jenny",
                                        style: TextStyle(
                                            color: black_354356,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: fontMavenProProSemiBold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.sp),
                                        textAlign: TextAlign.left),

                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text("+1 1322131221",
                                        style: TextStyle(
                                            color: grey_969da8,
                                            fontFamily: fontMavenProRegular,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left)
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

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
                    Text("Enter Bill Amount (Rs)",
                        style: TextStyle(
                            color: black_354356,
                            fontStyle: FontStyle.normal,
                            fontFamily: fontMavenProRegular,
                            fontSize: 14.sp),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 6.h,
                    ),
                    loginTextformField(
                      "",
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      controller: _TextController,
                      obscureText: true,
                      onChanged: (value) {},
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
                                            SvgPicture.asset(icon_info_cirlce)),
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
                CommonBlueButton(
                    "complete takeaway".toUpperCase(), () {}, blue_3653f6),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
