import 'package:bluedip_restaurent/UiScreen/Auth/LoginScreen.dart';
import 'package:bluedip_restaurent/UiScreen/Splash%20screen/SplashScreen.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Styles/my_strings.dart';
import '../Widget/Textfield.dart';
import '../Widget/back_button.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/passwordtextfield.dart';
import '../Widget/toolbar_with_title.dart';
import '../Widget/toolbar_with_title_edit.dart';
import 'AddRestoDetailScreen/DetailPage1.dart';

import 'DetailPage5.dart';
import 'DetailPage6.dart';
import 'Auth/ForgotPasswordScreen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _FirstNameController = TextEditingController();
  final _LastNameController = TextEditingController();
  final _RestaurantNameController = TextEditingController();
  final _ContactNumController = TextEditingController();

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
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToolbarWithTitle("Edit Profile"),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: boxDecoration,
                            margin: EdgeInsets.only(right: 10, bottom: 7),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.asset(
                                royal_hotel_img,
                                width: 138.w,
                                height: 138.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            icon_edit,
                            width: 32.w,
                            height: 32.h,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    // Owner’s Details
                    Text("Owner’s Details",
                        style: TextStyle(
                            color: grey_969da8,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontMavenProMedium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(str_first_name,
                        style: TextStyle(
                            color: black_354356,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,
                            fontFamily: fontMavenProRegular),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 6.h,
                    ),

                    loginTextformField(
                      "Aakib",
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: _FirstNameController,
                      obscureText: true,
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(str_Last_name,
                        style: TextStyle(
                            color: black_354356,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,
                            fontFamily: fontMavenProRegular),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 6.h,
                    ),

                    loginTextformField(
                      "Khilji",
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: _LastNameController,
                      obscureText: true,
                      onChanged: (value) {},
                    ),

                    SizedBox(
                      height: 30.h,
                    ),
                    // Owner’s Details
                    Text("Restaurant Details",
                        style: TextStyle(
                            color: grey_969da8,
                            fontWeight: FontWeight.w500,
                            fontFamily: fontMavenProMedium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Restaurant Name",
                        style: TextStyle(
                            color: black_354356,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,
                            fontFamily: fontMavenProRegular),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 6.h,
                    ),

                    loginTextformField(
                      "Royal",
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: _RestaurantNameController,
                      obscureText: true,
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Contact Number",
                        style: TextStyle(
                            color: black_354356,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,
                            fontFamily: fontMavenProRegular),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 6.h,
                    ),

                    loginTextformField(
                      "9429283901",
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      controller: _ContactNumController,
                      obscureText: true,
                      onChanged: (value) {},
                    ),

                    SizedBox(
                      height: 40.h,
                    ),

                    CommonBlueButton(strSave.toUpperCase(), () {}, blue_3653f6),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
