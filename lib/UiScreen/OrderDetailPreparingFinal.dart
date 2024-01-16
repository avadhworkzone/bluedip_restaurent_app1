import 'dart:async';

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Styles/my_strings.dart';
import '../Widget/Textfield.dart';
import '../Widget/blue_box_shadow.dart';
import '../Widget/box_shadow.dart';
import '../Widget/common_blue_border_button.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/cooking_instruction_widget.dart';
import '../Widget/customer_detail_widget.dart';
import '../Widget/items_widget.dart';
import '../Widget/payment_summery_widget.dart';
import '../Widget/toolbar_with_title.dart';

import 'bottomsheets/BottomSheetTimePicker.dart';

class OrderDetailPreparingFinal extends StatefulWidget {
  const OrderDetailPreparingFinal({Key? key}) : super(key: key);

  @override
  State<OrderDetailPreparingFinal> createState() =>
      _OrderDetailPreparingFinalState();
}

class _OrderDetailPreparingFinalState extends State<OrderDetailPreparingFinal> {
  int _n = 0;

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

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(1, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(1, '0')}';

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
    _startTimer();
    super.initState();
  }

  // List<OfferModel> offerList = [
  //   OfferModel("Offer ID #123113"),
  // ];

  Timer? _timer;
  int _duration = 60;
  int _remainingTime = 60;
  bool _isRunning = false;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
          _isRunning = false;
        }
      });
    });
    _isRunning = true;
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _isRunning = false;
    }
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToolbarWithTitle("Order #13311212"),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),

                    /*pickup layout*/
                    Container(
                      width: double.infinity,
                      decoration: boxDecoration,
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Pickup at: 9:00 PM
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(
                                    color: light_black_5f6d7b,
                                    fontFamily: fontMavenProRegular,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                text: "Pickup at: "),
                            TextSpan(
                                style: TextStyle(
                                    color: Blue_5468ff,
                                    fontFamily: fontMavenProMedium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                text: "9:00 PM")
                          ])),
                          SizedBox(
                            height: 10.h,
                          ),
                          // Order: 12 Arp, 2022 at 8.30 PM
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(
                                    color: light_black_5f6d7b,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: fontMavenProRegular,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                text: "Order: "),
                            TextSpan(
                                style: TextStyle(
                                    color: light_black_5f6d7b,
                                    fontFamily: fontMavenProMedium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                text: "12 Arp, 2022 at 8.30 PM")
                          ]))
                        ],
                      ),
                    ),

                    /*customer detail*/
                    const CustomerDetail(),

                    /*item layout*/
                    const Items(),

                    /*Cooking Instructions*/
                    const CookingInstruction(),

                    /*Payment Summary*/
                    const PaymentSummery()
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color(0x0f041d42),
                    offset: Offset(0, 3),
                    blurRadius: 21,
                    spreadRadius: 0)
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*bottom two buttons here*/
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: grey_d9dde3),
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.transparent),
                          child: // Frame 34242
                              Text("Need \nmore time",
                                  style: TextStyle(
                                      color:
                                          _isRunning ? grey_969da8 : red_d9534f,
                                      fontFamily: fontMavenProMedium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.center),
                        )),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        child: GestureDetector(
                          onTap: () {
                            // if (_isRunning) {
                            //   _stopTimer();
                            //   setState(() {
                            //     _remainingTime = _duration;
                            //   });
                            // } else {
                            //   _startTimer();
                            // }
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Blue_5468ff,
                                ),
                                child: Center(
                                  child: Text(
                                    _isRunning
                                        ? "ORDER READY " + "(" + timerText + ")"
                                        : 'ORDER READY',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.sp),
                                  ),
                                ),
                              ),
                              AnimatedOpacity(
                                opacity: _isRunning ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 500),
                                child: Container(
                                  width: 220.w * (_remainingTime / _duration),
                                  height: 46,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
