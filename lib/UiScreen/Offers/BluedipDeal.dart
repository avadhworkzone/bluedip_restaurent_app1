import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/UiScreen/AddRestoDetailScreen/DetailPage1.dart';

import 'package:bluedip_restaurent/UiScreen/Offers/OneTimeDeal.dart';
import 'package:bluedip_restaurent/UiScreen/RecurringDeal.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Styles/my_icons.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/MaterialDesignIndicator.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/search_bar.dart';

import '../DineIn/DineInAcceptedTab.dart';
import '../DineIn/DineInIncomingTab.dart';
import '../DineIn/DineInOngoingTab.dart';
import '../IncomingTab.dart';
import '../TakeaWay/PreparingTab.dart';
import '../TakeaWay/ReadyTab.dart';
import '../bottomsheets/BottomSheetCreatDeal.dart';

class BluedipDeal extends StatefulWidget {
  const BluedipDeal({Key? key}) : super(key: key);

  @override
  State<BluedipDeal> createState() => _BluedipDealState();
}

class _BluedipDealState extends State<BluedipDeal>
    with TickerProviderStateMixin {
  TabController? tabController;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      activeIndex = tabController!.index;
    });

    Future.delayed(Duration(seconds: 0)).then((_) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          builder: (builder) {
            return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r))),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const Wrap(
                    children: [BottomSheetCreatDeal()],
                  ),
                ));
          });
    });
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
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
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 14),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0017191a),
                            offset: Offset(
                              0.0,
                              24.0,
                            ),
                            blurRadius: 21.0,
                            spreadRadius: 0.0,
                          )
                        ],
                      ),
                      child: Text("Create Deal",
                          style: TextStyle(
                              color: black_354356,
                              fontWeight: FontWeight.w700,
                              fontFamily: fontJosefinSansBold,
                              fontStyle: FontStyle.normal,
                              fontSize: 20.sp),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: [
              SizedBox(
                height: 20.h,
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
                  controller: tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Blue_5468ff),
                  onTap: (val) {
                    activeIndex = val;
                    setState(() {});
                  },
                  tabs: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: const Tab(
                        child: Text("One Time Deal"),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: const Text("Recurring Deal"),
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
              SizedBox(
                height: 20.h,
              ),
              Expanded(flex: 1, child: OneTimeDeal(tabIndex: activeIndex)
                  // TabBarView(
                  //   physics: ScrollPhysics(),
                  //   controller: tabController,
                  //   children: const [
                  //     OneTimeDeal(),
                  //     RecurringDeal(),
                  //   ],
                  // ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  // void selectCreatDeal(BuildContext context) {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       builder: (
  //           BuildContext context,
  //           ) {
  //         return Container(
  //             decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(12.r),
  //                     topRight: Radius.circular(12.r))),
  //             child: SingleChildScrollView(
  //               padding: EdgeInsets.only(
  //                   bottom: MediaQuery.of(context).viewInsets.bottom),
  //               child: Wrap(
  //                 children: [BottomSheetCreatDeal()],
  //               ),
  //             ));
  //       });
  // }
}
