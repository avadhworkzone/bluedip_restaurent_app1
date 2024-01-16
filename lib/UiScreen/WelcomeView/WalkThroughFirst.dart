import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/back_button.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/passwordtextfield.dart';
import '../../Widget/toolbar_with_title.dart';

class WalkThroughFirst extends StatefulWidget {
  const WalkThroughFirst({Key? key}) : super(key: key);

  @override
  State<WalkThroughFirst> createState() => _WalkThroughFirstState();
}

class _WalkThroughFirstState extends State<WalkThroughFirst> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return Scaffold(
      backgroundColor: Color(0xff020304),
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Image.asset(
              img_serve_take,
              fit: BoxFit.fill,
            ),
          ),
          Image.asset(
            img_shadow_overlay,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Serve Take-ways and Dine-in orders
                Text("Welcome to Bluedip!",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontJosefinSansBold,
                        fontStyle: FontStyle.normal,
                        fontSize: 32.sp),
                    textAlign: TextAlign.left),
                SizedBox(
                  height: 2.h,
                ),

                // Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                Text(
                    "We help you save on commission fees, so you can keep more of what you earn.",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontMavenProRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: 15.sp),
                    textAlign: TextAlign.left)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
