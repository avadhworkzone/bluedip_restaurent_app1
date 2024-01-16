import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/UiScreen/TakeaWay/OrderDetail.dart';
import 'package:bluedip_restaurent/UiScreen/bottom_bar/LatestBottomNavigationScreen.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/common_res_model.dart';
import 'package:bluedip_restaurent/utils/shared_preference_utils.dart';
import 'package:bluedip_restaurent/viewModel/bottom_view_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_icons.dart';
import '../../modal/apiModel/response_model/get_order_list_res_model.dart';
import '../../modal/apis/api_response.dart';
import '../../viewModel/order_view_model.dart';
import 'order_accept_timer_widget.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final interval = const Duration(seconds: 1);
  String selectOffer = '';
  bool isTimeOver = false;
  bool isReasonLayout = false;
  final int timerMaxSeconds = 30;
  CommonResponseModel? orderAcceptRes;
  // DateTime? orderCreationTime;

  int currentSeconds = 0;

  GetOrderListResponseModel? responseList;
  OrderViewModel orderViewModel = Get.find();
  BottomViewModel bottomViewModel = Get.find();
  List orderList = [];

  @override
  void initState() {
    // startTimeout();
    apiCall();
    super.initState();
  }

  apiCall() async {
    await orderViewModel
        .getOrderListViewModel(orderStatus: "VIEW_ORDER_LIST")
        .then((value) {
      if (orderViewModel.orderListApiResponse.status == Status.COMPLETE) {
        responseList = orderViewModel.orderListApiResponse.data;
        responseList!.data!.forEach((element) {
          orderList.add({
            "orderId": element.orderId,
            "orderPreparationTime": element.orderPreparationTime == null
                ? 0
                : int.parse(element.orderPreparationTime.toString())
          });
        });
      }
    });
  }

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
        body: GetBuilder<OrderViewModel>(
          builder: (controller) {
            if (controller.orderListApiResponse.status == Status.LOADING) {
              return const Center(child: CircularIndicator());
            }
            if (controller.orderListApiResponse.status == Status.ERROR) {
              return const Text('No data found!');
            }

            if (controller.orderListApiResponse.status == Status.COMPLETE) {
              responseList = controller.orderListApiResponse.data;
            }
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ToolbarWithTitleCancel("Order Details"),
                    Container(
                      color: Colors.white,
                      padding:
                          EdgeInsets.only(top: 16.h, bottom: 16.h, left: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                              onTap: () {
                                bottomViewModel.currentIndex = 1;
                                Get.off(
                                    () => const LatestBottomNavigationScreen());
                              },
                              child: Container(
                                  width: 40.w,
                                  height: 40.w,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: SvgPicture.asset(icon_cancel),
                                  ))),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Order Details",
                              style: TextStyle(
                                  fontFamily: fontJosefinSansBold,
                                  color: black_354356,
                                  fontSize: 20.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: responseList!.data!.isEmpty
                            ? NoDataFound()
                            : ListView.builder(
                                itemCount: responseList!.data!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => OrderDetail(
                                                orderId: responseList!
                                                    .data![index].orderId
                                                    .toString()));
                                          },
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
                                                        "Order ID #${responseList!.data![index].orderId ?? 'NA'}",
                                                        style: TextStyle(
                                                            color: black_354356,
                                                            fontFamily:
                                                                fontMavenProProSemiBold,
                                                            fontSize: 15.sp),
                                                        textAlign:
                                                            TextAlign.left),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff00d9cd),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.r),
                                                      ),
                                                      child: // New
                                                          Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10,
                                                                vertical: 4),
                                                        child: Text("New",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    fontMavenProMedium,
                                                                fontSize:
                                                                    12.sp),
                                                            textAlign: TextAlign
                                                                .right),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Text(
                                                    "${responseList!.data![index].userFullName ?? "NA"}",
                                                    style: TextStyle(
                                                        color: black_354356,
                                                        fontFamily:
                                                            fontMavenProMedium,
                                                        fontSize: 15.sp),
                                                    textAlign: TextAlign.left),

                                                SizedBox(
                                                  height: 2.h,
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
                                                          "${responseList!.data![index].time ?? "NA"}")
                                                ])),

                                                SizedBox(
                                                  height: 14.h,
                                                ),
                                                const Divider(
                                                  thickness: 1,
                                                  height: 1,
                                                  color: divider_d4dce7,
                                                ),

                                                SizedBox(
                                                  height: 14.h,
                                                ),

                                                // Customer Detail
                                                responseList!.data![index]
                                                        .cartData!.isEmpty
                                                    ? SizedBox()
                                                    : Text(
                                                        "${responseList!.data![index].cartData!.length} items"
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: grey_969da8,
                                                            fontFamily:
                                                                fontMavenProMedium,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left),
                                                SizedBox(
                                                  height: 14.h,
                                                ),
                                                responseList!.data![index]
                                                        .cartData!.isEmpty
                                                    ? const SizedBox()
                                                    : ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemCount: responseList!
                                                            .data![index]
                                                            .cartData!
                                                            .length,
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
                                                                          BorderRadius.circular(
                                                                              4.r),
                                                                    ),
                                                                    child: // x1
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: 10
                                                                              .w,
                                                                          vertical:
                                                                              4.h),
                                                                      child: Text(
                                                                          "x${responseList!.data![index].cartData![sIndex].quantity ?? 0}",
                                                                          style: TextStyle(
                                                                              color: black_354356,
                                                                              fontFamily: fontMavenProMedium,
                                                                              fontStyle: FontStyle.normal,
                                                                              fontSize: 14.sp),
                                                                          textAlign: TextAlign.left),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 8.w,
                                                                  ),
                                                                  // Paneer Masala
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                        "${responseList!.data![index].cartData![sIndex].menuItemName!.name ?? 'NA'}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                black_354356,
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontFamily:
                                                                                fontMavenProMedium,
                                                                            fontStyle: FontStyle
                                                                                .normal,
                                                                            fontSize: 14
                                                                                .sp),
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                  // 250
                                                                  Row(
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        icon_rupee_slim,
                                                                        width:
                                                                            10.w,
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                      Text(
                                                                          "${responseList!.data![index].cartData![sIndex].discountPrice ?? 'NA'}",
                                                                          style: TextStyle(
                                                                              color: black_354356,
                                                                              fontFamily: fontMavenProProSemiBold,
                                                                              fontSize: 14.sp),
                                                                          textAlign: TextAlign.left),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 13,
                                                              ),
                                                              const DottedLine(
                                                                direction: Axis
                                                                    .horizontal,
                                                                lineLength: double
                                                                    .infinity,
                                                                lineThickness:
                                                                    1.0,
                                                                dashLength: 4.0,
                                                                dashColor:
                                                                    divider_d4dce7,
                                                                dashRadius: 0.0,
                                                                dashGapLength:
                                                                    4.0,
                                                                dashGapColor: Colors
                                                                    .transparent,
                                                                dashGapRadius:
                                                                    0.0,
                                                              ),
                                                              const SizedBox(
                                                                height: 13,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),

                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text("Total Bill",
                                                          style: TextStyle(
                                                              color:
                                                                  black_354356,
                                                              fontFamily:
                                                                  fontMavenProBold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 15.sp),
                                                          textAlign:
                                                              TextAlign.left),
                                                    ),
                                                    // Paid
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 6.w,
                                                              vertical: 2.h),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.r),
                                                          color: const Color(
                                                              0x215cb85c)),
                                                      child: Text(
                                                          "Paid".toUpperCase(),
                                                          style: TextStyle(
                                                              color:
                                                                  green_5cb85c,
                                                              fontFamily:
                                                                  fontMavenProMedium,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 14.sp),
                                                          textAlign:
                                                              TextAlign.right),
                                                    ),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    // 250
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          icon_rupee_slim,
                                                          width: 10.w,
                                                          height: 10.h,
                                                        ),
                                                        Text(
                                                            "${responseList!.data![index].paymentData!.netPayable ?? '0'}",
                                                            style: TextStyle(
                                                                color:
                                                                    black_354356,
                                                                fontFamily:
                                                                    fontMavenProProSemiBold,
                                                                fontSize:
                                                                    14.sp),
                                                            textAlign:
                                                                TextAlign.left),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 22.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                          "Order Preparation \nTime",
                                                          style: TextStyle(
                                                              color:
                                                                  light_black_5f6d7b,
                                                              fontFamily:
                                                                  fontMavenProMedium,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 14.sp),
                                                          textAlign:
                                                              TextAlign.left),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          border: Border.all(
                                                              width: 1,
                                                              color:
                                                                  grey_d9dde3)),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                if (orderList[
                                                                            index]
                                                                        [
                                                                        'orderPreparationTime'] ==
                                                                    0) {
                                                                  orderList[
                                                                          index]
                                                                      [
                                                                      'orderPreparationTime'] = 0;
                                                                } else {
                                                                  orderList[
                                                                          index]
                                                                      [
                                                                      'orderPreparationTime'] -= 1;
                                                                }
                                                              });
                                                            },
                                                            child: Container(
                                                                width: 44.w,
                                                                height: 40.h,
                                                                color: Colors
                                                                    .transparent,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: SvgPicture
                                                                      .asset(
                                                                          icon_remove_minus),
                                                                )),
                                                          ),

                                                          Container(
                                                            height: 39,
                                                            width: 1,
                                                            color:
                                                                divider_d4dce7,
                                                          ),
                                                          // 10min
                                                          SizedBox(
                                                            width: 60.w,
                                                            child: Text(
                                                                "${orderList[index]['orderPreparationTime']} min",
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
                                                                    fontSize:
                                                                        15.sp),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center),
                                                          ),
                                                          Container(
                                                            height: 39,
                                                            width: 1,
                                                            color:
                                                                divider_d4dce7,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                orderList[index]
                                                                    [
                                                                    'orderPreparationTime'] += 1;
                                                              });
                                                            },
                                                            child: Container(
                                                                width: 44.w,
                                                                height: 40.h,
                                                                color: Colors
                                                                    .transparent,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: SvgPicture
                                                                      .asset(
                                                                          icon_add_plus),
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 22.h,
                                                ),
                                                /*bottom two buttons here*/
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            await selectCancellation(
                                                                context,
                                                                data: responseList!
                                                                        .data![
                                                                    index]);
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    13.r),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 1,
                                                                    strokeAlign:
                                                                        BorderSide
                                                                            .strokeAlignInside,
                                                                    color:
                                                                        grey_d9dde3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(10
                                                                            .r),
                                                                color: Colors
                                                                    .transparent),
                                                            child: // Frame 34242
                                                                Text("REJECT",
                                                                    style: TextStyle(
                                                                        color:
                                                                            orange_d6483d,
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
                                                    TimerWidget(
                                                      apiRes: responseList!
                                                          .data![index],
                                                      onTap: () async {
                                                        await orderViewModel.acceptOrderViewModel(
                                                            orderId:
                                                                responseList!
                                                                    .data![
                                                                        index]
                                                                    .orderId
                                                                    .toString(),
                                                            orderPreparationTime:
                                                                orderList[index]
                                                                        [
                                                                        'orderPreparationTime']
                                                                    .toString(),
                                                            totalPreparationTime:
                                                                orderList[index]
                                                                        [
                                                                        'orderPreparationTime']
                                                                    .toString());
                                                        if (orderViewModel
                                                                .orderAcceptApiResponse
                                                                .status ==
                                                            Status.ERROR) {
                                                          const ServerError();
                                                        }
                                                        if (orderViewModel
                                                                .orderAcceptApiResponse
                                                                .status ==
                                                            Status.COMPLETE) {
                                                          orderAcceptRes =
                                                              orderViewModel
                                                                  .orderAcceptApiResponse
                                                                  .data;
                                                          if (orderAcceptRes!
                                                                  .status ==
                                                              true) {
                                                            bottomViewModel
                                                                .currentIndex = 1;
                                                            Get.off(() =>
                                                                const LatestBottomNavigationScreen());
                                                            // });

                                                            // Utility.orderPTime
                                                            //     .addAll({
                                                            //   responseList!
                                                            //       .data![index]
                                                            //       .orderId: orderList[
                                                            //               index]
                                                            //           [
                                                            //           'orderPreparationTime']
                                                            //       .toString()
                                                            // });
                                                            // print(
                                                            //     'add map====${Utility.orderPTime}');
                                                            // Utility.orderPTime =
                                                            //     orderList[index]
                                                            //             [
                                                            //             'orderPreparationTime']
                                                            //         .toString();
                                                          } else {
                                                            snackBar(
                                                                title:
                                                                    orderAcceptRes!
                                                                        .message);
                                                          }
                                                        }
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),
                  ],
                ),
                GetBuilder<OrderViewModel>(
                  builder: (controller) {
                    if (orderViewModel.orderAcceptApiResponse.status ==
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
      ),
    );
  }

  selectCancellation(BuildContext context, {Data? data}) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          List<OfferModel> onOfferModel = [];
          List<String> selectedList = [];
          TextEditingController controller = TextEditingController();
          onOfferModel.clear();
          selectOffer = '';
          isReasonLayout = false;
          onOfferModel.add(OfferModel("Restaurant became busy"));
          onOfferModel.add(OfferModel("Order items not available"));
          onOfferModel.add(OfferModel("Other Reasons"));
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                  margin: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13.r),
                          topRight: Radius.circular(13.r),
                          bottomRight: Radius.circular(13.r),
                          bottomLeft: Radius.circular(13.r))),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Daily Opportunities
                                      // Title
                                      Center(
                                        child: Text("Select Rejection Reason",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProBold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.sp),
                                            textAlign: TextAlign.center),
                                      ),

                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      // Description
                                      Center(
                                        child: Text(
                                            "Most of rejected customer do not \norder again.",
                                            style: TextStyle(
                                                color: Blue_5468ff,
                                                fontFamily: fontMavenProRegular,
                                                fontSize: 14.sp),
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

                                      ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          primary: false,
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          itemCount: onOfferModel.length,
                                          itemBuilder: (context, i) =>
                                              GestureDetector(
                                                onTap: () {
                                                  setState(
                                                    () {
                                                      if (selectedList.contains(
                                                          onOfferModel[i]
                                                              .title)) {
                                                        selectedList.remove(
                                                            onOfferModel[i]
                                                                .title);
                                                        if (i == 2) {
                                                          isReasonLayout =
                                                              false;
                                                        }
                                                      } else {
                                                        selectedList.add(
                                                            onOfferModel[i]
                                                                .title);
                                                        if (i == 2) {
                                                          isReasonLayout = true;
                                                        }
                                                      }
                                                      selectOffer =
                                                          onOfferModel[i].title;

                                                      print(
                                                          '-...selectedList...-${selectedList}');
                                                      // final removedBrackets = selectedList.toString().substring(1, selectedList.toString().length - 1);
                                                      // final parts = removedBrackets.split(', ');
                                                      //
                                                      // var joined = parts.map((part) => "$part").join(', ');
                                                      //
                                                      // print(joined);
                                                      // MyConstant.strdays=joined;
                                                    },
                                                  );
                                                  // print("Vusti"+selectedList.length.toString());
                                                  // print("Vusti 0"+selectedList.toString());
                                                  // print(onOfferModel.length);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          top: 11,
                                                          bottom: 11),
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        SvgPicture.asset(

                                                            // selectedList
                                                            //     .contains(
                                                            //         onOfferModel[
                                                            //                 i]
                                                            //             .title)
                                                            selectOffer ==
                                                                    onOfferModel[
                                                                            i]
                                                                        .title
                                                                ? icon_selected_checkbox
                                                                : icon_unselected_checkbox),
                                                        SizedBox(
                                                          width: 12.w,
                                                        ),
                                                        // Value Selected
                                                        Text(
                                                            onOfferModel[i]
                                                                .title,
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
                                                                fontSize:
                                                                    15.sp),
                                                            textAlign:
                                                                TextAlign.left)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),

                                      Visibility(
                                        visible: isReasonLayout,
                                        child: Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(
                                              left: 45, right: 16),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 14.w, vertical: 14.h),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xffd9dde3)),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: Colors.white),
                                          child: TextField(
                                            onChanged: (val) {
                                              if (val.isEmpty) {
                                                selectOffer = "";
                                              } else {
                                                selectOffer = controller.text;
                                                setState(() {});
                                                // print(
                                                //     'otherReason---${otherReason}');
                                              }
                                            },
                                            controller: controller,
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProMedium,
                                                fontSize: 15.sp),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Write reason',
                                              contentPadding: EdgeInsets.zero,
                                              isDense: true,
                                              hintStyle: TextStyle(
                                                  color: grey_969da8,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  fontSize: 15.sp),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context, false),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: // Cancel
                                      Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text("Cancel".toUpperCase(),
                                        style: TextStyle(
                                            color: blue_3653f6,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.sp),
                                        textAlign: TextAlign.center),
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
                                onTap: () async {
                                  await orderViewModel
                                      .orderRejectViewModel(
                                          id: data!.orderId.toString(),
                                          orderStatus: 'REJECT',
                                          reason: selectOffer)
                                      .then((value) async {
                                    Get.back();
                                    await orderViewModel.getOrderListViewModel(
                                        orderStatus: "VIEW_ORDER_LIST");
                                  });
                                  //     "action":"change_status",
                                  //     "order_id":"6",
                                  //     "order_status":"REJECT",
                                  //     "rejected_reason":"Low of staff"
                                  // }
                                  // (orderViewModel.orderRejectApiResponse.status==Status.COMPLETE)
                                },
                                // onTap: () => Navigator.pop(context, false),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: // Cancel
                                      Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text("Reject Order".toUpperCase(),
                                        style: TextStyle(
                                            color: orange_d6483d,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.sp),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ));
            },
          );
        });
  }
}
