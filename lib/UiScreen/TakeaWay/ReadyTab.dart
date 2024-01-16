import 'dart:async';
import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
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
import '../OrderDetailPickup.dart';
import 'data_empty_view.dart';

class ReadyTab extends StatefulWidget {
  const ReadyTab({Key? key}) : super(key: key);

  @override
  State<ReadyTab> createState() => _ReadyTabState();
}

class _ReadyTabState extends State<ReadyTab> {
  OrderViewModel orderViewModel = Get.find();
  BottomViewModel bottomViewModel = Get.find();
  GetOrderListResponseModel? response;

  getOrderReady() async {
    await orderViewModel.getOrderListViewModel(orderStatus: "READY");
  }

  @override
  void initState() {
    getOrderReady();
    // TODO: implement initState
    super.initState();
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
          return Column(
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
                              orderStatus: "READY", keyword: val);
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                      /*order list item*/
                      response!.data!.isEmpty
                          ? const EmptyView()
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              primary: false,
                              shrinkWrap: true,
                              itemCount: response!.data!.length,
                              itemBuilder: (context, i) => Padding(
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
                                                  textAlign: TextAlign.left),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                style: TextStyle(
                                                    color: light_black_5f6d7b,
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
                                            dashGapColor: Colors.transparent,
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
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // John doe
                                                    Text(
                                                        "${response!.data![i].userFullName}",
                                                        style: TextStyle(
                                                            color: black_354356,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                fontMavenProProSemiBold,
                                                            fontSize: 15.sp),
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
                                                                  vertical: 3.h,
                                                                  horizontal:
                                                                      6.w),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              color: Color(
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
                                                                      fontWeight:
                                                                          FontWeight
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
                                                                  vertical: 3.h,
                                                                  horizontal:
                                                                      6.w),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              color: Color(
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
                                                                      fontWeight:
                                                                          FontWeight
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
                                              response!.data![i].paymentData!
                                                          .paymentStatus ==
                                                      null
                                                  ? SizedBox()
                                                  : Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 6.w,
                                                              vertical: 2.h),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.r),
                                                          color: Color(
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
                                                              fontSize: 14.sp),
                                                          textAlign:
                                                              TextAlign.right),
                                                    ),

                                              SizedBox(
                                                width: 6.w,
                                              ),

                                              response!.data![i].paymentData!
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
                                                                TextAlign.left),
                                                      ],
                                                    )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),

                                          /*bottom two buttons here*/
                                          GestureDetector(
                                            onTap: () async {
                                              await orderViewModel
                                                  .orderReadyPickViewModel(
                                                      orderId: response!
                                                          .data![i].orderId
                                                          .toString(),
                                                      orderStatus: "PICKED_UP");
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
                                                if (orderReadyRes.status ==
                                                    true) {
                                                  bottomViewModel
                                                      .setTakeawayIndex(
                                                          index: 2);
                                                  await orderViewModel
                                                      .getOrderCountViewModel();
                                                  setState(() {});
                                                } else {
                                                  snackBar(
                                                      title: orderReadyRes
                                                          .message);
                                                }
                                              }
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           const OrderDetailPickup(),
                                              //     ));
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
                                                  Text("MARK AS PICKED UP",
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                    ],
                  ),
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}
