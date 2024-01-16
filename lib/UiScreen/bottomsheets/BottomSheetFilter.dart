import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_font.dart';
import '../../Styles/my_icons.dart';
import '../../Widget/box_shadow_ticket.dart';
import '../../Widget/box_shadow_ticket_second.dart';

class BottomSheetFilter extends StatefulWidget {
  const BottomSheetFilter({Key? key}) : super(key: key);

  @override
  State<BottomSheetFilter> createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {
  DateTime from_date = DateTime(2016, 10, 26);
  DateTime to_date = DateTime(2018, 06, 28);

  bool all_day = false;
  bool time_limit = false;
  bool dine_in = false;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Daily Opportunities
              // Title
              Center(
                child: Text("Filter Order History",
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

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Status Type",
                        style: TextStyle(
                            color: black_354356,
                            fontFamily: fontMavenProProSemiBold,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              all_day = true;
                              time_limit = false;
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
                              Text("Completed",
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
                              Text("Cancelled",
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
                    SizedBox(
                      height: 25.h,
                    ),
                    // Title
                    Text("Date filter",
                        style: TextStyle(
                            color: black_354356,
                            fontFamily: fontMavenProProSemiBold,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 6.h,
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () => _showDialog(
                              CupertinoDatePicker(
                                initialDateTime: from_date,
                                mode: CupertinoDatePickerMode.date,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  setState(() => from_date = newTime);
                                },
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.r),
                                border:
                                    Border.all(width: 1, color: grey_d9dde3),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(icon_calender_date_event),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // From
                                      Text("From",
                                          style: TextStyle(
                                              color: grey_969da8,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: fontMavenProRegular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.sp),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      // Select
                                      Text(
                                          "${from_date.month}-${from_date.day}-${from_date.year}",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () => _showDialog(
                              CupertinoDatePicker(
                                initialDateTime: to_date,
                                mode: CupertinoDatePickerMode.date,
                                use24hFormat: false,
                                // This is called when the user changes the time.
                                onDateTimeChanged: (DateTime newTime) {
                                  setState(() => to_date = newTime);
                                },
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.r),
                                border:
                                    Border.all(width: 1, color: grey_d9dde3),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(icon_calender_date_event),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // From
                                      Text("To",
                                          style: TextStyle(
                                              color: grey_969da8,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: fontMavenProRegular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.sp),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      // Select
                                      Text(
                                          "${to_date.month}-${to_date.day}-${to_date.year}",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
