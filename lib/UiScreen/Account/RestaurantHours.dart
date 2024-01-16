import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';

import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/back_button.dart';
import '../../Widget/common_blue_border_button.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/passwordtextfield.dart';
import '../../Widget/toolbar_with_title.dart';
import '../../Widget/toolbar_with_title_edit.dart';

class RestaurantHours extends StatefulWidget {
  const RestaurantHours({Key? key}) : super(key: key);

  @override
  State<RestaurantHours> createState() => _RestaurantHoursState();
}

class _RestaurantHoursState extends State<RestaurantHours> {
  String mondaystarttime = "10 : 15 AM";
  String mondayendtime = "05 : 00 PM";
  String tuesdaystarttime = "10 : 15 AM";
  String tuesdayendtime = "05 : 00 PM";
  String Wednesdaystarttime = "10 : 15 AM";
  String Wednesdayendtime = "05 : 00 PM";
  String Thursdaystarttime = "10 : 15 AM";
  String Thursdayendtime = "05 : 00 PM";
  String Fridaystarttime = "10 : 15 AM";
  String Fridayendtime = "05 : 00 PM";
  String Saturdaystarttime = "10 : 15 AM";
  String Saturdayendtime = "05 : 00 PM";

  bool statusMonday = true;
  bool statusTuesday = false;
  bool statusWednesday = true;
  bool statusThursday = false;
  bool statusFriday = false;
  bool statusSaturday = false;
  bool isMondayLayout = true;
  bool isTuesdayLayout = false;
  bool isWednesdayLayout = true;
  bool isThursdayLayout = false;
  bool isFridayLayout = false;
  bool isSaturdayLayout = false;

  bool isBottomButton = false;
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
          ToolbarWithTitleEdit("Restaurant Hours", () {
            setState(() {
              isBottomButton = true;
            });
          }),
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
                        SizedBox(
                          height: 4.h,
                        ),

                        /*Monday Layout*/
                        Container(
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
                                  // Wednesday
                                  Text("Monday",
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontMavenProMedium,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),

                                  FlutterSwitch(
                                    width: 40.0,
                                    height: 23.0,
                                    activeColor: green_5cb85c,
                                    inactiveColor: grey_e2e3e5,
                                    valueFontSize: 0.0,
                                    toggleSize: 18.0,
                                    value: statusMonday,
                                    borderRadius: 15.0,
                                    padding: 2.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        if (statusMonday = val) {
                                          isMondayLayout = true;
                                        } else {
                                          isMondayLayout = false;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: isMondayLayout,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 14.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectMonday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              mondaystarttime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectMonday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              mondayendtime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        /*Tuesday Layout*/
                        Container(
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
                                  // Wednesday
                                  Text("Tuesday",
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontMavenProMedium,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),

                                  FlutterSwitch(
                                    width: 40.0,
                                    height: 23.0,
                                    activeColor: green_5cb85c,
                                    inactiveColor: grey_e2e3e5,
                                    valueFontSize: 0.0,
                                    toggleSize: 18.0,
                                    value: statusTuesday,
                                    borderRadius: 15.0,
                                    padding: 2.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        if (statusTuesday = val) {
                                          isTuesdayLayout = true;
                                        } else {
                                          isTuesdayLayout = false;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: isTuesdayLayout,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 14.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectTuesday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              tuesdaystarttime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectTuesday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              tuesdayendtime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        /*Wednesday Layout*/
                        Container(
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
                                  // Wednesday
                                  Text("Wednesday",
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontMavenProMedium,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),

                                  FlutterSwitch(
                                    width: 40.0,
                                    height: 23.0,
                                    activeColor: green_5cb85c,
                                    inactiveColor: grey_e2e3e5,
                                    valueFontSize: 0.0,
                                    toggleSize: 18.0,
                                    value: statusWednesday,
                                    borderRadius: 15.0,
                                    padding: 2.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        if (statusWednesday = val) {
                                          isWednesdayLayout = true;
                                        } else {
                                          isWednesdayLayout = false;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: isWednesdayLayout,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 14.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectWednesday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              Wednesdaystarttime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectWednesday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              Wednesdayendtime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        /*Thursday Layout*/
                        Container(
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
                                  // Wednesday
                                  Text("Thursday",
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontMavenProMedium,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),

                                  FlutterSwitch(
                                    width: 40.0,
                                    height: 23.0,
                                    activeColor: green_5cb85c,
                                    inactiveColor: grey_e2e3e5,
                                    valueFontSize: 0.0,
                                    toggleSize: 18.0,
                                    value: statusThursday,
                                    borderRadius: 15.0,
                                    padding: 2.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        if (statusThursday = val) {
                                          isThursdayLayout = true;
                                        } else {
                                          isThursdayLayout = false;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: isThursdayLayout,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 14.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectThursday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              Thursdaystarttime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectThursday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              Thursdayendtime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        /*Friday Layout*/
                        Container(
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
                                  // Wednesday
                                  Text("Friday",
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontMavenProMedium,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),

                                  FlutterSwitch(
                                    width: 40.0,
                                    height: 23.0,
                                    activeColor: green_5cb85c,
                                    inactiveColor: grey_e2e3e5,
                                    valueFontSize: 0.0,
                                    toggleSize: 18.0,
                                    value: statusFriday,
                                    borderRadius: 15.0,
                                    padding: 2.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        if (statusFriday = val) {
                                          isFridayLayout = true;
                                        } else {
                                          isFridayLayout = false;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: isFridayLayout,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 14.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectFriday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              Fridaystarttime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectFriday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              Fridayendtime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        /*Saturday Layout*/
                        Container(
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
                                  // Wednesday
                                  Text("Saturday",
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontMavenProMedium,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),

                                  FlutterSwitch(
                                    width: 40.0,
                                    height: 23.0,
                                    activeColor: green_5cb85c,
                                    inactiveColor: grey_e2e3e5,
                                    valueFontSize: 0.0,
                                    toggleSize: 18.0,
                                    value: statusSaturday,
                                    borderRadius: 15.0,
                                    padding: 2.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        if (statusSaturday = val) {
                                          isSaturdayLayout = true;
                                        } else {
                                          isSaturdayLayout = false;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: isSaturdayLayout,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 14.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectSaturday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              Saturdaystarttime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            selectSaturday(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            child: Text(
                                              Saturdayendtime,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  color: black_354356),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isBottomButton,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              CommonBlueButton("SAVE", () {}, blue_3653f6),
                            ],
                          ),
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

  void selectMonday(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
              margin: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.r),
                    topRight: Radius.circular(13.r),
                    bottomRight: Radius.circular(13.r),
                    bottomLeft: Radius.circular(13.r),
                  )),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: starttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(
                                      () => mondaystarttime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: endttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(() => mondayendtime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              strCancel.toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              "Confirm".toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  void selectTuesday(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
              margin: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.r),
                    topRight: Radius.circular(13.r),
                    bottomRight: Radius.circular(13.r),
                    bottomLeft: Radius.circular(13.r),
                  )),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: starttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(
                                      () => tuesdaystarttime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: endttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(() => tuesdayendtime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              strCancel.toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              "Confirm".toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  void selectWednesday(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
              margin: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.r),
                    topRight: Radius.circular(13.r),
                    bottomRight: Radius.circular(13.r),
                    bottomLeft: Radius.circular(13.r),
                  )),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: starttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(
                                      () => Wednesdaystarttime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: endttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(
                                      () => Wednesdayendtime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              strCancel.toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              "Confirm".toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  void selectThursday(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
              margin: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.r),
                    topRight: Radius.circular(13.r),
                    bottomRight: Radius.circular(13.r),
                    bottomLeft: Radius.circular(13.r),
                  )),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: starttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(
                                      () => Thursdaystarttime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: endttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(
                                      () => Thursdayendtime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              strCancel.toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              "Confirm".toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  void selectFriday(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
              margin: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.r),
                    topRight: Radius.circular(13.r),
                    bottomRight: Radius.circular(13.r),
                    bottomLeft: Radius.circular(13.r),
                  )),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: starttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(
                                      () => Fridaystarttime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: endttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(() => Fridayendtime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              strCancel.toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              "Confirm".toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  void selectSaturday(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
              margin: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.r),
                    topRight: Radius.circular(13.r),
                    bottomRight: Radius.circular(13.r),
                    bottomLeft: Radius.circular(13.r),
                  )),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: starttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(
                                      () => Saturdaystarttime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            // child: timerPicker(),
                            child: SizedBox(
                              height: 200.h,
                              child: CupertinoDatePicker(
                                //  initialDateTime: endttime,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  DateTime dateTime =
                                      DateTime.parse(newTime.toString());
                                  String yourDateTime =
                                      DateFormat('h:mm a').format(dateTime);
                                  setState(
                                      () => Saturdayendtime = yourDateTime);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              strCancel.toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: CommonBlueBorderButton(
                              "Confirm".toUpperCase(),
                              () => Navigator.pop(context, false),
                              Colors.white,
                              Colors.white,
                              Blue_5468ff),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}
