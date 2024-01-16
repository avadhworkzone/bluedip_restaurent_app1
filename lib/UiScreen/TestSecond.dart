import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Styles/my_colors.dart';
import '../Widget/back_button.dart';
import '../Widget/toolbar_with_title.dart';
import 'IncomingTab.dart';
import 'TakeaWay/PreparingTab.dart';
import 'TakeaWay/ReadyTab.dart';

class TestSecond extends StatefulWidget {
  const TestSecond({Key? key}) : super(key: key);

  @override
  State<TestSecond> createState() => _TestSecondState();
}

class _TestSecondState extends State<TestSecond> with TickerProviderStateMixin {
  TabController? tabController;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController!.addListener(() {
      activeIndex = tabController!.index;
    });
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                              3.0,
                            ),
                            blurRadius: 21.0,
                            spreadRadius: 0.0,
                          )
                        ],
                      ),
                      child: Text("Takeaway",
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
                height: 40.h,
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
                  tabs: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: const Tab(
                        child: Text("Incoming(3)"),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: const Text("Preparing(1)"),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: const Text("Ready (2)"),
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
              Expanded(
                flex: 1,
                child: TabBarView(
                  physics: ScrollPhysics(),
                  controller: tabController,
                  children: [
                    IncomingTab(),
                    PreparingTab(),
                    ReadyTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
