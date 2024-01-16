import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Model_list_logic/DailyOpportunityModel.dart';
import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_font.dart';
import '../../Styles/my_icons.dart';
import '../../Widget/box_shadow_ticket.dart';
import '../../Widget/box_shadow_ticket_second.dart';

class BottomSheetDailyOpportunities extends StatefulWidget {
  const BottomSheetDailyOpportunities({Key? key}) : super(key: key);

  @override
  State<BottomSheetDailyOpportunities> createState() =>
      _BottomSheetDailyOpportunitiesState();
}

class _BottomSheetDailyOpportunitiesState
    extends State<BottomSheetDailyOpportunities> {
  List<DailyOpportunityModel> offerList = [
    DailyOpportunityModel(
        "Monday", "Early bird discount", "Attract diners before noon"),
    DailyOpportunityModel(
        "Tuesday", " Tasty Tuesdays", "Enjoy discounts on entrees"),
    DailyOpportunityModel(
        "Wednesday", "Wine down Wednesday", "Half-price wine bottles"),
    DailyOpportunityModel(
        "Thursday", "Thirsty Thursday", "Discounted beer and cocktails"),
    DailyOpportunityModel(
        "Friday", "Fry-day specials", "Discounted appetizers and sides"),
    DailyOpportunityModel(
        "Saturday", "Weekend feast deal", "Discounted multi-course meals"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w, top: 20.h, bottom: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Daily Opportunities
              Text("Daily Opportunities",
                  style: TextStyle(
                      color: black_354356,
                      fontWeight: FontWeight.w700,
                      fontFamily: fontMavenProBold,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.sp),
                  textAlign: TextAlign.left),
              SizedBox(
                height: 6.h,
              ),
              Text("Create demand with AI/ML strategies",
                  style: TextStyle(
                      color: black_354356,
                      fontWeight: FontWeight.w400,
                      fontFamily: fontMavenProRegular,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.sp),
                  textAlign: TextAlign.left)
            ],
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height / 3.22,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            primary: false,
            shrinkWrap: true,
            itemCount: offerList.length,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 16.w,
            ),
            itemBuilder: (context, i) => Container(
              width: 304.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: boxDecorationTicket,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 12.w, right: 12.w, top: 12.h, bottom: 5.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Offer ID #123113
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(offerList[i].title,
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontMavenProProSemiBold,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.left),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  // Atmosphere & walking
                                  Text(offerList[i].Subtitle,
                                      style: TextStyle(
                                          color: light_black_5f6d7b,
                                          fontFamily: fontMavenProRegular,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.left)
                                ],
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  color: blue_3d56f0,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: // Post
                                    Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 7.h),
                                  child: Text("POST",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.right),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 25.h,
                          width: 15.w,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16.r),
                                    bottomRight: Radius.circular(16.r)),
                                color: bg_f3f5f9),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      (constraints.constrainWidth() / 10)
                                          .floor(),
                                      (index) => const SizedBox(
                                            height: 1,
                                            width: 5,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: divider_d4dce7),
                                            ),
                                          )));
                            }),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                          width: 15.w,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                    bottomLeft: Radius.circular(16.r)),
                                color: bg_f3f5f9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: boxDecorationTicketSecond,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.w, right: 12.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Attract early bird diners
                              Text(offerList[i].Decription,
                                  style: TextStyle(
                                      color: Blue_5468ff,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: 6.h,
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          icon_green_rectangle,
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                        SizedBox(
                                          width: 7.w,
                                        ),
                                        // 25% off
                                        Text("25% off",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.left)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          icon_green_rectangle,
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                        SizedBox(
                                          width: 7.w,
                                        ),
                                        // 25% off
                                        Text("Dine -in, Takeaway",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.left)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          icon_green_rectangle,
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                        SizedBox(
                                          width: 7.w,
                                        ),
                                        // 25% off
                                        Text("Repeats weekly",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.left)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          icon_green_rectangle,
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                        SizedBox(
                                          width: 7.w,
                                        ),
                                        // 25% off
                                        Text("15 Deals",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.left)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: DottedLine(
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
                            ),
                            Container(
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
                                      Color(0xff73a5ff),
                                      Color(0xff1e6af2),
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
                                        fontSize: 14.sp,
                                        letterSpacing: 0.7),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: DottedLine(
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
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                        SizedBox(
                          height: 14.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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

        // Cancel
        GestureDetector(
          onTap: () => Navigator.pop(context, false),
          child: Center(
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Close".toUpperCase(),
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
    );
  }
}
