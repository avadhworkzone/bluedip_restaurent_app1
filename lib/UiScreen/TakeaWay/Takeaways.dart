import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_late_order_list.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_order_count_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/bottom_view_model.dart';
import 'package:bluedip_restaurent/viewModel/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Styles/my_icons.dart';
import 'OrderList.dart';
import 'PickupTab.dart';
import 'PreparingTab.dart';
import 'ReadyTab.dart';
import 'package:timeago/timeago.dart' as timeago;

class Takeaways extends StatefulWidget {
  const Takeaways({Key? key}) : super(key: key);

  @override
  State<Takeaways> createState() => _TakeawaysState();
}

class _TakeawaysState extends State<Takeaways> with TickerProviderStateMixin {
  TabController? tabController;
  BottomViewModel bottomViewModel = Get.find();
  OrderViewModel orderViewModel = Get.find();
  GetOrderCountResModel? countRes;
  GetLateOrderListResModel? lateOrderRes;

  @override
  void initState() {
    super.initState();
    getOrderCount();
    getLateOrderApiCall();
    tabController = TabController(length: 3, vsync: this);
    tabController!.addListener(() {
      bottomViewModel.tabActiveIndex = tabController!.index;
    });
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  getOrderCount() async {
    await orderViewModel.getOrderCountViewModel().then((value) {
      if (orderViewModel.getOrderCountApiResponse.status == Status.COMPLETE) {
        countRes = orderViewModel.getOrderCountApiResponse.data;
        Future.delayed(const Duration(seconds: 0)).then((_) {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              isDismissible: true,
              builder: (builder) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        icon_triangle_img,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text(
                            "You have ${countRes!.data!.viewedOrderList} new order",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: fontMavenProProSemiBold,
                                fontStyle: FontStyle.normal,
                                fontSize: 15.sp),
                            textAlign: TextAlign.center),
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   margin: EdgeInsets.only(top: 25),
                      //   decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //           begin: Alignment(0, 0),
                      //           end: Alignment(0.9428571482093964, 0.9999999869113068),
                      //           colors: [
                      //             const Color(0xff73a5ff),
                      //             const Color(0xff1e6af2)
                      //           ]),
                      //       borderRadius: BorderRadius.only(
                      //           topLeft: Radius.circular(25.r),
                      //           topRight: Radius.circular(25.r))),
                      //   child: ListView(
                      //     controller: scrollController,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           SizedBox(
                      //             height: 40.h,
                      //           ),
                      //           Text("You have 1 new order",
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontWeight: FontWeight.w600,
                      //                   fontFamily: fontMavenProProSemiBold,
                      //                   fontStyle: FontStyle.normal,
                      //                   fontSize: 15.sp),
                      //               textAlign: TextAlign.center),
                      //           SizedBox(
                      //             height: 30.h,
                      //           ),
                      //
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // CustomPaint(
                      //   painter: TrianglePainter(
                      //     strokeColor: Color(0xff73a5ff),
                      //
                      //     strokeWidth: 40,
                      //     paintingStyle: PaintingStyle.fill,
                      //   ),
                      //   child: Container(
                      //       width: 60.w,
                      //       height: 60.h,
                      //       // decoration: BoxDecoration(
                      //       //   shape: BoxShape.circle,
                      //       //   gradient: LinearGradient(
                      //       //       begin: Alignment.topCenter,
                      //       //       end: Alignment.bottomCenter,
                      //       //       colors: [
                      //       //         const Color(0xff73a5ff),
                      //       //         const Color(0xff1e6af2)
                      //       //       ]),
                      //       // ),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: SlideTransition(
                      //             position: _offsetAnimation,
                      //             child: SvgPicture.asset(icon_up_arrow)),
                      //       )),
                      // ),
                    ],
                  ),
                );
              });
        });
      }
    });
  }

  getLateOrderApiCall() async {
    await orderViewModel.getLateOrderViewModel().then((value) {
      if (orderViewModel.getLateOrderApiResponse.status == Status.COMPLETE) {
        lateOrderRes = orderViewModel.getLateOrderApiResponse.data;
      }
    });
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
      child: GetBuilder<OrderViewModel>(
        builder: (controller) {
          if (controller.getOrderCountApiResponse.status == Status.LOADING ||
              controller.getLateOrderApiResponse.status == Status.LOADING) {
            return CircularIndicator();
          }
          if (controller.getOrderCountApiResponse.status == Status.ERROR) {
            return const ServerError();
          }
          if (controller.getOrderCountApiResponse.status == Status.COMPLETE) {
            countRes = controller.getOrderCountApiResponse.data;
          }
          return Scaffold(
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
                              child: Row(
                                children: [
                                  Text("Takeaway",
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontJosefinSansBold,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20.sp),
                                      textAlign: TextAlign.left),
                                  // InkWell(
                                  //     onTap: () async {
                                  //       await PreferenceManagerUtils
                                  //           .clearPreference();
                                  //       Get.offAll(LoginScreen());
                                  //     },
                                  //     child: Text('logout',
                                  //         style: TextStyle(
                                  //             color: black_354356,
                                  //             fontFamily: fontJosefinSansBold,
                                  //             fontStyle: FontStyle.normal,
                                  //             fontSize: 20.sp)))
                                ],
                              ),
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
                      /*TabBar Code is here*/
                      Container(
                          // margin: EdgeInsets.only(left: 32.w,right: 0.w),
                          // height: 35.h,
                          color: bg_f3f5f9,
                          width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.only(left: 20.w, right: 20.w),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        bottomViewModel.setTakeawayIndex(
                                            index: 0);
                                      });
                                    },
                                    child: Container(
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 15.w, vertical: 15.w),
                                      decoration: BoxDecoration(
                                          color:
                                              bottomViewModel.takeawayIndex == 0
                                                  ? Blue_5468ff
                                                  : bg_f3f5f9,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 10.w),
                                        child: Text(
                                          'Preparing (${countRes!.data!.preparing})',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: bottomViewModel
                                                          .takeawayIndex ==
                                                      0
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontFamily: fontMavenProMedium),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() async {
                                        bottomViewModel.setTakeawayIndex(
                                            index: 1);
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              bottomViewModel.takeawayIndex == 1
                                                  ? Blue_5468ff
                                                  : bg_f3f5f9,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 10.w),
                                        child: Text(
                                            'Ready (${countRes!.data!.ready})',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: bottomViewModel
                                                            .takeawayIndex ==
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
                                        bottomViewModel.setTakeawayIndex(
                                            index: 2);
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              bottomViewModel.takeawayIndex == 2
                                                  ? Blue_5468ff
                                                  : bg_f3f5f9,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 10.w),
                                        child: Text(
                                            'Picked up (${countRes!.data!.pickedUp})',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: bottomViewModel
                                                            .takeawayIndex ==
                                                        2
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontFamily:
                                                    fontMavenProMedium)),
                                      ),
                                    ),
                                  ),
                                ],
                              ))),
                      SizedBox(
                        height: 16.h,
                      ),
                      Expanded(
                        flex: 1,
                        child: bottomViewModel.takeawayIndex == 0
                            ? const PreparingTab()
                            : bottomViewModel.takeawayIndex == 1
                                ? const ReadyTab()
                                : const PickupTab(),
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: lateOrderRes!.status == false
                ? SizedBox()
                : lateOrderRes!.data!.isEmpty
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          selectOrderLate(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.w, vertical: 10.h),
                          margin: EdgeInsets.only(bottom: 20.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              boxShadow: const [
                                BoxShadow(
                                  color: grey_969da8,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                              color: red_d9534f),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                icon_notification,
                                color: Colors.white,
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text("${lateOrderRes!.data!.length} Orders late",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: fontMavenProProSemiBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.center)
                            ],
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }

  void selectOrderLate(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
              height: Get.width / 1,
              decoration: BoxDecoration(
                  color: red_d9534f,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r))),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(icon_warning),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                              "${lateOrderRes!.data!.length} Orders Late",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontJosefinSansBold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.sp,
                                  height: 1.5),
                              textAlign: TextAlign.left),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, false);
                          },
                          child: SvgPicture.asset(
                            icon_cancel,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      primary: false,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w, vertical: 20.h),
                                      itemCount: lateOrderRes!.data!.length,
                                      itemBuilder: (context, i) {
                                        final data = lateOrderRes!.data![i];
                                        final curentDate = DateTime.parse(
                                          data.orderAcceptedTime.toString(),
                                        );
                                        return GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           const OrderDetailPreparingFinal(),
                                            //     ));
                                          },
                                          child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 16.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                color: Colors.white,
                                              ),
                                              padding: EdgeInsets.all(14.r),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      // Order ID #123113
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              'Order ID #${data.orderId}',
                                                              style: TextStyle(
                                                                  color:
                                                                      black_354356,
                                                                  fontFamily:
                                                                      fontMavenProProSemiBold,
                                                                  fontSize:
                                                                      15.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left),
                                                          SizedBox(
                                                            height: 6.h,
                                                          ),
                                                          RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                TextSpan(
                                                                    style: TextStyle(
                                                                        color:
                                                                            light_black_5f6d7b,
                                                                        fontFamily:
                                                                            fontMavenProRegular,
                                                                        fontSize: 14
                                                                            .sp),
                                                                    text:
                                                                        "Pickup at: "),
                                                                TextSpan(
                                                                    style: TextStyle(
                                                                        color:
                                                                            Blue_5468ff,
                                                                        fontFamily:
                                                                            fontMavenProMedium,
                                                                        fontSize: 14
                                                                            .sp),
                                                                    text: data
                                                                        .time)
                                                              ])),
                                                        ],
                                                      ),

                                                      Text(
                                                          "Placed \n${timeago.format(
                                                            curentDate,
                                                            locale: "en_short",
                                                          )} ago",
                                                          style: TextStyle(
                                                              color: red_d9534f,
                                                              fontFamily:
                                                                  fontMavenProRegular,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 14.sp),
                                                          textAlign:
                                                              TextAlign.right)
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 14.h,
                                                  ),
                                                  ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        data.cartData!.length,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (context, sIndex) {
                                                      return Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xffedf0ff),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.r),
                                                                ),
                                                                child: // x1
                                                                    Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          10.w,
                                                                      vertical:
                                                                          4.h),
                                                                  child: Text(
                                                                      "x${data.cartData![sIndex].quantity ?? 0}",
                                                                      style: TextStyle(
                                                                          color:
                                                                              black_354356,
                                                                          fontFamily:
                                                                              fontMavenProMedium,
                                                                          fontStyle: FontStyle
                                                                              .normal,
                                                                          fontSize: 14
                                                                              .sp),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 8.w,
                                                              ),
                                                              // Paneer Masala
                                                              Expanded(
                                                                flex: 1,
                                                                child: Text(
                                                                    data.cartData![sIndex].menuItemName!.name ??
                                                                        'NA',
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
                                                                        fontSize: 14
                                                                            .sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                              ),
                                                              // 250
                                                              Row(
                                                                children: [
                                                                  Image.asset(
                                                                    icon_rupee_slim,
                                                                    width: 10.w,
                                                                    height:
                                                                        10.h,
                                                                  ),
                                                                  Text(
                                                                      "${data.cartData![sIndex].discountPrice ?? 'NA'}",
                                                                      style: TextStyle(
                                                                          color:
                                                                              black_354356,
                                                                          fontFamily:
                                                                              fontMavenProProSemiBold,
                                                                          fontSize: 14
                                                                              .sp),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 13,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  )
                                                ],
                                              )),
                                        );
                                      }),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OrderListScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
