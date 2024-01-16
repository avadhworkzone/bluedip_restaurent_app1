import 'dart:async';
import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/UiScreen/DineIn/DineInBookingDetail.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/common_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_booking_order_list.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/dine_in_order_view_model.dart';
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
import 'DineInDetailCompleted.dart';
import 'dineIn_empty_data_view.dart';

class DineInOngoingTab extends StatefulWidget {
  const DineInOngoingTab({Key? key}) : super(key: key);

  @override
  State<DineInOngoingTab> createState() => _DineInOngoingTabState();
}

class _DineInOngoingTabState extends State<DineInOngoingTab> {
  // List<OfferModel> offerList = [
  //   OfferModel("Booking ID #123113"),
  // ];

  DineInOrderViewModel dineInOrderViewModel = Get.find();
  GetBookingOrderListResModel? response;

  getOngoingOrderList() async {
    await dineInOrderViewModel.getBookingOrderListViewModel(
        orderStatus: "ONGOING");
  }

  int myposition = 1;

  @override
  void initState() {
    getOngoingOrderList();
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
                                  orderStatus: "ONGOING", keyWord: val);
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
                                          GestureDetector(
                                            onTap: () async {
                                              await dineInOrderViewModel
                                                  .changeOrderStatusViewModel(
                                                      orderId: data.bookingId
                                                          .toString(),
                                                      orderStatus: "COMPLETED");
                                              if (dineInOrderViewModel
                                                      .changeStatusApiResponse
                                                      .status ==
                                                  Status.COMPLETE) {
                                                CommonResponseModel acceptRes =
                                                    dineInOrderViewModel
                                                        .changeStatusApiResponse
                                                        .data;
                                                if (acceptRes.status == true) {
                                                  // bottomViewModel.setDineInIndex(
                                                  //     index: 2);
                                                  await dineInOrderViewModel
                                                      .bookingOrderCountViewModel();
                                                } else {
                                                  snackBar(
                                                      title: acceptRes.message);
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
                                                  Text(
                                                      "Mark As Completed"
                                                          .toUpperCase(),
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
