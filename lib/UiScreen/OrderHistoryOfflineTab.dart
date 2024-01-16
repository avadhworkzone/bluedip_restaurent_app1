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

class OrderHistoryOfflineTab extends StatefulWidget {
  const OrderHistoryOfflineTab({Key? key}) : super(key: key);

  @override
  State<OrderHistoryOfflineTab> createState() => _OrderHistoryOfflineTabState();
}

class _OrderHistoryOfflineTabState extends State<OrderHistoryOfflineTab> {
  List<OfferModel> offerList = [
    OfferModel("Completed"),
    OfferModel("Completed"),
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
                                      Text("Order ID #123113",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily:
                                                  fontMavenProProSemiBold,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.left),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            color: green_5cb85c),
                                        child: // Completed
                                            Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 5),
                                          child: Text(offerList[i].title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.sp),
                                              textAlign: TextAlign.left),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  const DottedLine(
                                    direction: Axis.horizontal,
                                    lineLength: double.infinity,
                                    lineThickness: 1.0,
                                    dashLength: 4.0,
                                    dashColor: divider_d4dce7,
                                    dashRadius: 0.0,
                                    dashGapLength: 4.0,
                                    dashGapColor: Colors.transparent,
                                    dashGapRadius: 0.0,
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text("Jenny",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily:
                                                    fontMavenProProSemiBold,
                                                fontSize: 15.sp),
                                            textAlign: TextAlign.left),
                                      ),
                                      // Paid
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.w, vertical: 2.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            color: Color(0x215cb85c)),
                                        child: Text("PAID",
                                            style: TextStyle(
                                                color: green_5cb85c,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.right),
                                      ),

                                      SizedBox(
                                        width: 14.w,
                                      ),

                                      // 150
                                      Text("₹150",
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
