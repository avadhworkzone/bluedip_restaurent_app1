import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_strings.dart';
import '../Widget/Textfield.dart';
import '../Widget/back_button.dart';
import '../Widget/box_shadow.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/passwordtextfield.dart';
import '../Widget/toolbar_with_title.dart';

class WhiteWalkThroughFirst extends StatefulWidget {
  const WhiteWalkThroughFirst({Key? key}) : super(key: key);

  @override
  State<WhiteWalkThroughFirst> createState() => _WhiteWalkThroughFirstState();
}

class _WhiteWalkThroughFirstState extends State<WhiteWalkThroughFirst> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: bg_f3f5f9, // navigation bar color
      statusBarColor: bg_f3f5f9, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: bg_f3f5f9,
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 20.h,),
                Center(child: Image.asset(img_plate,fit: BoxFit.fill,width: 240.w,height: 240.h,)),

                SizedBox(height: 60.h,),
                // Serve Take-ways and Dine-in orders
                Text("Serve Delicious food \nto Customers",
                    style: TextStyle(
                        color: black_354356,
                        fontFamily: fontJosefinSansBold,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.sp),
                    textAlign: TextAlign.center),
                SizedBox(height: 4.h,),
                // Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                Text(
                    "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry.",
                    style:  TextStyle(
                        color:  black_354356,
                        fontFamily: fontMavenProRegular,
                        fontStyle:  FontStyle.normal,
                        fontSize: 15.sp,
                      height: 1.5
                    ),
                    textAlign: TextAlign.center
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
