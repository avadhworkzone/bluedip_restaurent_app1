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

class IncomingTab extends StatefulWidget {
  const IncomingTab({Key? key}) : super(key: key);

  @override
  State<IncomingTab> createState() => _IncomingTabState();
}

class _IncomingTabState extends State<IncomingTab> {
  int _n = 1;

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  Timer? _timer;
  int _start = 10;

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 30;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  List<OfferModel> offerList = [
    OfferModel("Offer ID #123113"),
    OfferModel("Offer ID #123113"),
    OfferModel("Offer ID #123113"),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.r),
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
                                        width: 8.w,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xff00d9cd),
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                        ),
                                        child: // New
                                            Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 4.h),
                                          child: Text("New",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  fontSize: 12.sp),
                                              textAlign: TextAlign.right),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: light_black_5f6d7b,
                                            fontFamily: fontMavenProRegular,
                                            fontSize: 14.sp),
                                        text: "Pickup at: "),
                                    TextSpan(
                                        style: TextStyle(
                                            color: Blue_5468ff,
                                            fontFamily: fontMavenProMedium,
                                            fontSize: 14.sp),
                                        text: "9:00 PM")
                                  ])),
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
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // John doe
                                            Text("John doe",
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        fontMavenProProSemiBold,
                                                    fontSize: 15.sp),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: Color(0xffedf0ff)),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          icon_room_buffet_dinner),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Text("2",
                                                          style: TextStyle(
                                                              color:
                                                                  black_354356,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  fontMavenProProSemiBold,
                                                              fontSize: 14.sp),
                                                          textAlign:
                                                              TextAlign.right)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: Color(0xffedf0ff)),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          icon_champayne_glass),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Text("1",
                                                          style: TextStyle(
                                                              color:
                                                                  black_354356,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  fontMavenProProSemiBold,
                                                              fontSize: 14.sp),
                                                          textAlign:
                                                              TextAlign.right)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
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
                                      // Paid
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
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text("Order Preparation \nTime",
                                            style: TextStyle(
                                                color: light_black_5f6d7b,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.left),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            border: Border.all(
                                                width: 1, color: grey_d9dde3)),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: minus,
                                              child: Container(
                                                  width: 44.w,
                                                  height: 40.h,
                                                  color: Colors.transparent,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                        icon_remove_minus),
                                                  )),
                                            ),

                                            Container(
                                              height: 39,
                                              width: 1,
                                              color: divider_d4dce7,
                                            ),
                                            // 10min
                                            Container(
                                              width: 60.w,
                                              child: Text("$_n" + " min",
                                                  style: TextStyle(
                                                      color: black_354356,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          fontMavenProMedium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 15.sp),
                                                  textAlign: TextAlign.center),
                                            ),
                                            Container(
                                              height: 39,
                                              width: 1,
                                              color: divider_d4dce7,
                                            ),
                                            GestureDetector(
                                              onTap: add,
                                              child: Container(
                                                  width: 44.w,
                                                  height: 40.h,
                                                  color: Colors.transparent,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                        icon_add_plus),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  /*bottom two buttons here*/
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: EdgeInsets.all(14.r),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: Colors.transparent),
                                            child: // Frame 34242
                                                Text("REJECT",
                                                    style: TextStyle(
                                                        color: orange_d6483d,
                                                        fontFamily:
                                                            fontMavenProMedium,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp),
                                                    textAlign:
                                                        TextAlign.center),
                                          )),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            padding: EdgeInsets.all(14.r),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: Blue_5468ff),
                                            child: // Frame 34242
                                                Text(
                                                    "ACCEPT " +
                                                        "(" +
                                                        timerText +
                                                        ")",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            fontMavenProMedium,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp),
                                                    textAlign:
                                                        TextAlign.center),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
