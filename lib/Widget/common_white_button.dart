import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_font.dart';

class CommonWhiteButton extends StatelessWidget {

  final String btnTitle;
  final Color color;
  VoidCallback? onCustomButtonPressed;

  CommonWhiteButton(this.btnTitle, this.onCustomButtonPressed,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
    //  margin: EdgeInsets.only(left: 14.w, right: 14.w),
      decoration: const BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0x82ffffff),
        //     blurRadius: 15.0,
        //     spreadRadius: 0,
        //     offset: Offset(0,5,),
        //   )
        // ],

      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: onCustomButtonPressed,
            style: ElevatedButton.styleFrom(
              primary: color,
              onPrimary: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                // side: BorderSide(color: skygreen_24d39e, width: 0),
              ),
            ),
            child: Text(
              btnTitle,
              style: TextStyle(
                  color: Blue_5468ff,
                  fontSize: 15.sp,
                  fontFamily: fontMavenProMedium),
            )),
      ),
    );

  }
}
