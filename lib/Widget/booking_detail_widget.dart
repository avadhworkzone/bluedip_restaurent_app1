import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_font.dart';
import '../Styles/my_icons.dart';
import 'box_shadow.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({Key? key}) : super(key: key);

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: boxDecoration,
          padding: EdgeInsets.all(14.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Customer Detail
              Text("Booking Details".toUpperCase(),
                  style: TextStyle(
                      color: grey_969da8,
                      fontFamily: fontMavenProMedium,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.sp),
                  textAlign: TextAlign.left),
              SizedBox(
                height: 14.h,
              ),
              // Make it little spicy
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Guest",
                      style: TextStyle(
                          color: light_black_5f6d7b,
                          fontFamily: fontMavenProMedium,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp),
                      textAlign: TextAlign.left),
                  Text("2",
                      style: TextStyle(
                          color: black_354356,
                          fontFamily: fontMavenProProSemiBold,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp),
                      textAlign: TextAlign.left),
                ],
              ),

              SizedBox(
                height: 8.h,
              ),
              // Make it little spicy
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Offer",
                      style: TextStyle(
                          color: Blue_5468ff,
                          fontFamily: fontMavenProMedium,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp),
                      textAlign: TextAlign.left),
                  Text("30% off",
                      style: TextStyle(
                          color: Blue_5468ff,
                          fontFamily: fontMavenProProSemiBold,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp),
                      textAlign: TextAlign.left),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
