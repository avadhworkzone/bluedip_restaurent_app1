import 'dart:async';

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/common_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/bottom_view_model.dart';
import 'package:bluedip_restaurent/viewModel/dine_in_order_view_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_icons.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/search_bar.dart';
import '../../modal/apiModel/response_model/get_booking_order_list.dart';
import 'DineInBookingDetail.dart';
import 'DineInDetailAccepted.dart';
import 'dineIn_empty_data_view.dart';

class DineInAcceptedTab extends StatefulWidget {
  const DineInAcceptedTab({Key? key}) : super(key: key);

  @override
  State<DineInAcceptedTab> createState() => _DineInAcceptedTabState();
}

class _DineInAcceptedTabState extends State<DineInAcceptedTab> {
  DineInOrderViewModel dineInOrderViewModel = Get.find();
  GetBookingOrderListResModel? response;
  BottomViewModel bottomViewModel = Get.find();

  getAcceptedOrderList() async {
    await dineInOrderViewModel.getBookingOrderListViewModel(
        orderStatus: "ACCEPT");
  }

  @override
  void initState() {
    getAcceptedOrderList();
    // TODO: implement initState
    super.initState();
  }

  int myposition = 0;

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
      body: GetBuilder<DineInOrderViewModel>(
        builder: (controller) {
          if (controller.getBookingOrderListApiResponse.status ==
              Status.LOADING) {
            return const CircularIndicator();
          }
          if (controller.getBookingOrderListApiResponse.status ==
              Status.ERROR) {
            return const ServerError();
          }
          if (controller.getBookingOrderListApiResponse.status ==
              Status.COMPLETE) {
            response = controller.getBookingOrderListApiResponse.data;
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
                          await dineInOrderViewModel
                              .getBookingOrderListViewModel(
                                  orderStatus: "ACCEPT", keyWord: val);
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                      /*order list item*/
                      response!.data == null
                          ? const DineInEmptyView()
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              primary: false,
                              shrinkWrap: true,
                              itemCount: response!.data!.length,
                              itemBuilder: (context, i) {
                                final data = response!.data![i];
                                DateTime parsedBookingTime =
                                    DateFormat("h:mm a").parse(data.time!);
                                // DateTime bookingTime = format.parse("4:53 PM");
                                DateTime currentDateTime = DateTime.now();

                                DateTime currentBookingDateTime = DateTime(
                                  currentDateTime.year,
                                  currentDateTime.month,
                                  currentDateTime.day,
                                  parsedBookingTime.hour,
                                  parsedBookingTime.minute,
                                );

                                bool isBookingComplete = currentDateTime
                                    .isAfter(currentBookingDateTime);

                                return Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DineInBookingDetail(
                                              bookingID:
                                                  data.bookingId.toString(),
                                            ),
                                          ));
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
                                                  "Booking ID #${data.bookingId.toString()}",
                                                  style: TextStyle(
                                                      color: black_354356,
                                                      fontFamily:
                                                          fontMavenProProSemiBold,
                                                      fontSize: 15.sp),
                                                  textAlign: TextAlign.left),
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
                                            height: 5.h,
                                          ),
                                          // Pickup at: 9:00 PM
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                style: TextStyle(
                                                    color: light_black_5f6d7b,
                                                    fontFamily:
                                                        fontMavenProRegular,
                                                    fontSize: 14.sp),
                                                text: "Booking for : "),
                                            TextSpan(
                                                style: TextStyle(
                                                    color: Blue_5468ff,
                                                    fontFamily:
                                                        fontMavenProMedium,
                                                    fontSize: 14.sp),
                                                text: data.time ?? "")
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Name",
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
                                                      height: 3.h,
                                                    ),
                                                    // Jenny
                                                    Container(
                                                      width: 80.w,
                                                      child: Text(
                                                          data.userFullName ??
                                                              "",
                                                          style: TextStyle(
                                                            color: black_354356,
                                                            fontFamily:
                                                                fontMavenProProSemiBold,
                                                            fontSize: 15.sp,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Guest",
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
                                                      height: 3.h,
                                                    ),
                                                    // Jenny
                                                    Text(
                                                        data.noOfGuest
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: black_354356,
                                                            fontFamily:
                                                                fontMavenProProSemiBold,
                                                            fontSize: 15.sp),
                                                        textAlign:
                                                            TextAlign.left)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ), // Name

                                          SizedBox(
                                            height: 14.h,
                                          ),
                                          /*bottom two buttons here*/
                                          data.orderStatus == "CANCEL_BOOKING"
                                              ? Container(
                                                  width: Get.width,
                                                  padding: EdgeInsets.all(13.r),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color: grey_d9dde3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      color:
                                                          Colors.transparent),
                                                  child: // Frame 34242
                                                      Text(
                                                          "Booking Cancel By User",
                                                          style: TextStyle(
                                                              color:
                                                                  orange_d6483d,
                                                              fontFamily:
                                                                  fontMavenProMedium,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 15.sp),
                                                          textAlign:
                                                              TextAlign.center),
                                                )
                                              : Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: () async {
                                                            if (isBookingComplete) {
                                                              await dineInOrderViewModel.changeOrderStatusViewModel(
                                                                  orderId: data
                                                                      .bookingId
                                                                      .toString(),
                                                                  orderStatus:
                                                                      "GUEST_DID_NOT_COME");
                                                              if (dineInOrderViewModel
                                                                      .changeStatusApiResponse
                                                                      .status ==
                                                                  Status
                                                                      .COMPLETE) {
                                                                CommonResponseModel
                                                                    acceptRes =
                                                                    dineInOrderViewModel
                                                                        .changeStatusApiResponse
                                                                        .data;
                                                                if (acceptRes
                                                                        .status ==
                                                                    true) {
                                                                  bottomViewModel
                                                                      .setDineInIndex(
                                                                          index:
                                                                              1);
                                                                  await dineInOrderViewModel
                                                                      .bookingOrderCountViewModel();
                                                                } else {
                                                                  snackBar(
                                                                      title: acceptRes
                                                                          .message);
                                                                }
                                                              }
                                                            }
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        13.h),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 1,
                                                                    color:
                                                                        grey_d9dde3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(10
                                                                            .r),
                                                                color: Colors
                                                                    .transparent),
                                                            child: // Frame 34242
                                                                Text(
                                                                    "Guest didn't come",
                                                                    style: TextStyle(
                                                                        color: isBookingComplete
                                                                            ? orange_d6483d
                                                                            : grey_969da8,
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
                                                    Expanded(
                                                        flex: 1,
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            await dineInOrderViewModel
                                                                .changeOrderStatusViewModel(
                                                                    orderId: data
                                                                        .bookingId
                                                                        .toString(),
                                                                    orderStatus:
                                                                        "ONGOING");
                                                            if (dineInOrderViewModel
                                                                    .changeStatusApiResponse
                                                                    .status ==
                                                                Status
                                                                    .COMPLETE) {
                                                              CommonResponseModel
                                                                  acceptRes =
                                                                  dineInOrderViewModel
                                                                      .changeStatusApiResponse
                                                                      .data;
                                                              if (acceptRes
                                                                      .status ==
                                                                  true) {
                                                                bottomViewModel
                                                                    .setDineInIndex(
                                                                        index:
                                                                            2);
                                                                await dineInOrderViewModel
                                                                    .bookingOrderCountViewModel();
                                                              } else {
                                                                snackBar(
                                                                    title: acceptRes
                                                                        .message);
                                                              }
                                                            }
                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //       builder: (context) =>
                                                            //           const DineInDetailAccepted(),
                                                            //     ));
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    14.r),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(10
                                                                            .r),
                                                                color:
                                                                    Blue_5468ff),
                                                            child: // Frame 34242
                                                                Text("START",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
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
          );
        },
      ),
    );
  }
}
