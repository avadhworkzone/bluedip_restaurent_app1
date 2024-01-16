import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_font.dart';
import '../../Styles/my_icons.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/box_shadow_ticket.dart';
import '../../Widget/box_shadow_ticket_second.dart';
import '../../Widget/common_blue_border_button.dart';
import '../../Widget/common_blue_button.dart';

class BottomSheetMoreTime extends StatefulWidget {
  const BottomSheetMoreTime({Key? key}) : super(key: key);

  @override
  State<BottomSheetMoreTime> createState() => _BottomSheetMoreTimeState();
}

class _BottomSheetMoreTimeState extends State<BottomSheetMoreTime> {
  List<OfferModel> offerList = [
    OfferModel("5 mint"),
    OfferModel("10 mint"),
    OfferModel("15 mint"),
  ];
  int mySelectConsultation = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  // Daily Opportunities
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Need More Time",
                          style: TextStyle(
                              color: black_354356,
                              fontFamily: fontJosefinSansBold,
                              fontStyle: FontStyle.normal,
                              fontSize: 18.sp,
                              height: 1.5),
                          textAlign: TextAlign.center),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context, false);
                        },
                        child: SvgPicture.asset(icon_cancel),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Center(
                    child: Image.asset(
                      img_order_waiting,
                      width: 137.w,
                      height: 127.h,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: divider_d4dce7,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // How much more time do you need to prepare food?
                  Text("How much more time do you need to \nprepare food?",
                      style: TextStyle(
                          color: black_354356,
                          fontFamily: fontMavenProProSemiBold,
                          fontStyle: FontStyle.normal,
                          height: 1.3,
                          fontSize: 15.sp),
                      textAlign: TextAlign.left),

                  SizedBox(
                    height: 45.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                          top: 14,
                        ),
                        itemCount: offerList.length,
                        itemBuilder: (context, i) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  mySelectConsultation = i;
                                });
                              },
                              child: Container(
                                width: 86.w,
                                margin: EdgeInsets.only(right: 16.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                      width: 1,
                                      color: mySelectConsultation == i
                                          ? Blue_5468ff
                                          : grey_d9dde3),
                                  color: mySelectConsultation == i
                                      ? Blue_5468ff
                                      : Colors.white,
                                ),
                                padding: EdgeInsets.symmetric(vertical: 6.h),
                                child: // 5 mint
                                    Text(offerList[i].title,
                                        style: TextStyle(
                                            color: mySelectConsultation == i
                                                ? Colors.white
                                                : Blue_5468ff,
                                            fontFamily: fontMavenProMedium,
                                            fontSize: 15.sp),
                                        textAlign: TextAlign.center),
                              ),
                            )),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ))
        ]);
  }
}
