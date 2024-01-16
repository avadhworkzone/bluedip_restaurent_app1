import 'dart:async';

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/UiScreen/TakeaWay/ReadyTab.dart';
import 'package:bluedip_restaurent/UiScreen/TakeaWay/order_preparing_timer_widget.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/add_more_time_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/common_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_order_list_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/bottom_view_model.dart';
import 'package:bluedip_restaurent/viewModel/order_view_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_icons.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/search_bar.dart';

import '../../utils/shared_preference_utils.dart';
import '../../utils/utility.dart';
import 'OrderDetail.dart';
import '../OrderDetailPreparing.dart';
import '../bottomsheets/BottomSheetMoreTime.dart';
import 'data_empty_view.dart';

class PreparingTab extends StatefulWidget {
  const PreparingTab({Key? key}) : super(key: key);

  @override
  State<PreparingTab> createState() => _PreparingTabState();
}

class _PreparingTabState extends State<PreparingTab> {
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 60;
  BottomViewModel bottomViewModel = Get.find();

  int currentSeconds = 0;
  List<OfferModel> offerList = [
    OfferModel("5 mint"),
    OfferModel("10 mint"),
    OfferModel("15 mint"),
  ];
  int mySelectConsultation = -1;
  Map orderPreTime = {};
  @override
  void initState() {
    getPreparingData();

    super.initState();
  }

  OrderViewModel orderViewModel = Get.find();
  GetOrderListResponseModel? response;

  getPreparingData() async {
    await orderViewModel
        .getOrderListViewModel(orderStatus: "PREPARING")
        .then((value) {
      if (orderViewModel.orderListApiResponse.status == Status.COMPLETE) {
        response = orderViewModel.orderListApiResponse.data;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Utility.orderRTime===${Utility.orderRTime}');

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));

    return Scaffold(
      backgroundColor: bg_f3f5f9,
      body: GetBuilder<OrderViewModel>(
        builder: (controller) {
          if (orderViewModel.orderListApiResponse.status == Status.LOADING) {
            return const CircularIndicator();
          }
          if (orderViewModel.orderListApiResponse.status == Status.ERROR) {
            return const ServerError();
          }
          if (orderViewModel.orderListApiResponse.status == Status.COMPLETE) {
            response = orderViewModel.orderListApiResponse.data;
          }
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*search bar*/
                          SearchBarWidget(
                            hintText: strSearch,
                            onSubmitted: (String) {},
                            onChanged: (val) async {
                              await orderViewModel.getOrderListViewModel(
                                  orderStatus: "PREPARING", keyword: val);
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          response!.data!.isEmpty
                              ? const EmptyView()
                              : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: response!.data!.length,
                                  itemBuilder: (context, i) {
                                    print(
                                        'Utility.orderRTime===${Utility.orderRTime[response!.data![i].orderId]}');
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => OrderDetail(
                                                orderId: response!
                                                    .data![i].orderId
                                                    .toString(),
                                              ),
                                            ));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 16.h),
                                        child: Container(
                                          decoration: boxDecoration,
                                          padding: EdgeInsets.all(14.r),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  // Order ID #123113
                                                  Text(
                                                      "Offer ID #${response!.data![i].orderId}",
                                                      style: TextStyle(
                                                          color: black_354356,
                                                          fontFamily:
                                                              fontMavenProProSemiBold,
                                                          fontSize: 15.sp),
                                                      textAlign:
                                                          TextAlign.left),
                                                  // SizedBox(width: 8.w,),
                                                  // Container(
                                                  //   decoration: BoxDecoration(
                                                  //     color: Color(0xff00d9cd),
                                                  //     borderRadius:BorderRadius.circular(4.r),
                                                  //   ),
                                                  //   child: // New
                                                  //   Padding(
                                                  //     padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                                  //     child: Text(
                                                  //         "New",
                                                  //         style:  TextStyle(
                                                  //             color:  Colors.white,
                                                  //             fontFamily: fontMavenProMedium,
                                                  //             fontSize: 12.sp
                                                  //         ),
                                                  //         textAlign: TextAlign.right
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    style: TextStyle(
                                                        color:
                                                            light_black_5f6d7b,
                                                        fontFamily:
                                                            fontMavenProRegular,
                                                        fontSize: 14.sp),
                                                    text: "Pickup at: "),
                                                TextSpan(
                                                    style: TextStyle(
                                                        color: Blue_5468ff,
                                                        fontFamily:
                                                            fontMavenProMedium,
                                                        fontSize: 14.sp),
                                                    text:
                                                        "${response!.data![i].time}")
                                              ])),

                                              SizedBox(
                                                height: 14.h,
                                              ),
                                              const DottedLine(
                                                direction: Axis.horizontal,
                                                lineLength: double.infinity,
                                                lineThickness: 1.0,
                                                dashLength: 4.0,
                                                dashColor: divider_d4dce7,
                                                dashRadius: 0.0,
                                                dashGapLength: 4.0,
                                                dashGapColor:
                                                    Colors.transparent,
                                                dashGapRadius: 0.0,
                                              ),

                                              SizedBox(
                                                height: 14.h,
                                              ),

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // John doe
                                                        Text(
                                                            "${response!.data![i].userFullName ?? ""}",
                                                            style: TextStyle(
                                                                color:
                                                                    black_354356,
                                                                fontFamily:
                                                                    fontMavenProProSemiBold,
                                                                fontSize:
                                                                    15.sp),
                                                            textAlign:
                                                                TextAlign.left),
                                                        SizedBox(
                                                          height: 8.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          3.h,
                                                                      horizontal:
                                                                          6.w),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  color: const Color(
                                                                      0xffedf0ff)),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      icon_room_buffet_dinner),
                                                                  SizedBox(
                                                                    width: 4.w,
                                                                  ),
                                                                  Text(
                                                                      response!
                                                                              .data![
                                                                                  i]
                                                                              .dishes ??
                                                                          "",
                                                                      style: TextStyle(
                                                                          color:
                                                                              black_354356,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontFamily:
                                                                              fontMavenProProSemiBold,
                                                                          fontSize: 14
                                                                              .sp),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right)
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 6.w,
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          3.h,
                                                                      horizontal:
                                                                          6.w),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  color: const Color(
                                                                      0xffedf0ff)),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      icon_champayne_glass),
                                                                  SizedBox(
                                                                    width: 4.w,
                                                                  ),
                                                                  Text(
                                                                      response!
                                                                              .data![
                                                                                  i]
                                                                              .coldDrinks ??
                                                                          "",
                                                                      style: TextStyle(
                                                                          color:
                                                                              black_354356,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontFamily:
                                                                              fontMavenProProSemiBold,
                                                                          fontSize: 14
                                                                              .sp),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right)
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),

                                                  // Paid
                                                  response!
                                                              .data![i]
                                                              .paymentData!
                                                              .paymentStatus ==
                                                          null
                                                      ? SizedBox()
                                                      : Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      6.w,
                                                                  vertical:
                                                                      2.h),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.r),
                                                              color: const Color(
                                                                  0x215cb85c)),
                                                          child: Text(
                                                              response!
                                                                      .data![i]
                                                                      .paymentData!
                                                                      .paymentStatus ??
                                                                  "",
                                                              style: TextStyle(
                                                                  color:
                                                                      green_5cb85c,
                                                                  fontFamily:
                                                                      fontMavenProMedium,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize:
                                                                      14.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .right),
                                                        ),

                                                  SizedBox(
                                                    width: 6.w,
                                                  ),
                                                  response!
                                                              .data![i]
                                                              .paymentData!
                                                              .netPayable ==
                                                          null
                                                      ? SizedBox()
                                                      : Row(
                                                          children: [
                                                            Image.asset(
                                                              icon_rupee_slim,
                                                              width: 10.w,
                                                              height: 10.h,
                                                            ),
                                                            Text(
                                                                response!
                                                                    .data![i]
                                                                    .paymentData!
                                                                    .netPayable
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color:
                                                                        black_354356,
                                                                    fontFamily:
                                                                        fontMavenProProSemiBold,
                                                                    fontSize:
                                                                        14.sp),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left),
                                                          ],
                                                        )
                                                ],
                                              ),

                                              // SizedBox(height: 20.h,),
                                              //
                                              // Row(
                                              //   children: [
                                              //     Expanded(
                                              //       flex: 1,
                                              //       child: Text("Order Preparation \nTime",
                                              //           style: TextStyle(
                                              //               color: light_black_5f6d7b,
                                              //               fontFamily: fontMavenProMedium,
                                              //               fontStyle: FontStyle.normal,
                                              //               fontSize: 14.sp),
                                              //           textAlign: TextAlign.left),
                                              //     ),
                                              //     Container(
                                              //       decoration: BoxDecoration(
                                              //           borderRadius: BorderRadius.circular(10.r),
                                              //           border: Border.all(width: 1, color: grey_d9dde3)),
                                              //       child: Row(
                                              //         children: [
                                              //           GestureDetector(
                                              //             onTap: minus,
                                              //             child: Container(
                                              //                 width: 44.w,
                                              //                 height: 40.h,
                                              //                 color: Colors.transparent,
                                              //                 child: Padding(
                                              //                   padding: const EdgeInsets.all(8.0),
                                              //                   child: SvgPicture.asset(icon_remove_minus),
                                              //                 )),
                                              //           ),
                                              //
                                              //           Container(
                                              //             height: 39,
                                              //             width: 1,
                                              //             color: divider_d4dce7,
                                              //           ),
                                              //           // 10min
                                              //           Container(
                                              //             width: 60.w,
                                              //             child: Text("$_n"+" min",
                                              //                 style: TextStyle(
                                              //                     color: black_354356,
                                              //                     fontWeight: FontWeight.w500,
                                              //                     fontFamily: fontMavenProMedium,
                                              //                     fontStyle: FontStyle.normal,
                                              //                     fontSize: 15.sp),
                                              //                 textAlign: TextAlign.center),
                                              //           ),
                                              //           Container(
                                              //             height: 39,
                                              //             width: 1,
                                              //             color: divider_d4dce7,
                                              //           ),
                                              //           GestureDetector(
                                              //             onTap: add,
                                              //             child: Container(
                                              //                 width: 44.w,
                                              //                 height: 40.h,
                                              //                 color: Colors.transparent,
                                              //                 child: Padding(
                                              //                   padding: const EdgeInsets.all(8.0),
                                              //                   child: SvgPicture.asset(icon_add_plus),
                                              //                 )),
                                              //           ),
                                              //         ],
                                              //       ),
                                              //     )
                                              //   ],
                                              // ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              /*bottom two buttons here*/
                                              // response!.data![i]
                                              //                 .isNeedMoreTime ==
                                              //             1 &&
                                              Row(
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          if (response!.data![i]
                                                                  .isNeedMoreTime ==
                                                              0) {
                                                            orderPreTime
                                                                .addAll({
                                                              response!.data![i]
                                                                      .orderId
                                                                      .toString():
                                                                  response!
                                                                      .data![i]
                                                                      .orderPreparationTime
                                                            });
                                                            selectMoreTime(
                                                                context:
                                                                    context,
                                                                orderId: response!
                                                                    .data![i]
                                                                    .orderId
                                                                    .toString());
                                                          } else {
                                                            const SizedBox();
                                                          }

                                                          print(
                                                              'orderPreTime map add==${orderPreTime}');
                                                          // await PreferenceManagerUtils
                                                          //     .setOrderPreparingTime(
                                                          //         pKey: response!
                                                          //             .data![
                                                          //                 i]
                                                          //             .orderId
                                                          //             .toString(),
                                                          //         pValue: response!
                                                          //             .data![
                                                          //                 i]
                                                          //             .orderPreparationTime);
                                                          // print(
                                                          //     '==nnnnnnnnn==${PreferenceManagerUtils.getOrderPreparingTime(response!.data![i].orderId.toString())}');
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      4.h),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color:
                                                                      grey_d9dde3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.r),
                                                              color: response!
                                                                          .data![
                                                                              i]
                                                                          .isNeedMoreTime ==
                                                                      0
                                                                  ? Colors
                                                                      .transparent
                                                                  : Colors.grey
                                                                      .withOpacity(
                                                                          0.1)),
                                                          child: // Frame 34242
                                                              Text(
                                                                  "Need \nmore time",
                                                                  style: TextStyle(
                                                                      color: response!.data![i].isNeedMoreTime ==
                                                                              0
                                                                          ? orange_d6483d
                                                                          : Color(0xffd6483d).withOpacity(
                                                                              0.5),
                                                                      fontFamily:
                                                                          fontMavenProMedium,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize: 15
                                                                          .sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center),
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: 16.w,
                                                  ),
                                                  OrderPreparingTimeButton(
                                                    res: response!.data![i],
                                                    onTap: () async {
                                                      await orderViewModel
                                                          .orderReadyPickViewModel(
                                                              orderId: response!
                                                                  .data![i]
                                                                  .orderId
                                                                  .toString(),
                                                              orderStatus:
                                                                  "READY");
                                                      if (orderViewModel
                                                              .orderReadyPickUpApiResponse
                                                              .status ==
                                                          Status.ERROR) {
                                                        const ServerError();
                                                      }
                                                      if (orderViewModel
                                                              .orderReadyPickUpApiResponse
                                                              .status ==
                                                          Status.COMPLETE) {
                                                        CommonResponseModel
                                                            orderReadyRes =
                                                            orderViewModel
                                                                .orderReadyPickUpApiResponse
                                                                .data;
                                                        if (orderReadyRes
                                                                .status ==
                                                            true) {
                                                          bottomViewModel
                                                              .setTakeawayIndex(
                                                                  index: 1);
                                                          await orderViewModel
                                                              .getOrderCountViewModel();
                                                          setState(() {});
                                                        } else {
                                                          snackBar(
                                                              title:
                                                                  orderReadyRes
                                                                      .message);
                                                        }
                                                      }
                                                    },
                                                    onCancelTap: () async {
                                                      await orderViewModel
                                                          .orderReadyPickViewModel(
                                                              orderId: response!
                                                                  .data![i]
                                                                  .orderId
                                                                  .toString(),
                                                              orderStatus:
                                                                  "CANCEL");
                                                      if (orderViewModel
                                                              .orderReadyPickUpApiResponse
                                                              .status ==
                                                          Status.ERROR) {
                                                        const ServerError();
                                                      }
                                                      if (orderViewModel
                                                              .orderReadyPickUpApiResponse
                                                              .status ==
                                                          Status.COMPLETE) {
                                                        CommonResponseModel
                                                            orderReadyRes =
                                                            orderViewModel
                                                                .orderReadyPickUpApiResponse
                                                                .data;
                                                        if (orderReadyRes
                                                                .status ==
                                                            true) {
                                                          await orderViewModel
                                                              .getOrderListViewModel(
                                                                  orderStatus:
                                                                      "PREPARING");
                                                          await orderViewModel
                                                              .getOrderCountViewModel();
                                                          setState(() {});
                                                        } else {
                                                          snackBar(
                                                              title:
                                                                  orderReadyRes
                                                                      .message);
                                                        }
                                                      }
                                                    },
                                                  )

                                                  // Expanded(
                                                  //     flex: 2,
                                                  //     child: Container(
                                                  //       padding: EdgeInsets.all(14.r),
                                                  //       decoration: BoxDecoration(
                                                  //
                                                  //           borderRadius: BorderRadius.circular(10.r),
                                                  //           color: Blue_5468ff
                                                  //       ),
                                                  //       child: // Frame 34242
                                                  //       Text(
                                                  //           "ORDER READY "+ "("+timerText+")",
                                                  //           style:  TextStyle(
                                                  //               color:  Colors.white,
                                                  //               fontFamily: fontMavenProMedium,
                                                  //               fontStyle:  FontStyle.normal,
                                                  //               fontSize: 15.sp
                                                  //           ),
                                                  //           textAlign: TextAlign.center
                                                  //       ),
                                                  //     )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              GetBuilder<OrderViewModel>(
                builder: (controller) {
                  if (orderViewModel.orderReadyPickUpApiResponse.status ==
                      Status.LOADING) {
                    return const CircularIndicator();
                  }
                  return const SizedBox();
                },
              )
            ],
          );
        },
      ),
    );
  }

  void selectMoreTime(
      {required BuildContext context, required String orderId}) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r))),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Wrap(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(16.r),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      // Daily Opportunities
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Need More Time",
                                              style: TextStyle(
                                                  color: black_354356,
                                                  fontFamily:
                                                      fontJosefinSansBold,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 18.sp,
                                                  height: 1.5),
                                              textAlign: TextAlign.center),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context, false);
                                            },
                                            child:
                                                SvgPicture.asset(icon_cancel),
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
                                      Text(
                                          "How much more time do you need to \nprepare food?",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily:
                                                  fontMavenProProSemiBold,
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
                                            padding: const EdgeInsets.only(
                                              top: 14,
                                            ),
                                            itemCount: offerList.length,
                                            itemBuilder: (context, i) =>
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      mySelectConsultation = i;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 86.w,
                                                    margin: EdgeInsets.only(
                                                        right: 16.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.r),
                                                      border: Border.all(
                                                          width: 1,
                                                          color:
                                                              mySelectConsultation ==
                                                                      i
                                                                  ? Blue_5468ff
                                                                  : grey_d9dde3),
                                                      color:
                                                          mySelectConsultation ==
                                                                  i
                                                              ? Blue_5468ff
                                                              : Colors.white,
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 6.h),
                                                    child: // 5 mint
                                                        Text(offerList[i].title,
                                                            style: TextStyle(
                                                                color: mySelectConsultation ==
                                                                        i
                                                                    ? Colors
                                                                        .white
                                                                    : Blue_5468ff,
                                                                fontFamily:
                                                                    fontMavenProMedium,
                                                                fontSize:
                                                                    15.sp),
                                                            textAlign: TextAlign
                                                                .center),
                                                  ),
                                                )),
                                      ),

                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      GetBuilder<OrderViewModel>(
                                        builder: (controller) {
                                          if (controller.addMoreTimeApiResponse
                                                  .status ==
                                              Status.LOADING) {
                                            return const CircularIndicator();
                                          }
                                          return InkWell(
                                            onTap: () async {
                                              await orderViewModel
                                                  .addMoreTimeViewModel(
                                                      orderId: orderId,
                                                      moreTime: mySelectConsultation ==
                                                              0
                                                          ? 5
                                                          : mySelectConsultation ==
                                                                  1
                                                              ? 10
                                                              : 15,
                                                      orderPreparationTime: mySelectConsultation ==
                                                              0
                                                          ? 5 +
                                                              Utility.orderRTime[
                                                                  orderId
                                                                      .toString()]
                                                          : mySelectConsultation ==
                                                                  1
                                                              ? 10 +
                                                                  Utility.orderRTime[
                                                                      orderId
                                                                          .toString()]
                                                              : 15 +
                                                                  Utility.orderRTime[
                                                                      orderId
                                                                          .toString()],
                                                      totalPreparationTime: mySelectConsultation ==
                                                              0
                                                          ? 5 +
                                                              orderPreTime[orderId
                                                                  .toString()]
                                                          // int.parse(
                                                          //     Utility.orderPTime[int.parse(
                                                          //         orderId.toString())])
                                                          : mySelectConsultation ==
                                                                  1
                                                              ? 10 +
                                                                  orderPreTime[
                                                                      orderId
                                                                          .toString()]
                                                              : 15 +
                                                                  orderPreTime[
                                                                      orderId
                                                                          .toString()]);
                                              if (controller
                                                      .addMoreTimeApiResponse
                                                      .status ==
                                                  Status.ERROR) {
                                                snackBar(title: 'Server Error');
                                              }
                                              if (controller
                                                      .addMoreTimeApiResponse
                                                      .status ==
                                                  Status.COMPLETE) {
                                                AddMoreTimeResModel
                                                    moreTimeRes = controller
                                                        .addMoreTimeApiResponse
                                                        .data;
                                                if (moreTimeRes.status ==
                                                    true) {
                                                  await PreferenceManagerUtils
                                                      .setOrderTimer(
                                                          key: orderId,
                                                          value: PreferenceManagerUtils
                                                                  .getOrderTimer(
                                                                      orderId) +
                                                              (mySelectConsultation ==
                                                                      0
                                                                  ? 5 * 60
                                                                  : mySelectConsultation ==
                                                                          1
                                                                      ? 10 * 60
                                                                      : 15 *
                                                                          60));

                                                  await orderViewModel
                                                      .getOrderListViewModel(
                                                          orderStatus:
                                                              "PREPARING");
                                                  Get.back();
                                                } else {
                                                  snackBar(
                                                      title:
                                                          moreTimeRes.message);
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.all(14.r),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  color: Blue_5468ff),
                                              child: // Frame 34242
                                                  Text("SUBMIT",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              fontMavenProMedium,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 15.sp),
                                                      textAlign:
                                                          TextAlign.center),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ))
                            ])
                      ],
                    ),
                  ));
            },
          );
        });
  }
}
