import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_strings.dart';
import '../Widget/Textfield.dart';
import '../Widget/back_button.dart';
import '../Widget/box_shadow.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/passwordtextfield.dart';
import '../Widget/toolbar_with_title.dart';


class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {



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
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context, false);
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(icon_cancel),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(icon_success,width: 147.w,height: 118.h,fit: BoxFit.cover,),
                      SizedBox(height: 34.h,),
                      // Payment Successful!
                      Text(
                          "Payment Successful!",
                          style:  TextStyle(
                              color: black_354356,
                              fontFamily: fontJosefinSansBold,
                              fontSize: 20.sp
                          ),
                          textAlign: TextAlign.center
                      ),
                      SizedBox(height: 4.h,),
                    // Your Subscription plan active Now. enjoy your orders.
                    Text(
                        "Your Subscription plan active Now. \nenjoy your orders.",
                    style:  TextStyle(
                        color: black_354356,
                    fontFamily: fontMavenProRegular,
                    fontStyle:  FontStyle.normal,
                    fontSize: 14.sp,
                      height: 1.5
                ),
                  textAlign: TextAlign.center
              ),
                      SizedBox(height: 40.h,),

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Details
                            Text(
                                "Details".toUpperCase(),
                                style:  TextStyle(
                                    color: black_354356,
                                    fontFamily: fontMavenProMedium,
                                    fontSize: 14.sp
                                ),
                                textAlign: TextAlign.left
                            ),

                            SizedBox(height: 16.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Plan
                                Expanded(
                                  flex:1,
                                  child: Text(
                                      "Plan",
                                      style:  TextStyle(
                                          color:  grey_969da8,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),

                                // Monthly
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                      "Monthly",
                                      style:  TextStyle(
                                          color:  black_354356,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 15.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 16.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Plan
                                Expanded(
                                  flex:1,
                                  child: Text(
                                      "Paid",
                                      style:  TextStyle(
                                          color:  grey_969da8,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),

                                // Monthly
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Image.asset(icon_rupee_slim,width: 10.w,height: 10.h,),

                                      Text(
                                          "1500",
                                          style:  TextStyle(
                                              color:  black_354356,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 15.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 16.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Plan
                                Expanded(
                                  flex:1,
                                  child: Text(
                                      "Trxn. Id",
                                      style:  TextStyle(
                                          color:  grey_969da8,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),

                                // Monthly
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                      "131311131",
                                      style:  TextStyle(
                                          color:  black_354356,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 15.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 16.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Plan
                                Expanded(
                                  flex:1,
                                  child: Text(
                                      "Date & Time",
                                      style:  TextStyle(
                                          color:  grey_969da8,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),

                                // Monthly
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                      "12/02/2022 at 9:00PM",
                                      style:  TextStyle(
                                          color:  black_354356,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 15.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),




              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 25),
                child: CommonBlueButton("Back to home".toUpperCase(),(){},Blue_5468ff),
              ),

            ],
          ),
        ));
  }
}
