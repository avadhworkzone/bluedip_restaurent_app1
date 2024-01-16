import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_font.dart';
import '../Styles/my_icons.dart';
import 'box_shadow.dart';



class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
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
              Text("2 items".toUpperCase(),
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
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffedf0ff),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: // x1
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 4.h),
                      child: Text("x1",
                          style: TextStyle(
                              color: black_354356,
                              fontFamily: fontMavenProMedium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp),
                          textAlign: TextAlign.left),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  // Paneer Masala
                  Expanded(
                    flex: 1,
                    child: Text("Paneer Masala",
                        style: TextStyle(
                            color: black_354356,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontMavenProMedium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp),
                        textAlign: TextAlign.left),
                  ),
                  // 250
                  Row(
                    children: [
                      Image.asset(icon_rupee_slim,width: 10.w,height: 10.h,),
                      Text(
                          "250",
                          style:  TextStyle(
                              color:  black_354356,
                              fontFamily: fontMavenProProSemiBold,
                              fontSize: 14.sp
                          ),
                          textAlign: TextAlign.left
                      ),
                    ],
                  )
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
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffedf0ff),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: // x1
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 4.h),
                      child: Text("x2",
                          style: TextStyle(
                              color: black_354356,
                              fontFamily: fontMavenProMedium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp),
                          textAlign: TextAlign.left),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  // Paneer Masala
                  Expanded(
                    flex: 1,
                    child: Text("Masala Papad",
                        style: TextStyle(
                            color: black_354356,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontMavenProMedium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp),
                        textAlign: TextAlign.left),
                  ),
                  // 250
                  Row(
                    children: [
                      Image.asset(icon_rupee_slim,width: 10.w,height: 10.h,),
                      Text(
                          "50",
                          style:  TextStyle(
                              color:  black_354356,
                              fontFamily: fontMavenProProSemiBold,
                              fontSize: 14.sp
                          ),
                          textAlign: TextAlign.left
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
