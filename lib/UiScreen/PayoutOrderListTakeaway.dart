import 'dart:async';

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Model_list_logic/OfferModel.dart';
import '../Styles/my_icons.dart';
import '../Styles/my_strings.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/search_bar.dart';

class PayoutOrderListTakeaway extends StatefulWidget {
  const PayoutOrderListTakeaway({Key? key}) : super(key: key);

  @override
  State<PayoutOrderListTakeaway> createState() =>
      _PayoutOrderListTakeawayState();
}

class _PayoutOrderListTakeawayState extends State<PayoutOrderListTakeaway> {
  List<OfferModel> offerList = [
    OfferModel("Order ID #123113"),
    OfferModel("Order ID #123113"),
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

    return Scaffold(
      backgroundColor: bg_f3f5f9,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*search bar*/
                  SearchBarWidget(
                    hintText: strSearch,
                    onSubmitted: (String) {},
                    onChanged: (String) {},
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  /*order list item*/
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      primary: false,
                      shrinkWrap: true,
                      itemCount: offerList.length,
                      itemBuilder: (context, i) => Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Container(
                              decoration: boxDecoration,
                              padding: EdgeInsets.all(14.r),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Order ID #123113
                                          Text(offerList[i].title,
                                              style: TextStyle(
                                                  color: black_354356,
                                                  fontFamily:
                                                      fontMavenProProSemiBold,
                                                  fontSize: 15.sp),
                                              textAlign: TextAlign.left),

                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          // 11 Jun, 2022 11:00 AM
                                          Text("11 Jun, 2022 11:00 AM",
                                              style: TextStyle(
                                                  color: light_black_5f6d7b,
                                                  fontFamily:
                                                      fontMavenProRegular,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.sp),
                                              textAlign: TextAlign.left)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            icon_rupee_slim,
                                            width: 10.w,
                                            height: 10.h,
                                          ),
                                          // 150
                                          Text("150",
                                              style: TextStyle(
                                                  color: black_354356,
                                                  fontFamily:
                                                      fontMavenProProSemiBold,
                                                  fontSize: 14.sp),
                                              textAlign: TextAlign.left)
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
