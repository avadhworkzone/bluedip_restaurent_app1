import 'dart:async';

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/UiScreen/OrderDetailPreparing.dart';
import 'package:bluedip_restaurent/UiScreen/TakeaWay/order_accept_timer_widget.dart';
import 'package:bluedip_restaurent/UiScreen/bottom_bar/LatestBottomNavigationScreen.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/tackaway_order_detail_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/bottom_view_model.dart';
import 'package:bluedip_restaurent/viewModel/order_view_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/blue_box_shadow.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/common_blue_border_button.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/cooking_instruction_widget.dart';
import '../../Widget/customer_detail_widget.dart';
import '../../Widget/items_widget.dart';
import '../../Widget/payment_summery_widget.dart';
import '../../Widget/toolbar_with_title.dart';

import '../../modal/apiModel/response_model/add_more_time_res_model.dart';
import '../../modal/apiModel/response_model/common_res_model.dart';
import '../../utils/utility.dart';
import '../bottomsheets/BottomSheetTimePicker.dart';
import '../OrderDetailPreparingFinal.dart';
import 'order_preparing_timer_widget.dart';

class OrderDetail extends StatefulWidget {
  OrderDetail({Key? key, required this.orderId}) : super(key: key);
  String orderId;

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  int currentSeconds = 0;
  OrderViewModel orderViewModel = Get.find();
  BottomViewModel bottomViewModel = Get.find();
  TakeAwayOrderDetailResModel? response;
  bool isReasonLayout = false;
  String selectOffer = '';
  CommonResponseModel? orderAcceptRes;
  List<OfferModel> offerList = [
    OfferModel("5 mint"),
    OfferModel("10 mint"),
    OfferModel("15 mint"),
  ];
  int mySelectConsultation = -1;
  // List orderDetailList = [];

  @override
  void initState() {
    orderDetailApiCall();
    super.initState();
  }

  orderDetailApiCall() async {
    await orderViewModel
        .tackAwayOrderDetailViewModel(orderId: widget.orderId)
        .then((value) {
      if (orderViewModel.tackAwayOrderDetailApiResponse.status ==
          Status.COMPLETE) {
        response = orderViewModel.tackAwayOrderDetailApiResponse.data;
        // responseList!.data!.forEach((element) {
        // orderDetailList.add({
        //     "orderId": response.data.orderId,
        //     "orderPreparationTime": element.orderPreparationTime == null
        //         ? 0
        //         : int.parse(element.orderPreparationTime.toString())
        //   // });
        // });
      }
    });
    ;
  }

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);

    // Format the date
    String formattedDate = DateFormat('d MMM, yyyy h:mm a').format(date);

    return formattedDate;
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
      // bottomNavigationBar: Column(
      //   children: [
      //     response!.data!.orderStatus == "PAYMENT_COMPLETED"
      //         ? Container(
      //       width: Get.width,
      //       height: 100,
      //       padding: EdgeInsets.symmetric(
      //           horizontal: 16.w, vertical: 20.h),
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         boxShadow: const [
      //           BoxShadow(
      //               color: Color(0x0f041d42),
      //               offset: Offset(0, 3),
      //               blurRadius: 21,
      //               spreadRadius: 0)
      //         ],
      //         borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(12.r),
      //             topRight: Radius.circular(12.r)),
      //       ),
      //       child: Row(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Text("Order Preparation \nTime",
      //               style: TextStyle(
      //                   color: light_black_5f6d7b,
      //                   fontFamily: fontMavenProMedium,
      //                   fontStyle: FontStyle.normal,
      //                   fontSize: 14.sp),
      //               textAlign: TextAlign.left),
      //           Container(
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(10.r),
      //                 border:
      //                 Border.all(width: 1, color: grey_d9dde3)),
      //             child: Row(
      //               children: [
      //                 GestureDetector(
      //                   onTap: () {
      //                     setState(() {
      //                       if (response!
      //                           .data!.orderPreparationTime ==
      //                           0) {
      //                         response!.data!.orderPreparationTime =
      //                         0;
      //                       } else {
      //                         response!.data!.orderPreparationTime -=
      //                         1;
      //                       }
      //                     });
      //                   },
      //                   child: Container(
      //                       width: 44.w,
      //                       height: 40.h,
      //                       color: Colors.transparent,
      //                       child: Padding(
      //                         padding: const EdgeInsets.all(8.0),
      //                         child:
      //                         SvgPicture.asset(icon_remove_minus),
      //                       )),
      //                 ),
      //
      //                 Container(
      //                   height: 39,
      //                   width: 1,
      //                   color: divider_d4dce7,
      //                 ),
      //                 // 10min
      //                 SizedBox(
      //                   width: 60.w,
      //                   child: Text(
      //                       "${response!.data!.orderPreparationTime ?? 0} min",
      //                       style: TextStyle(
      //                           color: black_354356,
      //                           fontWeight: FontWeight.w500,
      //                           fontFamily: fontMavenProMedium,
      //                           fontStyle: FontStyle.normal,
      //                           fontSize: 15.sp),
      //                       textAlign: TextAlign.center),
      //                 ),
      //                 Container(
      //                   height: 39,
      //                   width: 1,
      //                   color: divider_d4dce7,
      //                 ),
      //                 GestureDetector(
      //                   onTap: () {
      //                     setState(() {
      //                       response!.data!.orderPreparationTime += 1;
      //                     });
      //                   },
      //                   child: Container(
      //                       width: 44.w,
      //                       height: 40.h,
      //                       color: Colors.transparent,
      //                       child: Padding(
      //                         padding: const EdgeInsets.all(8.0),
      //                         child: SvgPicture.asset(icon_add_plus),
      //                       )),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height: 22.h,
      //           ),
      //           /*bottom two buttons here*/
      //           Row(
      //             children: [
      //               Expanded(
      //                   flex: 1,
      //                   child: GestureDetector(
      //                     onTap: () async {
      //                       await selectCancellation(context,
      //                           data: response!.data);
      //                     },
      //                     child: Container(
      //                       padding: EdgeInsets.all(13.r),
      //                       decoration: BoxDecoration(
      //                           border: Border.all(
      //                               width: 1,
      //                               strokeAlign:
      //                               BorderSide.strokeAlignInside,
      //                               color: grey_d9dde3),
      //                           borderRadius:
      //                           BorderRadius.circular(10.r),
      //                           color: Colors.transparent),
      //                       child: // Frame 34242
      //                       Text("REJECT",
      //                           style: TextStyle(
      //                               color: orange_d6483d,
      //                               fontFamily:
      //                               fontMavenProMedium,
      //                               fontStyle: FontStyle.normal,
      //                               fontSize: 15.sp),
      //                           textAlign: TextAlign.center),
      //                     ),
      //                   )),
      //               SizedBox(
      //                 width: 16.w,
      //               ),
      //               OrderDetailTimer(
      //                 apiDataRes: response!.data!,
      //                 onTap: () async {
      //                   await orderViewModel.acceptOrderViewModel(
      //                       orderId:
      //                       response!.data!.orderId.toString(),
      //                       orderPreparationTime: response!
      //                           .data!.orderPreparationTime
      //                           .toString());
      //                   if (orderViewModel
      //                       .orderAcceptApiResponse.status ==
      //                       Status.ERROR) {
      //                     const ServerError();
      //                   }
      //                   if (orderViewModel
      //                       .orderAcceptApiResponse.status ==
      //                       Status.COMPLETE) {
      //                     orderAcceptRes = orderViewModel
      //                         .orderAcceptApiResponse.data;
      //                     if (orderAcceptRes!.status == true) {
      //                       // bottomViewModel.currentIndex = 1;
      //                       // Get.off(() =>
      //                       //     const LatestBottomNavigationScreen());
      //                     } else {
      //                       snackBar(title: orderAcceptRes!.message);
      //                     }
      //                   }
      //                 },
      //               )
      //             ],
      //           ),
      //         ],
      //       ),
      //     )
      //         : const SizedBox(),
      //   ],
      // ),
      backgroundColor: bg_f3f5f9,
      body: GetBuilder<OrderViewModel>(
        builder: (controller) {
          if (controller.tackAwayOrderDetailApiResponse.status ==
              Status.LOADING) {
            return const CircularIndicator();
          }
          if (controller.tackAwayOrderDetailApiResponse.status ==
              Status.ERROR) {
            return const ServerError();
          }
          if (controller.tackAwayOrderDetailApiResponse.status ==
              Status.COMPLETE) {
            response = controller.tackAwayOrderDetailApiResponse.data;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToolbarWithTitle("Order #${widget.orderId}"),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),

                        /*pickup layout*/
                        Container(
                          width: double.infinity,
                          decoration: boxDecoration,
                          padding: EdgeInsets.all(14.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Pickup at: 9:00 PM
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    style: TextStyle(
                                        color: light_black_5f6d7b,
                                        fontFamily: fontMavenProRegular,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    text: "Pickup at: "),
                                TextSpan(
                                    style: TextStyle(
                                        color: Blue_5468ff,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    text: response!.data!.time ?? "")
                              ])),
                              SizedBox(
                                height: 10.h,
                              ),
                              // Order: 12 Arp, 2022 at 8.30 PM
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    style: TextStyle(
                                        color: light_black_5f6d7b,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: fontMavenProRegular,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    text: "Order: "),
                                TextSpan(
                                    style: TextStyle(
                                        color: light_black_5f6d7b,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    text: formatDate(
                                        response!.data!.dateCreated!))
                              ]))
                            ],
                          ),
                        ),

                        /// customer detail
                        Container(
                          width: double.infinity,
                          decoration: boxDecoration,
                          padding: EdgeInsets.all(14.r),
                          margin: EdgeInsets.symmetric(vertical: 20.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Customer Detail
                              Text("Customer Detail".toUpperCase(),
                                  style: TextStyle(
                                      color: grey_969da8,
                                      fontFamily: fontMavenProMedium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: 14.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: SizedBox(
                                        height: 48.h,
                                        width: 48.w,
                                        child:
                                            response!.data!.userData!.userImg ==
                                                    null
                                                ? Image.asset(img_girl)
                                                : Image.network(response!
                                                    .data!.userData!.userImg)
                                        // Image.asset(img_girl),
                                        ),
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Jenny
                                        Text(response!.data!.userFullName ?? "",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                    fontMavenProProSemiBold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp),
                                            textAlign: TextAlign.left),

                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(response!.data!.mobileNumber ?? "",
                                            style: TextStyle(
                                                color: grey_969da8,
                                                fontFamily: fontMavenProRegular,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.left)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 44.h,
                                    width: 44.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xff00d9cd),
                                        borderRadius:
                                            BorderRadius.circular(14.r)),
                                    child: Padding(
                                      padding: EdgeInsets.all(11.r),
                                      child: SvgPicture.asset(
                                        icon_phone_call,
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                        /// items
                        // Container(
                        //   width: double.infinity,
                        //   decoration: boxDecoration,
                        //   padding: EdgeInsets.all(14.r),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       // Customer Detail
                        //       Text("2 items".toUpperCase(),
                        //           style: TextStyle(
                        //               color: grey_969da8,
                        //               fontFamily: fontMavenProMedium,
                        //               fontStyle: FontStyle.normal,
                        //               fontSize: 14.sp),
                        //           textAlign: TextAlign.left),
                        //       SizedBox(
                        //         height: 14.h,
                        //       ),
                        //
                        //       Row(
                        //         children: [
                        //           Container(
                        //             decoration: BoxDecoration(
                        //               color: Color(0xffedf0ff),
                        //               borderRadius: BorderRadius.circular(4.r),
                        //             ),
                        //             child: // x1
                        //                 Padding(
                        //               padding: EdgeInsets.symmetric(
                        //                   horizontal: 10.w, vertical: 4.h),
                        //               child: Text("x1",
                        //                   style: TextStyle(
                        //                       color: black_354356,
                        //                       fontFamily: fontMavenProMedium,
                        //                       fontStyle: FontStyle.normal,
                        //                       fontSize: 14.sp),
                        //                   textAlign: TextAlign.left),
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             width: 8.w,
                        //           ),
                        //           // Paneer Masala
                        //           Expanded(
                        //             flex: 1,
                        //             child: Text("Paneer Masala",
                        //                 style: TextStyle(
                        //                     color: black_354356,
                        //                     fontWeight: FontWeight.w500,
                        //                     fontFamily: fontMavenProMedium,
                        //                     fontStyle: FontStyle.normal,
                        //                     fontSize: 14.sp),
                        //                 textAlign: TextAlign.left),
                        //           ),
                        //           // 250
                        //           Row(
                        //             children: [
                        //               Image.asset(
                        //                 icon_rupee_slim,
                        //                 width: 10.w,
                        //                 height: 10.h,
                        //               ),
                        //               Text("250",
                        //                   style: TextStyle(
                        //                       color: black_354356,
                        //                       fontFamily:
                        //                           fontMavenProProSemiBold,
                        //                       fontSize: 14.sp),
                        //                   textAlign: TextAlign.left),
                        //             ],
                        //           )
                        //         ],
                        //       ),
                        //       SizedBox(
                        //         height: 13.h,
                        //       ),
                        //       const DottedLine(
                        //         direction: Axis.horizontal,
                        //         lineLength: double.infinity,
                        //         lineThickness: 1.0,
                        //         dashLength: 4.0,
                        //         dashColor: divider_d4dce7,
                        //         dashRadius: 0.0,
                        //         dashGapLength: 4.0,
                        //         dashGapColor: Colors.transparent,
                        //         dashGapRadius: 0.0,
                        //       ),
                        //       SizedBox(
                        //         height: 13.h,
                        //       ),
                        //       Row(
                        //         children: [
                        //           Container(
                        //             decoration: BoxDecoration(
                        //               color: Color(0xffedf0ff),
                        //               borderRadius: BorderRadius.circular(4.r),
                        //             ),
                        //             child: // x1
                        //                 Padding(
                        //               padding: EdgeInsets.symmetric(
                        //                   horizontal: 10.w, vertical: 4.h),
                        //               child: Text("x2",
                        //                   style: TextStyle(
                        //                       color: black_354356,
                        //                       fontFamily: fontMavenProMedium,
                        //                       fontStyle: FontStyle.normal,
                        //                       fontSize: 14.sp),
                        //                   textAlign: TextAlign.left),
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             width: 8.w,
                        //           ),
                        //           // Paneer Masala
                        //           Expanded(
                        //             flex: 1,
                        //             child: Text("Masala Papad",
                        //                 style: TextStyle(
                        //                     color: black_354356,
                        //                     fontWeight: FontWeight.w500,
                        //                     fontFamily: fontMavenProMedium,
                        //                     fontStyle: FontStyle.normal,
                        //                     fontSize: 14.sp),
                        //                 textAlign: TextAlign.left),
                        //           ),
                        //           // 250
                        //           Row(
                        //             children: [
                        //               Image.asset(
                        //                 icon_rupee_slim,
                        //                 width: 10.w,
                        //                 height: 10.h,
                        //               ),
                        //               Text("50",
                        //                   style: TextStyle(
                        //                       color: black_354356,
                        //                       fontFamily:
                        //                           fontMavenProProSemiBold,
                        //                       fontSize: 14.sp),
                        //                   textAlign: TextAlign.left),
                        //             ],
                        //           )
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: response!.data!.cartData!.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, sIndex) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffedf0ff),
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                      ),
                                      child: // x1
                                          Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 4.h),
                                        child: Text(
                                            "x${response!.data!.cartData![sIndex].quantity ?? 0}",
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
                                          response!.data!.cartData![sIndex]
                                                  .menuItemName!.name ??
                                              'NA',
                                          style: TextStyle(
                                              color: black_354356,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
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
                                            "${response!.data!.cartData![sIndex].discountPrice ?? 'NA'}",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily:
                                                    fontMavenProProSemiBold,
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
                                // const SizedBox(
                                //   height: 13,
                                // ),
                              ],
                            );
                          },
                        ),

                        /*Cooking Instructions*/
                        Container(
                          width: double.infinity,
                          decoration: boxDecoration,
                          padding: EdgeInsets.all(14.r),
                          margin: EdgeInsets.symmetric(vertical: 20.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Customer Detail
                              Text("Cooking Instructions".toUpperCase(),
                                  style: TextStyle(
                                      color: grey_969da8,
                                      fontFamily: fontMavenProMedium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: 10.h,
                              ),
                              // Make it little spicy
                              Text(response!.data!.specialRequest ?? "",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: fontMavenProMedium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                        ),

                        /*Payment Summary*/
                        Container(
                          width: double.infinity,
                          decoration: boxDecoration,
                          padding: EdgeInsets.all(14.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Customer Detail
                              Text("Payment Summary".toUpperCase(),
                                  style: TextStyle(
                                      color: grey_969da8,
                                      fontFamily: fontMavenProMedium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: 14.h,
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("Sub total",
                                        style: TextStyle(
                                            color: light_black_5f6d7b,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left),
                                  ),
                                  response!.data!.paymentData!.subTotal == null
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
                                                    .data!.paymentData!.subTotal
                                                    .toString(),
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontFamily:
                                                        fontMavenProProSemiBold,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left),
                                          ],
                                        )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Text("GST (5%)",
                                            style: TextStyle(
                                                color: light_black_5f6d7b,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.left),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        PopupMenuButton(
                                            offset: const Offset(15, -80),
                                            // enabled: true,
                                            tooltip: "",
                                            constraints: new BoxConstraints(
                                              maxHeight: 105.0,
                                              maxWidth: 100.0,
                                            ),
                                            itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                      enabled: false,
                                                      value: 1,
                                                      height: 30,
                                                      child: // Edit
                                                          // CGST(2.5%)
                                                          Text("CGST(2.5%)",
                                                              style: TextStyle(
                                                                  color:
                                                                      light_black_5f6d7b,
                                                                  fontFamily:
                                                                      fontMavenProMedium,
                                                                  fontSize:
                                                                      12.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left)),
                                                  PopupMenuItem(
                                                      enabled: false,
                                                      value: 2,
                                                      height: 30,
                                                      child: // Edit
                                                          Text("SGST(2.5%)",
                                                              style: TextStyle(
                                                                  color:
                                                                      light_black_5f6d7b,
                                                                  fontFamily:
                                                                      fontMavenProMedium,
                                                                  fontSize:
                                                                      12.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left)),
                                                ],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24, vertical: 10),
                                            child: SvgPicture.asset(
                                                icon_info_cirlce))
                                      ],
                                    ),
                                  ),
                                  // 250
                                  response!.data!.paymentData!.gst == null
                                      ? SizedBox()
                                      : Row(
                                          children: [
                                            Image.asset(
                                              icon_rupee_slim,
                                              width: 10.w,
                                              height: 10.h,
                                            ),
                                            Text(
                                                response!.data!.paymentData!.gst
                                                    .toString(),
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontFamily:
                                                        fontMavenProProSemiBold,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left),
                                          ],
                                        )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("Packing Charges",
                                        style: TextStyle(
                                            color: light_black_5f6d7b,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left),
                                  ),
                                  // 250
                                  response!.data!.paymentData!.packingCharges ==
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
                                                response!.data!.paymentData!
                                                    .packingCharges
                                                    .toString(),
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontFamily:
                                                        fontMavenProProSemiBold,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left),
                                          ],
                                        )
                                ],
                              ),
                              SizedBox(
                                height: 13.h,
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
                                height: 13.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("Grand Total",
                                        style: TextStyle(
                                            color: light_black_5f6d7b,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left),
                                  ),
                                  // 250
                                  response!.data!.paymentData!.grandTotal ==
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
                                                response!.data!.paymentData!
                                                    .grandTotal
                                                    .toString(),
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontFamily:
                                                        fontMavenProProSemiBold,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left),
                                          ],
                                        )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("Bluedip Discount",
                                        style: TextStyle(
                                            color: Blue_5468ff,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left),
                                  ),
                                  // 250
                                  Row(
                                    children: [
                                      Text("-",
                                          style: TextStyle(
                                              color: Blue_5468ff,
                                              fontFamily:
                                                  fontMavenProProSemiBold,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                      Image.asset(
                                        icon_rupee_slim,
                                        width: 10.w,
                                        height: 10.h,
                                        color: Blue_5468ff,
                                      ),
                                      Text("50",
                                          style: TextStyle(
                                              color: Blue_5468ff,
                                              fontFamily:
                                                  fontMavenProProSemiBold,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("Coupon Discount",
                                        style: TextStyle(
                                            color: Blue_5468ff,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left),
                                  ),
                                  // 250
                                  Row(
                                    children: [
                                      Text("-",
                                          style: TextStyle(
                                              color: Blue_5468ff,
                                              fontFamily:
                                                  fontMavenProProSemiBold,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                      Image.asset(
                                        icon_rupee_slim,
                                        width: 10.w,
                                        height: 10.h,
                                        color: Blue_5468ff,
                                      ),
                                      Text("50",
                                          style: TextStyle(
                                              color: Blue_5468ff,
                                              fontFamily:
                                                  fontMavenProProSemiBold,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("Net Payable",
                                        style: TextStyle(
                                            color: black_354356,
                                            fontFamily: fontMavenProProSemiBold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.sp),
                                        textAlign: TextAlign.left),
                                  ),
                                  // Paid
                                  response!.data!.paymentData!.paymentStatus ==
                                          null
                                      ? SizedBox()
                                      : Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6.w, vertical: 2.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              color: Color(0x215cb85c)),
                                          child: Text(
                                              response!.data!.paymentData!
                                                  .paymentStatus
                                                  .toString(),
                                              style: TextStyle(
                                                  color: green_5cb85c,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.sp),
                                              textAlign: TextAlign.right),
                                        ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  // 250
                                  response!.data!.paymentData!.netPayable ==
                                          null
                                      ? SizedBox()
                                      : Row(
                                          children: [
                                            Image.asset(
                                              icon_rupee_slim,
                                              width: 12.w,
                                              height: 12.h,
                                            ),
                                            Text(
                                                response!.data!.paymentData!
                                                    .netPayable
                                                    .toString(),
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontFamily:
                                                        fontMavenProProSemiBold,
                                                    fontSize: 15.sp),
                                                textAlign: TextAlign.left),
                                          ],
                                        )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              response!.data!.orderStatus == "PICKED_UP"
                  ? SizedBox()
                  : Container(
                      width: Get.width,
                      // height: 100,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x0f041d42),
                              offset: Offset(0, 3),
                              blurRadius: 21,
                              spreadRadius: 0)
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r)),
                      ),
                      child: response!.data!.orderStatus == "PAYMENT_COMPLETED"
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Order Preparation \nTime",
                                        style: TextStyle(
                                            color: light_black_5f6d7b,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border: Border.all(
                                              width: 1, color: grey_d9dde3)),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (response!.data!
                                                        .orderPreparationTime ==
                                                    0) {
                                                  response!.data!
                                                      .orderPreparationTime = 0;
                                                } else {
                                                  response!.data!
                                                      .orderPreparationTime -= 1;
                                                }
                                              });
                                            },
                                            child: Container(
                                                width: 44.w,
                                                height: 40.h,
                                                color: Colors.transparent,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SvgPicture.asset(
                                                      icon_remove_minus),
                                                )),
                                          ),

                                          Container(
                                            height: 39,
                                            width: 1,
                                            color: divider_d4dce7,
                                          ),
                                          // 10min
                                          SizedBox(
                                            width: 60.w,
                                            child: Text(
                                                "${response!.data!.orderPreparationTime ?? 0} min",
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        fontMavenProMedium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15.sp),
                                                textAlign: TextAlign.center),
                                          ),
                                          Container(
                                            height: 39,
                                            width: 1,
                                            color: divider_d4dce7,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                response!.data!
                                                    .orderPreparationTime += 1;
                                              });
                                            },
                                            child: Container(
                                                width: 44.w,
                                                height: 40.h,
                                                color: Colors.transparent,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SvgPicture.asset(
                                                      icon_add_plus),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 22.h,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await selectCancellation(context,
                                              data: response!.data);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(13.r),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignInside,
                                                  color: grey_d9dde3),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: Colors.transparent),
                                          child: // Frame 34242
                                              Text("REJECT",
                                                  style: TextStyle(
                                                      color: orange_d6483d,
                                                      fontFamily:
                                                          fontMavenProMedium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 15.sp),
                                                  textAlign: TextAlign.center),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    OrderDetailTimer(
                                      apiDataRes: response!.data!,
                                      onTap: () async {
                                        await orderViewModel
                                            .acceptOrderViewModel(
                                                orderId: response!.data!.orderId
                                                    .toString(),
                                                orderPreparationTime: response!
                                                    .data!.orderPreparationTime
                                                    .toString(),
                                                totalPreparationTime: response!
                                                    .data!.orderPreparationTime
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
                                          orderAcceptRes = orderViewModel
                                              .orderAcceptApiResponse.data;
                                          if (orderAcceptRes!.status == true) {
                                            await orderViewModel
                                                .tackAwayOrderDetailViewModel(
                                                    orderId: widget.orderId);
                                            // bottomViewModel.currentIndex = 1;
                                            // Get.off(() =>
                                            //     const LatestBottomNavigationScreen());
                                          } else {
                                            snackBar(
                                                title: orderAcceptRes!.message);
                                          }
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ],
                            )
                          : response!.data!.orderStatus == "ACCEPT"
                              ? Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: () {
                                            response!.data!.isNeedMoreTime == 0
                                                ? selectMoreTime(
                                                    context: context,
                                                    orderId: response!
                                                        .data!.orderId
                                                        .toString())
                                                : const SizedBox();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4.h),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: grey_d9dde3),
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: response!.data!
                                                            .isNeedMoreTime ==
                                                        0
                                                    ? Colors.transparent
                                                    : Colors.grey
                                                        .withOpacity(0.1)),
                                            child: // Frame 34242
                                                Text("Need \nmore time",
                                                    style: TextStyle(
                                                        color: response!.data!
                                                                    .isNeedMoreTime ==
                                                                0
                                                            ? orange_d6483d
                                                            : Color(0xffd6483d)
                                                                .withOpacity(
                                                                    0.5),
                                                        fontFamily:
                                                            fontMavenProMedium,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp),
                                                    textAlign:
                                                        TextAlign.center),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    OrderPreparingTimeButton(
                                      isDetailScreen: true,
                                      apiDataRes: response!.data!,
                                      onTap: () async {
                                        await orderViewModel
                                            .orderReadyPickViewModel(
                                                orderId: response!.data!.orderId
                                                    .toString(),
                                                orderStatus: "READY");
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
                                          CommonResponseModel orderReadyRes =
                                              orderViewModel
                                                  .orderReadyPickUpApiResponse
                                                  .data;
                                          if (orderReadyRes.status == true) {
                                            await orderViewModel
                                                .tackAwayOrderDetailViewModel(
                                                    orderId: widget.orderId);
                                            // bottomViewModel.setTakeawayIndex(
                                            //     index: 1);
                                            // await orderViewModel
                                            //     .getOrderCountViewModel();
                                            setState(() {});
                                          } else {
                                            snackBar(
                                                title: orderReadyRes.message);
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
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    await orderViewModel
                                        .orderReadyPickViewModel(
                                            orderId: response!.data!.orderId
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
                                      CommonResponseModel orderReadyRes =
                                          orderViewModel
                                              .orderReadyPickUpApiResponse.data;
                                      if (orderReadyRes.status == true) {
                                        await orderViewModel
                                            .tackAwayOrderDetailViewModel(
                                                orderId: widget.orderId);
                                      } else {
                                        snackBar(title: orderReadyRes.message);
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
                                            BorderRadius.circular(10.r),
                                        color: Blue_5468ff),
                                    child: // Frame 34242
                                        Text("MARK AS PICKED UP",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp),
                                            textAlign: TextAlign.center),
                                  ),
                                ),
                    ),
            ],
          );
        },
      ),
    ));
  }

  selectCancellation(BuildContext context, {OrderDetailData? data}) {
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
                                    bottomViewModel.currentIndex = 1;
                                    Get.off(() =>
                                        const LatestBottomNavigationScreen());
                                    // await orderViewModel.getOrderListViewModel(
                                    //     orderStatus: "VIEW_ORDER_LIST");
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
                                            padding: EdgeInsets.only(
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
                                              // await orderViewModel
                                              //     .addMoreTimeViewModel(
                                              //         orderId: orderId,
                                              //         moreTime:
                                              //             mySelectConsultation ==
                                              //                     0
                                              //                 ? 5
                                              //                 : mySelectConsultation ==
                                              //                         1
                                              //                     ? 10
                                              //                     : 15,
                                              //         orderPreparationTime:
                                              //             mySelectConsultation ==
                                              //                     0
                                              //                 ? 5 +
                                              //                     Utility
                                              //                         .orderRTime
                                              //                 : mySelectConsultation ==
                                              //                         1
                                              //                     ? 10 +
                                              //                         Utility
                                              //                             .orderRTime
                                              //                     : 15 +
                                              //                         Utility
                                              //                             .orderRTime,
                                              //         totalPreparationTime: int
                                              //                         .parse(Utility
                                              //                                 .orderPTime[
                                              //                             orderId]) +
                                              //                     mySelectConsultation ==
                                              //                 0
                                              //             ? 5
                                              //             : mySelectConsultation ==
                                              //                     1
                                              //                 ? 10
                                              //                 : 15);
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
