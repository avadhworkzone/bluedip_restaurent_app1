import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 60.h,
        ),
        Center(
          child: Image.asset(
            img_no_takeaway_orders,
            width: 300.w,
            height: 236.h,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text("No Takeaway Orders",
            style: TextStyle(
                color: black_354356,
                fontWeight: FontWeight.w700,
                fontFamily: fontJosefinSansBold,
                fontStyle: FontStyle.normal,
                fontSize: 18.sp),
            textAlign: TextAlign.center),
        SizedBox(
          height: 4.h,
        ),
        // Create your first offer and start earning.
        Text("Takeaway order will \nshow here.",
            style: TextStyle(
                color: grey_5f6d7b,
                fontWeight: FontWeight.w500,
                fontFamily: fontMavenProMedium,
                fontStyle: FontStyle.normal,
                fontSize: 14.sp),
            textAlign: TextAlign.center)
      ],
    );
  }
}
