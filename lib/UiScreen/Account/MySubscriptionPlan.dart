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
import '../../Model_list_logic/SubscriptionModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/back_button.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/passwordtextfield.dart';
import '../../Widget/toolbar_with_title.dart';

class MySubscriptionPlan extends StatefulWidget {
  const MySubscriptionPlan({Key? key}) : super(key: key);

  @override
  State<MySubscriptionPlan> createState() => _MySubscriptionPlanState();
}

class _MySubscriptionPlanState extends State<MySubscriptionPlan> {
  List<SubscriptionModel> subscriptionList = [
    SubscriptionModel(icon_green_star, "Monthly", "22 days Left"),
    SubscriptionModel(icon_yellow_diamond, "Quarterly", "Expired"),
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
          ToolbarWithTitle("My Subscription Plan"),
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
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          primary: false,
                          shrinkWrap: true,
                          itemCount: subscriptionList.length,
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
                                            subscriptionList[i].icon),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Monthly
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        subscriptionList[i]
                                                            .title,
                                                        style: TextStyle(
                                                            color: black_354356,
                                                            fontFamily:
                                                                fontJosefinSansBold,
                                                            fontSize: 20.sp),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.w,
                                                            vertical: 6.h),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.r),
                                                        color: i == 1
                                                            ? red_d9534f
                                                            : Blue_5468ff),
                                                    child: // 22 days Left
                                                        Text(
                                                            subscriptionList[i]
                                                                .type,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    fontMavenProMedium,
                                                                fontSize:
                                                                    14.sp),
                                                            textAlign:
                                                                TextAlign.left),
                                                  )
                                                ],
                                              ),

                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text("Hit the ground running.",
                                                  style: TextStyle(
                                                      color: light_black_5f6d7b,
                                                      fontFamily:
                                                          fontMavenProRegular,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  textAlign: TextAlign.left),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: divider_d4dce7,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 14.w, right: 14.w, top: 14),
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Trxn Id: 12131121311
                                            Text("Trxn Id: 12131121311",
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontFamily:
                                                        fontMavenProRegular,
                                                    fontSize: 12.sp),
                                                textAlign: TextAlign.left),

                                            Row(
                                              children: [
                                                // Paid
                                                Text("PAID",
                                                    style: TextStyle(
                                                        color: Blue_5468ff,
                                                        fontFamily:
                                                            fontMavenProMedium,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14.sp),
                                                    textAlign: TextAlign.right),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Image.asset(
                                                  icon_rupee_slim,
                                                  width: 10.w,
                                                  height: 10.h,
                                                ),
                                                // 1,500
                                                Text("1,500",
                                                    style: TextStyle(
                                                        color: black_354356,
                                                        fontFamily:
                                                            fontMavenProProSemiBold,
                                                        fontSize: 14.sp),
                                                    textAlign: TextAlign.left)
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text("Date: 22 feb 2022 at 10:00 am",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProRegular,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.left),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                            "Plan Validity: 22 feb 2022 to 23 mar 2022",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProRegular,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.left),
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
