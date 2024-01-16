import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../Model_list_logic/DayDateModel.dart';
import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/back_button.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/passwordtextfield.dart';
import '../../Widget/toolbar_with_title.dart';

class BuySubscriptionPlan extends StatefulWidget {
  const BuySubscriptionPlan({Key? key}) : super(key: key);

  @override
  State<BuySubscriptionPlan> createState() => _BuySubscriptionPlanState();
}

class _BuySubscriptionPlanState extends State<BuySubscriptionPlan> {
  List<DayDateModel> daydatefferList = [
    DayDateModel(icon_green_star, "Monthly"),
    DayDateModel(icon_yellow_diamond, "Quarterly"),
    DayDateModel(icon_blue_bookmark, "Yearly"),
  ];

  List<OfferModel> offerList = [
    OfferModel("Unlimited access to Bluedip's AI and ML\nbased platform"),
    OfferModel("Unlimited reach to 5 lakhs+ users"),
    OfferModel("Reservation management system"),
    OfferModel("Online ordering and payment processing"),
    OfferModel("Basic support and training"),
  ];

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
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToolbarWithTitle("Buy Subscription Plan"),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 4.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 24.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x0f041d42),
                                    offset: Offset(0, 3),
                                    blurRadius: 21,
                                    spreadRadius: 0)
                              ],
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(0.8, 1),
                                  colors: [
                                    Color(0xff73a5ff),
                                    Color(0xff1e6af2)
                                  ])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                icon_rocket,
                                width: 60.w,
                                height: 60.h,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              // Maximise your profit by 10x
                              Text("Maximise your profit by 10x ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: fontJosefinSansBold,
                                      fontSize: 20.sp),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 4.h,
                              ),
                              // With our range of subscription plans, we aim to provide our restaurant partners with the flexibility
                              Text(
                                  "With our range of subscription plans, we aim to provide our restaurant partners with the flexibility and support they need to maximize their revenue potential.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: fontMavenProRegular,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp,
                                      letterSpacing: 0.5,
                                      height: 1.6),
                                  textAlign: TextAlign.center)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        // Subscribe Your Plan
                        Text("Subscribe Your Plan",
                            style: TextStyle(
                                color: black_354356,
                                fontFamily: fontJosefinSansBold,
                                fontSize: 16.sp),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 16.h,
                        ),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          primary: false,
                          shrinkWrap: true,
                          itemCount: daydatefferList.length,
                          itemBuilder: (context, i) => Padding(
                            padding: EdgeInsets.only(bottom: 20.h),
                            child: Container(
                              decoration: boxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            daydatefferList[i].Day),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Monthly
                                            Text(daydatefferList[i].Date,
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontFamily:
                                                        fontJosefinSansBold,
                                                    fontSize: 20.sp),
                                                textAlign: TextAlign.left),

                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text("Hit the ground running.",
                                                style: TextStyle(
                                                    color: light_black_5f6d7b,
                                                    fontFamily:
                                                        fontMavenProRegular,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  icon_rupee_slim,
                                                  width: 12.w,
                                                  height: 12.h,
                                                  color: Blue_5468ff,
                                                ),
                                                Text("1,500/month",
                                                    style: TextStyle(
                                                        color: Blue_5468ff,
                                                        fontFamily:
                                                            fontJosefinSansBold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 20.sp),
                                                    textAlign: TextAlign.left)
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: divider_d4dce7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // FEATURES
                                        Text("FEATURES",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProBold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.left),

                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          primary: false,
                                          shrinkWrap: true,
                                          itemCount: offerList.length,
                                          itemBuilder: (context, i) => Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 16.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 18.w,
                                                  height: 18.h,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: green_5cb85c),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 12.w,
                                                ),
                                                // Unlimited reach to 5 lakhs+ users
                                                Text(offerList[i].title,
                                                    style: TextStyle(
                                                        color: black_354356,
                                                        fontFamily:
                                                            fontMavenProRegular,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14.sp),
                                                    textAlign: TextAlign.left)
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        CommonBlueButton(
                                            "Subscribe Now".toUpperCase(),
                                            () {},
                                            blue_3653f6)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
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
