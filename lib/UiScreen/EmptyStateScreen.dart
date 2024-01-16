import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Styles/my_strings.dart';
import '../Widget/Textfield.dart';
import '../Widget/back_button.dart';
import '../Widget/box_shadow.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/passwordtextfield.dart';
import '../Widget/toolbar_with_title.dart';
import '../Widget/toolbar_with_title_edit.dart';


class EmptyStateScreen extends StatefulWidget {
  const EmptyStateScreen({Key? key}) : super(key: key);

  @override
  State<EmptyStateScreen> createState() => _EmptyStateScreenState();
}

class _EmptyStateScreenState extends State<EmptyStateScreen> {



  bool isBottomButton = false;

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

              ToolbarWithTitle("Empty State"),

              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.all(16.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4.h,),


                            /*No offer layout*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 60.h,),
                                Center(
                                  child: Image.asset(
                                    img_no_offers,
                                    width: 300.w,
                                    height: 236.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text("No Offers",
                                    style: TextStyle(
                                        color: black_354356,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: fontJosefinSansBold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.sp),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 4.h,),
                                // Create your first offer and start earning.
                                Text("Create your first offer \nand start earning.",
                                    style: TextStyle(
                                        color: grey_5f6d7b,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.center)
                              ],
                            ),

                            /*No takeaway oders layout*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 60.h,),
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
                                SizedBox(height: 4.h,),
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
                            ),

                            /*No  oders layout*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 60.h,),
                                Center(
                                  child: Image.asset(
                                    img_no_orders,
                                    width: 300.w,
                                    height: 236.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text("No Orders",
                                    style: TextStyle(
                                        color: black_354356,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: fontJosefinSansBold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.sp),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 4.h,),
                                // Create your first offer and start earning.
                                Text("Completed orders and booking \nwill show here.",
                                    style: TextStyle(
                                        color: grey_5f6d7b,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.center)
                              ],
                            ),

                            /*No Subscription layout*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 60.h,),
                                Center(
                                  child: Image.asset(
                                    img_no_subscription,
                                    width: 300.w,
                                    height: 236.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text("No Subscription",
                                    style: TextStyle(
                                        color: black_354356,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: fontJosefinSansBold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.sp),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 4.h,),
                                // Create your first offer and start earning.
                                Text("Please buy subscription plan for \nactive your services.",
                                    style: TextStyle(
                                        color: grey_5f6d7b,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 20.h,),

                                Container(
                                  width: 200,
                                  child: CommonBlueButton("Buy Now", () {}, blue_3653f6),
                                )
                              ],
                            ),

                            /*No  payout layout*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 60.h,),
                                Center(
                                  child: Image.asset(
                                    img_no_payouts_yet,
                                    width: 300.w,
                                    height: 236.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text("No Payouts yet!",
                                    style: TextStyle(
                                        color: black_354356,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: fontJosefinSansBold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.sp),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 4.h,),
                                // Create your first offer and start earning.
                                Text("Your all payout request will be \nlist down here.",
                                    style: TextStyle(
                                        color: grey_5f6d7b,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.center)
                              ],
                            ),

                            /*No internet layout*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 60.h,),
                                Center(
                                  child: Image.asset(
                                    img_no_internet,
                                    width: 300.w,
                                    height: 236.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text("No Internet!",
                                    style: TextStyle(
                                        color: black_354356,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: fontJosefinSansBold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.sp),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 4.h,),
                                // Create your first offer and start earning.
                                Text("Please check your \ninternet connection.",
                                    style: TextStyle(
                                        color: grey_5f6d7b,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 20.h,),

                                Container(
                                  width: 200,
                                  child: CommonBlueButton("Retry", () {}, blue_3653f6),
                                )
                              ],
                            ),

                            /*No  notification layout*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 60.h,),
                                Center(
                                  child: Image.asset(
                                    img_no_notification_yet,
                                    width: 300.w,
                                    height: 236.h,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text("No Notification yet!",
                                    style: TextStyle(
                                        color: black_354356,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: fontJosefinSansBold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.sp),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 4.h,),
                                // Create your first offer and start earning.
                                Text("Check this section for updates, \nnews and general notifications.",
                                    style: TextStyle(
                                        color: grey_5f6d7b,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.center)
                              ],
                            ),


                          ],
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
