import 'package:bluedip_restaurent/Model_list_logic/OfferModel.dart';
import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../Model_list_logic/Category_Model.dart';
import '../Model_list_logic/DayDateModel.dart';
import '../Styles/my_font.dart';
import '../Styles/my_strings.dart';
import '../Widget/TicketPainter.dart';
import '../Widget/box_shadow.dart';
import '../Widget/box_shadow_ticket.dart';
import '../Widget/box_shadow_ticket_second.dart';
import '../Widget/common_blue_button.dart';
import 'bottomsheets/BottomSheetDailyOpportunities.dart';

class HomepageTest extends StatefulWidget {
  const HomepageTest({Key? key}) : super(key: key);

  @override
  State<HomepageTest> createState() => _HomepageState();
}

bool statusHomeNoti = false;

class _HomepageState extends State<HomepageTest> {
  DateTime _selectedValue = DateTime.now();

  List<OfferModel> offerList = [
    OfferModel("Offer ID #123113"),
    OfferModel("Offer ID #123114"),
    OfferModel("Offer ID #123116"),
    OfferModel("Offer ID #123115"),
  ];

  int SelectdaydateList = 0;

  List<DayDateModel> daydatefferList = [
    DayDateModel("Today", "02"),
    DayDateModel("Tue", "03"),
    DayDateModel("Wed", "04"),
    DayDateModel("Thur", "05"),
    DayDateModel("Fri", "06"),
    DayDateModel("Sat", "07"),
    DayDateModel("Sun", "08"),
  ];

  bool issubscriptionList = false;
  bool issubscribeplan = true;

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
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Payment
                          Text("Offers",
                              style: TextStyle(
                                  color: black_354356,
                                  fontFamily: fontJosefinSansBold,
                                  fontSize: 20.sp),
                              textAlign: TextAlign.left),
                          SvgPicture.asset(
                            icon_notification,
                            width: 24.w,
                            height: 24.h,
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: divider_d4dce7,
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 16),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Sep 2022
                          Text("Sep 2022",
                              style: TextStyle(
                                  color: black_354356,
                                  fontFamily: fontMavenProBold,
                                  fontSize: 16.sp),
                              textAlign: TextAlign.left),
                          // SvgPicture.asset(icon_down_arrow,width: 18.w,height: 18.h,)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    SizedBox(
                      height: 90.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                                width: 5.w,
                              ),
                          itemCount: daydatefferList.length,
                          itemBuilder: (context, i) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    SelectdaydateList = i;
                                  });
                                },
                                child: Container(
                                  width: 52.w,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: SelectdaydateList == i
                                                ? Color(0x8c4988f9)
                                                : Colors.white,
                                            offset: Offset(0, 4),
                                            blurRadius: 5,
                                            spreadRadius: 0)
                                      ],
                                      gradient: LinearGradient(
                                          begin: Alignment(0, 0),
                                          end: Alignment(0.9428571482093964,
                                              0.9999999869113068),
                                          colors: [
                                            SelectdaydateList == i
                                                ? Color(0xff73a5ff)
                                                : Colors.white,
                                            SelectdaydateList == i
                                                ? Color(0xff1e6af2)
                                                : Colors.white
                                          ])),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Tue
                                        Text(daydatefferList[i].Day,
                                            style: TextStyle(
                                                color: SelectdaydateList == i
                                                    ? Colors.white
                                                    : black_354356,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.center),

                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(daydatefferList[i].Date,
                                            style: TextStyle(
                                                color: SelectdaydateList == i
                                                    ? Colors.white
                                                    : grey_969da8,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp),
                                            textAlign: TextAlign.center)
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        selectDailyOpportunity(context);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 14.h, horizontal: 16.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment(3.1086244689504383e-15,
                                  3.1086244689504383e-15),
                              end: Alignment(
                                  1.0000000000000013, 1.0000000596046497),
                              colors: [Color(0xff62ddff), Color(0xff0cb9eb)]),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Daily Opportunities
                                  Text("Daily Opportunities",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                              SvgPicture.asset(icon_next_arrow)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: issubscribeplan,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 16.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 24.h),
                        decoration: boxDecoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              icon_rocket_blue_png,
                              width: 60.w,
                              height: 60.h,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            // Maximise your profit by 10x
                            Text(
                                "Please buy subscription plan \nfor active your services.",
                                style: TextStyle(
                                    color: black_354356,
                                    fontFamily: fontJosefinSansBold,
                                    fontSize: 20.sp),
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: 4.h,
                            ),
                            // With our range of subscription plans, we aim to provide our restaurant partners with the flexibility
                            Text(
                                "With our range of subscription plans, we aim to provide our restaurant partners with the flexibility and support they need to maximize their revenue potential.",
                                style: TextStyle(
                                    color: black_354356,
                                    fontFamily: fontMavenProRegular,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp,
                                    height: 1.3),
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: 24.h,
                            ),
                            Container(
                              width: 200,
                              child: CommonBlueButton("Subscribe Plan", () {
                                setState(() {
                                  issubscriptionList = true;
                                  issubscribeplan = false;
                                });
                              }, blue_3653f6),
                            )
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: issubscriptionList,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        primary: false,
                        shrinkWrap: true,
                        itemCount: offerList.length,
                        itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: boxDecorationTicket,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, top: 12, bottom: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // Offer ID #123113
                                          Row(
                                            children: [
                                              Text(offerList[i].title,
                                                  style: TextStyle(
                                                      color: black_354356,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily:
                                                          fontMavenProRegular,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  textAlign: TextAlign.left),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r),
                                                    color: Color(0xffe7e9ff)),
                                                child: // Live later
                                                    Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 2),
                                                  child: Text("Live later",
                                                      style: TextStyle(
                                                          color: black_354356,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              fontMavenProMedium,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 12.sp),
                                                      textAlign:
                                                          TextAlign.right),
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(
                                            width: 20,
                                            child: PopupMenuButton(
                                              offset: const Offset(-10, 15),
                                              itemBuilder: (context) => [
                                                PopupMenuItem(
                                                  value: 1,
                                                  child: // Edit
                                                      Text("Edit",
                                                          style: TextStyle(
                                                              color:
                                                                  black_354356,
                                                              fontFamily:
                                                                  fontMavenProMedium,
                                                              fontSize: 14.sp),
                                                          textAlign:
                                                              TextAlign.left),
                                                ),
                                                PopupMenuItem(
                                                  value: 1,
                                                  child: // Edit
                                                      Container(
                                                    width: 130,
                                                    child: Row(
                                                      children: [
                                                        Text("Status",
                                                            style: TextStyle(
                                                                color:
                                                                    black_354356,
                                                                fontFamily:
                                                                    fontMavenProMedium,
                                                                fontSize:
                                                                    14.sp),
                                                            textAlign:
                                                                TextAlign.left),
                                                        SizedBox(
                                                          width: 50,
                                                        ),
                                                        FlutterSwitch(
                                                          width: 40.0,
                                                          height: 23.0,
                                                          activeColor:
                                                              Blue_5468ff,
                                                          inactiveColor:
                                                              grey_969da8,
                                                          valueFontSize: 0.0,
                                                          toggleSize: 18.0,
                                                          value: statusHomeNoti,
                                                          borderRadius: 15.0,
                                                          padding: 2.0,
                                                          showOnOff: true,
                                                          onToggle: (val) {
                                                            setState(() {
                                                              statusHomeNoti =
                                                                  val;
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                PopupMenuItem(
                                                  value: 2,
                                                  child: // Edit
                                                      Text("Delete",
                                                          style: TextStyle(
                                                              color: red_fa695e,
                                                              fontFamily:
                                                                  fontMavenProMedium,
                                                              fontSize: 14.sp),
                                                          textAlign:
                                                              TextAlign.left),
                                                ),
                                              ],
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 10),
                                              child:
                                                  SvgPicture.asset(icon_menu),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Validity: All day | 9:00 am to 9:00 pm
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            style: TextStyle(
                                                color: light_black_5f6d7b,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: fontMavenProRegular,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            text: "Validity: "),
                                        TextSpan(
                                            style: TextStyle(
                                                color: Blue_5468ff,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: fontMavenProRegular,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            text:
                                                "All day |  9:00 am to 9:00 pm")
                                      ])),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      height: 25,
                                      width: 15,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(16),
                                                bottomRight:
                                                    Radius.circular(16)),
                                            color: bg_f3f5f9),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: LayoutBuilder(
                                            builder: (context, constraints) {
                                          return Flex(
                                              direction: Axis.horizontal,
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List.generate(
                                                  (constraints.constrainWidth() /
                                                          10)
                                                      .floor(),
                                                  (index) => const SizedBox(
                                                        height: 1,
                                                        width: 5,
                                                        child: DecoratedBox(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  divider_d4dce7),
                                                        ),
                                                      )));
                                        }),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                      width: 15,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                bottomLeft:
                                                    Radius.circular(16)),
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
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.h, left: 12.w, right: 12.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                fontMavenProMedium,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12.sp),
                                                        textAlign:
                                                            TextAlign.left)
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
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                fontMavenProMedium,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12.sp),
                                                        textAlign:
                                                            TextAlign.left)
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
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                fontMavenProMedium,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12.sp),
                                                        textAlign:
                                                            TextAlign.left)
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
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                fontMavenProMedium,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12.sp),
                                                        textAlign:
                                                            TextAlign.left)
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
                                        Expanded(
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
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(100),
                                                  bottomLeft:
                                                      Radius.circular(100),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xffecd085),
                                                  Color(0xffdea91b),
                                                ],
                                              )),
                                          child: // predicted results
                                              Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 21.w,
                                                vertical: 4.h),
                                            child: Text(
                                                "predicted results"
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        fontMavenProMedium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left),
                                          ),
                                        ),
                                        Expanded(
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          fontMavenProMedium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 12.sp),
                                                  textAlign: TextAlign.right),
                                              SizedBox(
                                                height: 4.h,
                                              ),

                                              // 15-20
                                              Text("15-20",
                                                  style: TextStyle(
                                                      color: black_354356,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          fontMavenProProSemiBold,
                                                      fontStyle:
                                                          FontStyle.normal,
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          fontMavenProMedium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 12.sp),
                                                  textAlign: TextAlign.right),
                                              SizedBox(
                                                height: 4.h,
                                              ),

                                              // 15-20
                                              Text("25,000",
                                                  style: TextStyle(
                                                      color: black_354356,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          fontMavenProProSemiBold,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  textAlign: TextAlign.right)
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
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  void selectDailyOpportunity(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
              decoration: BoxDecoration(
                  color: bg_f3f5f9,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r))),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Wrap(
                  children: [BottomSheetDailyOpportunities()],
                ),
              ));
        });
  }
}
