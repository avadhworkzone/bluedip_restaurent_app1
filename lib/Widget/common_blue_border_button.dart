import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Styles/my_colors.dart';

class CommonBlueBorderButton extends StatelessWidget {

  final String btnTitle;
  final Color color;
  final Color txt_color;
  final Color fill_color;
  VoidCallback onCustomButtonPressed;

  CommonBlueBorderButton(this.btnTitle, this.onCustomButtonPressed,this.color,this.fill_color,this.txt_color);

  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: EdgeInsets.only(left: 14.w, right: 14.w),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: onCustomButtonPressed,
            style: ElevatedButton.styleFrom(
              primary: fill_color,
              onPrimary: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                 side: BorderSide(color: color, width: 1),
              ),
            ),
            child: Text(
              btnTitle,
              style: TextStyle(
                  color: txt_color,
                  fontSize: 15.sp,
                  fontFamily: fontMavenProMedium),
            )),
      ),
    );
  }
}
