import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_font.dart';
import '../Styles/my_icons.dart';
import 'box_shadow.dart';

class CustomerDetail extends StatefulWidget {
  const CustomerDetail({Key? key}) : super(key: key);

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
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
                height: 14.h,
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
                  Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                        color: Color(0xff00d9cd),
                        borderRadius: BorderRadius.circular(14.r)),
                    child: Padding(
                      padding: EdgeInsets.all(11.r),
                      child: SvgPicture.asset(
                        icon_phone_call,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
