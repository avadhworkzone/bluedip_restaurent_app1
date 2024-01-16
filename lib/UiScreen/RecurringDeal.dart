import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/utils/validation_utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../Model_list_logic/OfferModel.dart';
import '../Styles/my_constant.dart';
import '../Styles/my_strings.dart';
import '../Widget/Textfield.dart';
import '../Widget/box_shadow.dart';
import '../Widget/common_blue_border_button.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/drop_down_box_shadow.dart';
import '../Widget/toolbar_with_title.dart';

class RecurringDeal extends StatefulWidget {
  const RecurringDeal({Key? key}) : super(key: key);

  @override
  State<RecurringDeal> createState() => _RecurringDealState();
}

class _RecurringDealState extends State<RecurringDeal> {
  bool all_day = false;
  bool time_limit = false;
  bool dine_in = false;
  bool takeaways = false;

  String starttime = "10 : 15 AM";
  String endttime = "05 : 00 PM";

  // String? selectedTimeSlot;
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTimeSecond = TimeOfDay.now();

  final List<String> itemCategory = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  String? selectedCategory;

  final List<String> itemPercent = [
    '20 %',
    '25 %',
    '30 %',
    '35 %',
    '40 %',
    '45 %',
    '50 %'
  ];
  String? selectedPercent;

  bool isAllday = false;

  List<OfferModel> onOfferModel = [];
  List<String> selectedList = [];

  @override
  void initState() {
    onOfferModel.clear();
    onOfferModel.add(OfferModel("Sunday"));
    onOfferModel.add(OfferModel("Monday"));
    onOfferModel.add(OfferModel("Tuesday"));
    onOfferModel.add(OfferModel("Wednesday"));
    onOfferModel.add(OfferModel("Thursday"));
    onOfferModel.add(OfferModel("Friday"));
    onOfferModel.add(OfferModel("Saturday"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _EmailController = TextEditingController();
    final _TextController = TextEditingController();
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
          //  ToolbarWithTitle("Create Recurring Deal"),

          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Select Day of the week",
                        style: TextStyle(
                            color: black_354356,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp,
                            fontFamily: fontMavenProProSemiBold),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 6.h,
                    ),

                    /*Day of The Week */
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selecDayOfWeek(context);
                        });
                      },
                      child: Container(
                        decoration: boxDecoration,
                        padding: EdgeInsets.all(14.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Select
                            Expanded(
                              flex: 1,
                              child: Text(
                                  MyConstant.strdays.isNotEmpty
                                      ? MyConstant.strdays
                                      : "Select",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProMedium,
                                      fontSize: 15.sp,
                                      overflow: TextOverflow.ellipsis),
                                  textAlign: TextAlign.left),
                            ),
                            SvgPicture.asset(
                              icon_down_arrow,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Offer Percentage (%)",
                        style: TextStyle(
                            color: black_354356,
                            fontSize: 15.sp,
                            fontFamily: fontMavenProProSemiBold),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 6.h,
                    ),

                    /*Percent Drop Down Menu*/
                    Container(
                      decoration: boxDecoration,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          dropdownDecoration: drop_down_box_shadow,
                          isExpanded: true,
                          icon: SvgPicture.asset(icon_down_arrow),
                          hint: Text(
                            str_select_your_role,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: black_354356,
                                fontFamily: fontMavenProMedium),
                          ),
                          items: itemPercent
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: black_354356,
                                          fontFamily: fontMavenProMedium),
                                    ),
                                  ))
                              .toList(),
                          value: selectedPercent,
                          onChanged: (value) {
                            setState(() {
                              selectedPercent = value as String;
                            });
                          },
                          itemPadding:
                              const EdgeInsets.only(left: 20, right: 0),
                          buttonPadding:
                              const EdgeInsets.only(left: 0, right: 12),
                          dropdownMaxHeight: 175,
                          scrollbarThickness: 3,
                          offset: const Offset(0, -5),
                          scrollbarAlwaysShow: true,
                        ),
                      ),
                    ),

                    /*Time period layout*/
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      padding: EdgeInsets.all(14.r),
                      decoration: boxDecoration,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Time Period
                          Text("Time Period",
                              style: TextStyle(
                                  color: black_354356,
                                  fontSize: 15.sp,
                                  fontFamily: fontMavenProProSemiBold),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 14.h,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    all_day = true;
                                    time_limit = false;
                                    isAllday = true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(all_day
                                        ? icon_selected_radio
                                        : icon_unselected_radio),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    // All day
                                    Text("All day",
                                        style: TextStyle(
                                            color: black_354356,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left)
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    all_day = false;
                                    time_limit = true;
                                    isAllday = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(time_limit
                                        ? icon_selected_radio
                                        : icon_unselected_radio),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    // All day
                                    Text("Time Limit",
                                        style: TextStyle(
                                            color: black_354356,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left)
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              SizedBox(
                                height: 14.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Label
                                        Text(
                                          "Start Time",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily: fontMavenProRegular,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            selectTimePicker(context);
                                            // setState(() {
                                            //   _selectTime(context);
                                            // });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(14.h),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(14.r),
                                              border: Border.all(
                                                  color: grey_d9dde3, width: 1),
                                            ),
                                            child: // Detail
                                                Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(starttime,
                                                      style: TextStyle(
                                                          color: black_354356,
                                                          fontFamily:
                                                              fontMavenProMedium,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 15.sp,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                                SvgPicture.asset(
                                                    icon_clock_time)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Label
                                        Text(
                                          "End Time",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily: fontMavenProRegular,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectTimePicker(context);
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 16.h,
                                                right: 12.w,
                                                top: 12.h,
                                                bottom: 12.h),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(14.r),
                                              border: Border.all(
                                                  color: grey_d9dde3, width: 1),
                                            ),
                                            child: // Detail
                                                Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(endttime,
                                                    style: TextStyle(
                                                        color: black_354356,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily:
                                                            fontMavenProMedium,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp),
                                                    textAlign: TextAlign.left),
                                                SvgPicture.asset(
                                                    icon_clock_time)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Visibility(
                            visible: isAllday,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      icon_green_rectangle,
                                      width: 12.w,
                                      height: 12.h,
                                      color: Color(0xffaeb8ff),
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    // It will set on business time
                                    Text("It will set on business time",
                                        style: TextStyle(
                                            color: black_354356,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /*offer type layout*/
                    Container(
                      padding: EdgeInsets.all(14.r),
                      decoration: boxDecoration,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Time Period
                          Text("Offer Type",
                              style: TextStyle(
                                  color: black_354356,
                                  fontSize: 15.sp,
                                  fontFamily: fontMavenProProSemiBold),
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 14.h,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    dine_in = !dine_in;
                                  });
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(dine_in
                                        ? icon_selected_checkbox
                                        : icon_unselected_checkbox),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    // All day
                                    Text("Dine-in",
                                        style: TextStyle(
                                            color: black_354356,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left)
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    takeaways = !takeaways;
                                  });
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(takeaways
                                        ? icon_selected_checkbox
                                        : icon_unselected_checkbox),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    // All day
                                    Text("Takeaways",
                                        style: TextStyle(
                                            color: black_354356,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Total Deal",
                        style: TextStyle(
                            color: black_354356,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp,
                            fontFamily: fontMavenProProSemiBold),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 6.h,
                    ),
                    loginTextformField("e.g. 10",
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: _TextController,
                        obscureText: true,
                        onChanged: (value) {},
                        regularExpression: RegularExpression.digitsPattern),
                    SizedBox(
                      height: 20.h,
                    ),

                    /*predicted results layout*/
                    Container(
                      decoration: boxDecoration,
                      padding: EdgeInsets.all(14.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(100),
                                      bottomLeft: Radius.circular(100),
                                      bottomRight: Radius.circular(10)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment(0.8, 1),
                                    colors: [
                                      Color(0xffe9c870),
                                      Color(0xffdea91b),
                                    ],
                                  )),
                              child: // predicted results
                                  Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 21.w, vertical: 4.h),
                                child: Text("predicted results".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Customers Predicted
                                    Text("Customers Predicted",
                                        style: TextStyle(
                                            color: grey_969da8,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp),
                                        textAlign: TextAlign.right),
                                    SizedBox(
                                      height: 4.h,
                                    ),

                                    // 15-20
                                    Text("15-20",
                                        style: TextStyle(
                                            color: black_354356,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: fontMavenProProSemiBold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.right)
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Customers Predicted
                                    Text("Revenue Predicted",
                                        style: TextStyle(
                                            color: grey_969da8,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp),
                                        textAlign: TextAlign.right),
                                    SizedBox(
                                      height: 4.h,
                                    ),

                                    // 15-20
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          icon_rupee_slim,
                                          color: black_354356,
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                        Text("25,000",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                    fontMavenProProSemiBold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.right),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),

                    /*bottom two buttons here*/
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: CommonBlueBorderButton(
                                strCancel.toUpperCase(),
                                () {},
                                Blue_5468ff,
                                Colors.transparent,
                                Blue_5468ff)),
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                            flex: 1,
                            child: CommonBlueButton(
                                strPublish.toUpperCase(), () {}, blue_3653f6)),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  void selectTimePicker(BuildContext context) {
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
                      bottomLeft: Radius.circular(13.r))),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Column(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Daily Opportunities
                                  // Title
                                  Center(
                                    child: Text("Select Time",
                                        style: TextStyle(
                                            color: black_354356,
                                            fontFamily: fontMavenProBold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.sp),
                                        textAlign: TextAlign.center),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  // Description
                                  Center(
                                    child: Text(
                                        "Choose a time when you wanted to \nstart and end Deal.",
                                        style: TextStyle(
                                            color: grey_969da8,
                                            fontFamily: fontMavenProRegular,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.center),
                                    heightFactor: 1.2,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: divider_d4dce7,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  // child: timerPicker(),
                                  child: SizedBox(
                                    height: 180.h,
                                    child: CupertinoDatePicker(
                                      //  initialDateTime: starttime,
                                      mode: CupertinoDatePickerMode.time,
                                      use24hFormat: false,
                                      // This is called when the user changes the time.
                                      onDateTimeChanged: (DateTime newTime) {
                                        DateTime dateTime =
                                            DateTime.parse(newTime.toString());
                                        String yourDateTime =
                                            DateFormat('h:mm a')
                                                .format(dateTime);
                                        setState(
                                            () => starttime = yourDateTime);
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  // child: timerPicker(),
                                  child: SizedBox(
                                    height: 180.h,
                                    child: CupertinoDatePicker(
                                      //  initialDateTime: endttime,
                                      mode: CupertinoDatePickerMode.time,
                                      use24hFormat: false,
                                      // This is called when the user changes the time.
                                      onDateTimeChanged: (DateTime newTime) {
                                        DateTime dateTime =
                                            DateTime.parse(newTime.toString());
                                        String yourDateTime =
                                            DateFormat('h:mm a')
                                                .format(dateTime);
                                        setState(() => endttime = yourDateTime);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: divider_d4dce7,
                            ),

                            // Cancel
                            Center(
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context, false),
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text("Confirm".toUpperCase(),
                                        style: TextStyle(
                                            color: Blue_5468ff,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.sp),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context, false),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: // Cancel
                            Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("Cancel".toUpperCase(),
                              style: TextStyle(
                                  color: blue_3653f6,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: fontMavenProMedium,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        });
  }

  void selecDayOfWeek(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setModalState /*You can rename this!*/) {
            return Container(
                margin: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.r),
                        topRight: Radius.circular(13.r),
                        bottomRight: Radius.circular(13.r),
                        bottomLeft: Radius.circular(13.r))),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        child: Column(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Daily Opportunities
                                    // Title
                                    Center(
                                      child: Text("Select Day(s) of the week",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily: fontMavenProBold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.sp),
                                          textAlign: TextAlign.center),
                                    ),

                                    SizedBox(
                                      height: 20.h,
                                    ),

                                    const Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: divider_d4dce7,
                                    ),

                                    ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        primary: false,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(
                                          top: 10,
                                        ),
                                        itemCount: onOfferModel.length,
                                        itemBuilder: (context, i) =>
                                            GestureDetector(
                                              onTap: () {
                                                setModalState(
                                                  () {
                                                    if (selectedList.contains(
                                                        onOfferModel[i]
                                                            .title)) {
                                                      selectedList.remove(
                                                          onOfferModel[i]
                                                              .title);
                                                    } else {
                                                      selectedList.add(
                                                          onOfferModel[i]
                                                              .title);
                                                    }
                                                  },
                                                );
                                                setState(() {
                                                  final removedBrackets =
                                                      selectedList
                                                          .toString()
                                                          .substring(
                                                              1,
                                                              selectedList
                                                                      .toString()
                                                                      .length -
                                                                  1);
                                                  final parts = removedBrackets
                                                      .split(', ');

                                                  var joined = parts
                                                      .map((part) => "$part")
                                                      .join(', ');

                                                  print(joined);
                                                  MyConstant.strdays = joined;
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16,
                                                    top: 11,
                                                    bottom: 11),
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      SvgPicture.asset(selectedList
                                                              .contains(
                                                                  onOfferModel[
                                                                          i]
                                                                      .title)
                                                          ? icon_selected_checkbox
                                                          : icon_unselected_checkbox),
                                                      SizedBox(
                                                        width: 12.w,
                                                      ),
                                                      // Value Selected
                                                      Text(
                                                          onOfferModel[i].title,
                                                          style: TextStyle(
                                                              color:
                                                                  black_354356,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  fontMavenProMedium,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 15.sp),
                                                          textAlign:
                                                              TextAlign.left)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
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
                                white_ffffff,
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
                                white_ffffff,
                                Colors.white,
                                Blue_5468ff),
                          ),
                        ],
                      )
                    ],
                  ),
                ));
          });
        });
  }
}
