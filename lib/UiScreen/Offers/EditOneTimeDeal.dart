import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/UiScreen/bottom_bar/LatestBottomNavigationScreen.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/request_model/edit_offer_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/edit_offer_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/utils/validation_utils.dart';
import 'package:bluedip_restaurent/viewModel/offer_view_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/common_blue_border_button.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/drop_down_box_shadow.dart';
import '../../Widget/toolbar_with_title.dart';

class EditOneTimeDeal extends StatefulWidget {
  EditOneTimeDeal(
      {Key? key,
      this.offerId,
      this.offerPersantage,
      this.startTime,
      this.endTime,
      this.timePeriod,
      this.deal,
      this.day,
      this.offerType})
      : super(key: key);
  String? offerId;
  String? offerPersantage;
  String? timePeriod;
  String? startTime;
  String? endTime;
  List? day;
  int? deal;
  String? offerType;

  @override
  State<EditOneTimeDeal> createState() => _EditOneTimeDealState();
}

class _EditOneTimeDealState extends State<EditOneTimeDeal> {
  bool all_day = false;
  bool time_limit = false;
  bool dine_in = false;
  bool takeaways = false;
  String? offerType;
  ManageOfferViewModel manageOfferViewModel = Get.find();
  EditOfferReqModel reqModel = EditOfferReqModel();
  TimePeriod timePeriod = TimePeriod();

  // String? selectedTimeSlot;
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTimeSecond = TimeOfDay.now();

  String starttime = "Select";
  String endttime = "Select";

  Duration duration = const Duration(hours: 1, minutes: 00);
  final totalDeal = TextEditingController();
  List day = ["Dine-in", "Takeaway"];
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

  @override
  void initState() {
    getEdit();
    // TODO: implement initState
    super.initState();
  }

  getEdit() {
    widget.timePeriod == "All day" ? all_day = true : time_limit = true;
    starttime = widget.startTime!;
    endttime = widget.endTime!;

    totalDeal.text = widget.deal.toString();
    offerType = 'Dine-in' == widget.offerType ? day[0] : day[1];
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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToolbarWithTitle("Edit One Time Deal"),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.h),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xffe5ebf6),
                                    offset: Offset(0, 6),
                                    blurRadius: 8,
                                    spreadRadius: 0)
                              ],
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(0.8, 1),
                                  colors: [
                                    Color(0xff73a5ff),
                                    Color(0xff1e6af2)
                                  ])),
                          child: Padding(
                            padding: EdgeInsets.all(14.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Deal Id #213113
                                Text("Deal Id #${widget.offerId}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: fontMavenProRegular,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),
                                SizedBox(
                                  height: 8.h,
                                ),

                                // 35% off on Wednesday from 9AM - 11PM
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      widget.day!.length,
                                      (index) => Text(
                                          "${widget.offerPersantage} off on ${widget.day![index]} from ${widget.startTime} - ${widget.endTime}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: fontMavenProBold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left)),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text("Offer Percentage (%)",
                            style: TextStyle(
                                color: black_354356,
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
                                '${widget.offerPersantage}',

                                /// str_select_your_role,
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
                                                selectTimePicker(context);
                                                // setState(() {
                                                //   _selectTime(context);
                                                // });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(14.r),
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
                                                      child: Text(starttime,
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
                                                  selectTimePicker(context);
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
                                                    Text(endttime,
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
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: 14.h,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children:
                                        List.generate(day.length, (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          offerType = day[index];
                                          setState(() {});
                                        },
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                offerType == day[index]
                                                    ? icon_selected_checkbox
                                                    : icon_unselected_checkbox),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            // All day
                                            Text("${day[index]}",
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontFamily:
                                                        fontMavenProMedium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              width: 50.w,
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),

                                  // GestureDetector(
                                  //   onTap: () {
                                  //     setState(() {
                                  //       takeaways = !takeaways;
                                  //     });
                                  //   },
                                  //   child: Row(
                                  //     children: [
                                  //       SvgPicture.asset(takeaways
                                  //           ? icon_selected_checkbox
                                  //           : icon_unselected_checkbox),
                                  //       SizedBox(
                                  //         width: 10.w,
                                  //       ),
                                  //       // All day
                                  //       Text("Takeaways",
                                  //           style: TextStyle(
                                  //               color: black_354356,
                                  //               fontFamily: fontMavenProMedium,
                                  //               fontStyle: FontStyle.normal,
                                  //               fontSize: 14.sp),
                                  //           textAlign: TextAlign.left)
                                  //     ],
                                  //   ),
                                  // ),
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
                                fontSize: 15.sp),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 6.h,
                        ),
                        loginTextformField("",
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            controller: totalDeal,
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
                                child: CommonBlueButton(strUpdate.toUpperCase(),
                                    () async {
                                  reqModel.action = "edit_offer";
                                  reqModel.offerId =
                                      int.parse(widget.offerId.toString());
                                  reqModel.timeType = all_day == true
                                      ? 'All day'
                                      : 'Time Limit';
                                  reqModel.offerPercentage =
                                      selectedPercent == null
                                          ? widget.offerPersantage
                                          : selectedPercent;
                                  timePeriod.start = starttime;
                                  timePeriod.end = endttime;
                                  reqModel.timePeriod = timePeriod;
                                  reqModel.offerType = offerType;
                                  reqModel.totalDeal = totalDeal.text;
                                  await manageOfferViewModel.editOfferViewModel(
                                      body: reqModel);
                                  if (manageOfferViewModel
                                          .editOfferApiResponse.status ==
                                      Status.COMPLETE) {
                                    EditOfferResModel res = manageOfferViewModel
                                        .editOfferApiResponse.data;
                                    if (res.status == true) {
                                      Get.offAll(
                                          const LatestBottomNavigationScreen());
                                    } else {
                                      Get.snackbar('', '${res.message}',
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.white,
                                          backgroundColor: blue_3d56f0);
                                    }
                                  }
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
              if (controller.editOfferApiResponse.status == Status.LOADING) {
                return CircularIndicator();
              }
              return SizedBox();
            },
          )
        ],
      ),
    ));
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  _selectTimeSecond(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTimeSecond,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTimeSecond) {
      setState(() {
        selectedTimeSecond = timeOfDay;
      });
    }
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
                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: divider_d4dce7,
                            ),

                            // Cancel
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context, false);
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
}
