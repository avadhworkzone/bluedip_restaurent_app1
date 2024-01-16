import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../Model_list_logic/OfferModel.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_strings.dart';
import '../Widget/Textfield.dart';
import '../Widget/back_button.dart';
import '../Widget/box_shadow.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/passwordtextfield.dart';
import '../Widget/toolbar_with_title.dart';

import 'PayoutOrderListTakeaway.dart';

class PayoutOrderList extends StatefulWidget {
  const PayoutOrderList({Key? key}) : super(key: key);

  @override
  State<PayoutOrderList> createState() => _PayoutOrderListState();
}

class _PayoutOrderListState extends State<PayoutOrderList> {
  bool statusBiometric = false;

  List<OfferModel> offerList = [
    OfferModel("Pending"),
    OfferModel("Paid"),
    OfferModel("failed"),
  ];

  bool addbanklayout = true;
  bool Withdrawlayout = false;
  bool editbanklayout = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return DefaultTabController(
      length: 2,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: bg_f3f5f9,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToolbarWithTitle("Trxn Id: 13112131"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              padding: EdgeInsets.all(14.r),
              decoration: boxDecoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 11 Jun, 2022
                      Text("11 Jun, 2022",
                          style: TextStyle(
                              color: black_354356,
                              fontFamily: fontMavenProRegular,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            icon_rupee_slim,
                            width: 15.w,
                            height: 15.h,
                          ),
                          // 5,500
                          Text("5,500",
                              style: TextStyle(
                                  color: black_354356,
                                  fontFamily: fontMavenProBold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.sp),
                              textAlign: TextAlign.left)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Color(0xfff0ad4e),
                    ),
                    child: // Completed
                        Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
                      child: Text("Pending",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: fontMavenProMedium,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp),
                          textAlign: TextAlign.left),
                    ),
                  )
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.only(left: 32.w,right: 0.w),
              height: 35.h,
              color: bg_f3f5f9,
              width: double.infinity,
              child: TabBar(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                labelPadding: EdgeInsets.zero,
                isScrollable: true,
                labelColor: Colors.white,

                unselectedLabelColor: grey_969da8,

                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6), color: Blue_5468ff),
                tabs: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: const Tab(
                      child: Text("Takeaway"),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: const Text("Dine-in"),
                    ),
                  ),
                ],
                // indicatorWeight: 10,
                labelStyle: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: fontMavenProMedium), //For Selected tab
                unselectedLabelStyle: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: fontMavenProMedium), //For Un-selected Tabs
              ),
            ),
            const Expanded(
              flex: 1,
              child: TabBarView(
                physics: ScrollPhysics(),
                // controller: _tabController,
                children: [
                  PayoutOrderListTakeaway(),
                  PayoutOrderListTakeaway(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
