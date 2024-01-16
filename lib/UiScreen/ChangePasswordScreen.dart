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


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  bool statusBiometric = false;

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor:Colors.white, // navigation bar color
      statusBarColor:Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ));
    return  SafeArea(

        child: Scaffold(
          backgroundColor: bg_f3f5f9,
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ToolbarWithTitle("Change Password"),

              Padding(
                padding:  EdgeInsets.all(16.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.h,),

                          Text(
                              strOldPassword,
                              style:  TextStyle(
                                  color:  black_354356,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.sp,
                                  fontFamily: fontMavenProRegular
                              ),
                              textAlign: TextAlign.left
                          ),

                          SizedBox(height: 6.h,),

                          PasswordTextField(textInputAction: TextInputAction.next,),
                          SizedBox(height: 20.h,),

                          Text(
                              strNewPassword,
                              style:  TextStyle(
                                  color:  black_354356,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.sp,
                                fontFamily: fontMavenProRegular
                              ),
                              textAlign: TextAlign.left
                          ),

                          SizedBox(height: 6.h,),

                          PasswordTextField(textInputAction: TextInputAction.next,),

                          SizedBox(height: 20.h,),

                          // Title
                          Text(
                              strConfirmNewPassword,
                              style:  TextStyle(
                                  color:  black_354356,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.sp,
                                  fontFamily: fontMavenProRegular
                              ),
                              textAlign: TextAlign.left
                          ),

                          SizedBox(height: 6.h,),

                          PasswordTextField(textInputAction: TextInputAction.done),

                          SizedBox(height: 40.h,),

                          CommonBlueButton(
                              strSave,(){},blue_3653f6
                          ),




                        ],
                      ),
                    ),





                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
