import 'dart:convert';
import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/UiScreen/bottom_bar/LatestBottomNavigationScreen.dart';
import 'package:bluedip_restaurent/modal/apiModel/request_model/add_offer_req_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/utils/validation_utils.dart';
import 'package:bluedip_restaurent/viewModel/bottom_view_model.dart';
import 'package:bluedip_restaurent/viewModel/offer_view_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_constant.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/circular_progrss_indicator.dart';
import '../../Widget/common_blue_border_button.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/drop_down_box_shadow.dart';
import '../../modal/apiModel/response_model/common_res_model.dart';

class OneTimeDeal extends StatefulWidget {
  OneTimeDeal({Key? key, required this.tabIndex}) : super(key: key);
  int tabIndex;

  @override
  State<OneTimeDeal> createState() => _OneTimeDealState();
}

class _OneTimeDealState extends State<OneTimeDeal> {
  bool all_day = false;
  bool time_limit = false;
  bool dine_in = false;
  bool takeaways = false;
  ManageOfferViewModel manageOfferViewModel = Get.find();
  AddOfferReqModel addOfferReqModel = AddOfferReqModel();
  BottomViewModel bottomViewModel = Get.find();

  String starttime = "";
  String endttime = "";

  // String? selectedTimeSlot;
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTimeSecond = TimeOfDay.now();
  List<String> selectedList = [];
  OfferData offerDataList = OfferData();
  OfferData offerDataList2 = OfferData();
  final totalDeal = TextEditingController();
  final minAmountController = TextEditingController();

  Duration duration = const Duration(hours: 1, minutes: 00);

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
  OfferData offerData = OfferData();
  TimePeriod timePeriod = TimePeriod();

  bool isAllday = false;

  int mySelectConsultation = -1;

  // List<OfferModel> onOfferModel = [];
  // List<String> selectedList = [] ;
  String selectedDay = "";

  List<OfferModel> onOfferModel = [
    OfferModel("Sunday"),
    OfferModel("Monday"),
    OfferModel("Tuesday"),
    OfferModel("Wednesday"),
    OfferModel("Thursday"),
    OfferModel("Friday"),
    OfferModel("Saturday"),
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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  ToolbarWithTitle("Create One Time Deal"),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.tabIndex == 0
                            ? Text("Select Day ",
                                style: TextStyle(
                                    color: black_354356,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp,
                                    fontFamily: fontMavenProProSemiBold),
                                textAlign: TextAlign.left)
                            : Text("Select Day of the week",
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
                        widget.tabIndex == 0
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selecDay(context);
                                  });
                                },
                                child: Container(
                                  decoration: boxDecoration,
                                  padding: EdgeInsets.all(14.r),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Select
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                            selectedDay.isNotEmpty
                                                ? selectedDay
                                                : "Select",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProMedium,
                                                fontSize: 15.sp,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            textAlign: TextAlign.left),
                                      ),
                                      SvgPicture.asset(
                                        icon_down_arrow,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selecDayOfWeek(context);
                                  });
                                },
                                child: Container(
                                  decoration: boxDecoration,
                                  padding: EdgeInsets.all(14.r),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                overflow:
                                                    TextOverflow.ellipsis),
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
                                fontStyle: FontStyle.normal,
                                fontFamily: fontMavenProProSemiBold,
                                fontSize: 15.sp),
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

                        /*Time Period Layout*/
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
                                      fontFamily: fontMavenProProSemiBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp),
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
                                                  fontFamily:
                                                      fontMavenProRegular,
                                                  fontSize: 14.sp),
                                            ),
                                            SizedBox(
                                              height: 6.h,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                selectTimePicker(
                                                    context: context,
                                                    isStartTime: true);
                                                // setState(() {
                                                //   _selectTime(context);
                                                // });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(14.h),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.r),
                                                  border: Border.all(
                                                      color: grey_d9dde3,
                                                      width: 1),
                                                ),
                                                child: // Detail
                                                    Row(
                                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                          starttime == ""
                                                              ? "Select"
                                                              : starttime,
                                                          style: TextStyle(
                                                              color:
                                                                  black_354356,
                                                              fontFamily:
                                                                  fontMavenProMedium,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 15.sp,
                                                              overflow:
                                                                  TextOverflow
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
                                                  fontFamily:
                                                      fontMavenProRegular,
                                                  fontSize: 14.sp),
                                            ),
                                            SizedBox(
                                              height: 6.h,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectTimePicker(
                                                      isStartTime: false,
                                                      context: context);
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(14.h),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.r),
                                                  border: Border.all(
                                                      color: grey_d9dde3,
                                                      width: 1),
                                                ),
                                                child: // Detail
                                                    Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        endttime ==
                                                                ""
                                                            ? "Select"
                                                            : endttime,
                                                        style: TextStyle(
                                                            color: black_354356,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                fontMavenProMedium,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 15.sp),
                                                        textAlign:
                                                            TextAlign.left),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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

                        /*Offer Type Layout*/
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
                                      fontFamily: fontMavenProProSemiBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp),
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
                                fontFamily: fontMavenProProSemiBold,
                                fontStyle: FontStyle.normal,
                                fontSize: 15.sp),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 6.h,
                        ),
                        loginTextformField("",
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            controller: totalDeal,
                            obscureText: true,
                            onChanged: (value) {},
                            regularExpression: RegularExpression.digitsPattern),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text("Minimum Amount",
                            style: TextStyle(
                                color: black_354356,
                                fontFamily: fontMavenProProSemiBold,
                                fontStyle: FontStyle.normal,
                                fontSize: 15.sp),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 6.h,
                        ),
                        loginTextformField("",
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            controller: minAmountController,
                            obscureText: true,
                            onChanged: (value) {},
                            regularExpression: RegularExpression.pricePattern),
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
                                    child: Text(
                                        "predicted results".toUpperCase(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                fontFamily:
                                                    fontMavenProProSemiBold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.right)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    strPublish.toUpperCase(), () async {
                                  print(
                                      'min_amount===>>${minAmountController.text}');
                                  addOfferReqModel.action = 'add_offer';
                                  if (dine_in == true && takeaways == true) {
                                    /// DINE IN
                                    offerDataList.dealType =
                                        widget.tabIndex == 0
                                            ? 'ONE-TIME-DEAL'
                                            : 'RECURRING-DEAL';
                                    offerDataList.offerPercentage =
                                        selectedPercent;
                                    offerDataList.timeType = all_day == true
                                        ? 'All day'
                                        : 'Time Limit';
                                    timePeriod.start = starttime;
                                    timePeriod.end = endttime;
                                    offerDataList.timePeriod = timePeriod;
                                    offerDataList.offerType = "Dine-in";
                                    offerDataList.totalDeal = totalDeal.text;
                                    offerDataList.minAmount =
                                        minAmountController.text.toString();

                                    /// TAKE AWAYS
                                    offerDataList2.dealType =
                                        widget.tabIndex == 0
                                            ? 'ONE-TIME-DEAL'
                                            : 'RECURRING-DEAL';
                                    offerDataList2.offerPercentage =
                                        selectedPercent;
                                    offerDataList2.timeType = all_day == true
                                        ? 'All day'
                                        : 'Time Limit';
                                    timePeriod.start = starttime;
                                    timePeriod.end = endttime;
                                    offerDataList2.timePeriod = timePeriod;
                                    offerDataList2.totalDeal = totalDeal.text;
                                    offerDataList2.minAmount =
                                        minAmountController.text.toString();
                                    offerDataList2.offerType = "Takeaway";
                                    addOfferReqModel.offerData = [
                                      offerDataList,
                                      offerDataList2
                                    ];
                                  } else {
                                    offerData.dealType = widget.tabIndex == 0
                                        ? 'ONE-TIME-DEAL'
                                        : 'RECURRING-DEAL';
                                    offerData.offerPercentage = selectedPercent;
                                    offerData.timeType = all_day == true
                                        ? 'All day'
                                        : 'Time Limit';
                                    timePeriod.start = starttime;
                                    timePeriod.end = endttime;
                                    offerData.timePeriod = timePeriod;
                                    offerData.totalDeal = totalDeal.text;
                                    offerData.minAmount =
                                        minAmountController.text.toString();
                                    offerData.offerType = dine_in == true
                                        ? "Dine-in"
                                        : "Takeaway";
                                    addOfferReqModel.offerData = [offerData];
                                  }
                                  await manageOfferViewModel.addOfferViewModel(
                                      body: addOfferReqModel);
                                  CommonResponseModel response =
                                      manageOfferViewModel
                                          .addOfferApiResponse.data;
                                  if (manageOfferViewModel
                                          .addOfferApiResponse.status ==
                                      Status.ERROR) {
                                    Get.snackbar('', 'There Must be error',
                                        snackPosition: SnackPosition.BOTTOM,
                                        colorText: Colors.white,
                                        backgroundColor: blue_3d56f0);
                                  }
                                  if (manageOfferViewModel
                                          .addOfferApiResponse.status ==
                                      Status.COMPLETE) {
                                    if (response.status == true) {
                                      bottomViewModel.currentIndex = 0;
                                      Get.offAll(
                                          const LatestBottomNavigationScreen());
                                    } else {
                                      Get.snackbar('', '${response.message}',
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.white,
                                          backgroundColor: blue_3d56f0);
                                    }
                                  }
                                  print(
                                      'addOfferReqModel--${jsonEncode(addOfferReqModel)}');
                                }, blue_3653f6)),
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
          GetBuilder<ManageOfferViewModel>(
            builder: (controller) {
              if (controller.addOfferApiResponse.status == Status.LOADING) {
                return CircularIndicator();
              }
              return SizedBox();
            },
          )
        ],
      ),
    ));
  }

  void selectTimePicker(
      {required BuildContext context, required bool isStartTime}) {
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
                                    heightFactor: 1.2,
                                    child: Text(
                                        "Choose a time when you wanted to \nstart and end Deal.",
                                        style: TextStyle(
                                            color: grey_969da8,
                                            fontFamily: fontMavenProRegular,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
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
                                        setState(() {
                                          starttime = yourDateTime;
                                          print(
                                              'select time----===${starttime}');
                                        });
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
                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: divider_d4dce7,
                            ),

                            // Cancel
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  // if (isStartTime == true) {
                                  if (starttime == "" && endttime == "") {
                                    snackBar(title: 'Select Time');
                                  } else {
                                    Navigator.pop(context, false);
                                    // }
                                    // } else {
                                    //   if (endttime == "") {
                                    //     print('select time');
                                    //   } else {
                                    //     Navigator.pop(context, false);
                                    //   }
                                  }
                                },
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

  void selecDay(BuildContext context) {
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
                                      child: Text("Select Day",
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
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                        ),
                                        itemCount: onOfferModel.length,
                                        itemBuilder: (context, i) =>
                                            GestureDetector(
                                              onTap: () {
                                                setModalState(
                                                  () {
                                                    mySelectConsultation = i;
                                                    selectedDay =
                                                        (onOfferModel[i].title);
                                                    offerDataList.day = [
                                                      onOfferModel[i].title
                                                    ];
                                                    offerDataList2.day = [
                                                      onOfferModel[i].title
                                                    ];
                                                    offerData.day = [
                                                      onOfferModel[i].title
                                                    ];
                                                  },
                                                );
                                                setState(() {});
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
                                                      SvgPicture.asset(
                                                          mySelectConsultation ==
                                                                  i
                                                              ? icon_selected_radio
                                                              : icon_unselected_radio),
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
                                        padding: const EdgeInsets.only(
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

                                                    offerData.day =
                                                        selectedList;
                                                    offerDataList.day =
                                                        selectedList;
                                                    offerDataList2.day =
                                                        selectedList;
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
