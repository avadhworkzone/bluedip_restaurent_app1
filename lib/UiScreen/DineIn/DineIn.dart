import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/UiScreen/AddRestoDetailScreen/DetailPage1.dart';

import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/booking_order_count_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/bottom_view_model.dart';
import 'package:bluedip_restaurent/viewModel/dine_in_order_view_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Styles/my_icons.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/MaterialDesignIndicator.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/search_bar.dart';

import 'DineInAcceptedTab.dart';
import 'DineInIncomingTab.dart';
import 'DineInOngoingTab.dart';
import '../IncomingTab.dart';
import '../TakeaWay/PreparingTab.dart';
import '../TakeaWay/ReadyTab.dart';

class DineIn extends StatefulWidget {
  const DineIn({Key? key}) : super(key: key);

  @override
  State<DineIn> createState() => _DineInState();
}

class _DineInState extends State<DineIn> with TickerProviderStateMixin {
  TabController? tabController;
  // int activeIndex = 0;
  BottomViewModel bottomViewModel = Get.find();
  DineInOrderViewModel dineInOrderViewModel = Get.find();
  GetBookingOrderCountResModel? countRes;

  getOrderCount() async {
    await dineInOrderViewModel.bookingOrderCountViewModel();
  }

  @override
  void initState() {
    getOrderCount();
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    // tabController!.addListener(() {
    //   activeIndex = tabController!.index;
    // });
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
        body: GetBuilder<BottomViewModel>(
          builder: (controller) {
            return NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 14),
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
                          child: Text("Dine-in",
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
              body: GetBuilder<DineInOrderViewModel>(
                builder: (controller) {
                  if (controller.bookingOrderCountApiResponse.status ==
                      Status.LOADING) {
                    return const CircularIndicator();
                  }
                  if (controller.bookingOrderCountApiResponse.status ==
                      Status.ERROR) {
                    return const ServerError();
                  }
                  if (controller.bookingOrderCountApiResponse.status ==
                      Status.COMPLETE) {
                    countRes = controller.bookingOrderCountApiResponse.data;
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                          // margin: EdgeInsets.only(left: 32.w,right: 0.w),
                          // height: 35.h,
                          color: bg_f3f5f9,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      bottomViewModel.setDineInIndex(index: 0);
                                    });
                                  },
                                  child: Container(
                                    // margin: EdgeInsets.symmetric(
                                    //     horizontal: 15.w, vertical: 15.w),
                                    decoration: BoxDecoration(
                                        color: bottomViewModel.dineInIndex == 0
                                            ? Blue_5468ff
                                            : bg_f3f5f9,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.w),
                                      child: countRes == null ||
                                              countRes!.data == null
                                          ? Text('Incoming',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: bottomViewModel
                                                              .dineInIndex ==
                                                          0
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontFamily:
                                                      fontMavenProMedium))
                                          : Text(
                                              'Incoming (${countRes!.data!.incoming ?? 0})',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: bottomViewModel
                                                              .dineInIndex ==
                                                          0
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontFamily:
                                                      fontMavenProMedium),
                                            ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // setState(()  {
                                    bottomViewModel.setDineInIndex(index: 1);
                                    // });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: bottomViewModel.dineInIndex == 1
                                            ? Blue_5468ff
                                            : bg_f3f5f9,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.w),
                                      child: countRes == null ||
                                              countRes!.data == null
                                          ? Text('Accepted',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: bottomViewModel
                                                              .dineInIndex ==
                                                          1
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontFamily:
                                                      fontMavenProMedium))
                                          : Text(
                                              'Accepted (${countRes!.data!.accept})',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: bottomViewModel
                                                              .dineInIndex ==
                                                          1
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontFamily:
                                                      fontMavenProMedium)),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      bottomViewModel.setDineInIndex(index: 2);
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: bottomViewModel.dineInIndex == 2
                                            ? Blue_5468ff
                                            : bg_f3f5f9,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.w),
                                      child: countRes == null ||
                                              countRes!.data == null
                                          ? Text('Ongoing',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: bottomViewModel
                                                              .dineInIndex ==
                                                          2
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontFamily:
                                                      fontMavenProMedium))
                                          : Text(
                                              'Ongoing (${countRes!.data!.ongoing})',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: bottomViewModel
                                                              .dineInIndex ==
                                                          2
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontFamily:
                                                      fontMavenProMedium)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          // TabBar(
                          //   padding: EdgeInsets.only(left: 16.w, right: 16.w),
                          //   labelPadding: EdgeInsets.zero,
                          //   isScrollable: true,
                          //   labelColor: Colors.white,
                          //   unselectedLabelColor: grey_969da8,
                          //   controller: tabController,
                          //   indicatorSize: TabBarIndicatorSize.label,
                          //   indicator: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(6),
                          //       color: Blue_5468ff),
                          //   tabs: [
                          //     Padding(
                          //       padding: EdgeInsets.symmetric(horizontal: 14.w),
                          //       child: const Tab(
                          //         child: Text("Incoming (3)"),
                          //       ),
                          //     ),
                          //     Tab(
                          //       child: Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 14.w),
                          //         child: const Text("Accepted (1)"),
                          //       ),
                          //     ),
                          //     Tab(
                          //       child: Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 14.w),
                          //         child: const Text("Ongoing (2)"),
                          //       ),
                          //     ),
                          //   ],
                          //   // indicatorWeight: 10,
                          //   labelStyle: TextStyle(
                          //       fontSize: 15.sp,
                          //       fontFamily: fontMavenProMedium), //For Selected tab
                          //   unselectedLabelStyle: TextStyle(
                          //       fontSize: 15.sp,
                          //       fontFamily: fontMavenProMedium), //For Un-selected Tabs
                          // ),
                          ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Expanded(
                        flex: 1,
                        child: bottomViewModel.dineInIndex == 0
                            ? const DineInIncomingTab()
                            : bottomViewModel.dineInIndex == 1
                                ? const DineInAcceptedTab()
                                : const DineInOngoingTab(),
                        // TabBarView(
                        //   physics: ScrollPhysics(),
                        //   controller: tabController,
                        //   children: const [
                        //     DineInIncomingTab(),
                        //     DineInAcceptedTab(),
                        //     DineInOngoingTab(),
                        //   ],
                        // ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
