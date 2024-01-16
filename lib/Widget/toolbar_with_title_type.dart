import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_font.dart';
import '../Styles/my_icons.dart';
import '../Styles/my_strings.dart';
import 'common_blue_button.dart';

class ToolbarWithTitleType extends StatelessWidget {
  final String title;
  final String type;
  final  Color color;
  ToolbarWithTitleType(this.title,this.type,this.color);
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10.h,bottom:10.h,left: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [

          GestureDetector(
              onTap: () => Navigator.pop(context, false),
              child: Container(
                  width: 40.w,
                  height: 40.w,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SvgPicture.asset(icon_arrow_left),
                  ))),
          SizedBox(width: 12.w,),

          Expanded(
            flex: 1,
            child: Text(title,style: TextStyle(
              fontFamily: fontJosefinSansBold,color: black_354356,fontSize: 20.sp
            ),),
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child:  Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color:color
              ),
              child: // Completed
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 6.h),
                child: Text(
                    type,
                    style:  TextStyle(
                        color:  Colors.white,
                        fontFamily: fontMavenProMedium,
                        fontStyle:  FontStyle.normal,
                        fontSize: 12.sp
                    ),
                    textAlign: TextAlign.left
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}

