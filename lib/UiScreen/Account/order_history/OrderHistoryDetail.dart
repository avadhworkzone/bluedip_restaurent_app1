import 'dart:async';

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/Widget/toolbar_with_title_type.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/order_history_view_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Styles/my_strings.dart';
import '../../../Widget/Textfield.dart';
import '../../../Widget/box_shadow.dart';
import '../../../Widget/circular_progrss_indicator.dart';
import '../../../Widget/common_blue_border_button.dart';
import '../../../Widget/common_blue_button.dart';
import '../../../Widget/cooking_instruction_widget.dart';
import '../../../Widget/customer_detail_widget.dart';
import '../../../Widget/items_widget.dart';
import '../../../Widget/payment_summery_widget.dart';
import '../../../Widget/toolbar_with_title.dart';
import '../../../modal/apiModel/response_model/order_history_detail_res_model.dart';
import '../../../modal/apiModel/response_model/tackaway_order_detail_res_model.dart';

class OrderHistoryDetailScreen extends StatefulWidget {
  OrderHistoryDetailScreen({Key? key, required this.orderId}) : super(key: key);
  String orderId;

  @override
  State<OrderHistoryDetailScreen> createState() =>
      _OrderHistoryDetailScreenState();
}

class _OrderHistoryDetailScreenState extends State<OrderHistoryDetailScreen> {
  OrderHistoryViewModel orderHistoryViewModel = Get.find();
  OrderHistoryDetailResModel? response;
  String? formattedTime;

  @override
  void initState() {
    orderHistoryViewModel.tOrderHistoryDetailViewModel(orderId: widget.orderId);
    // TODO: implement initState
    super.initState();
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
      backgroundColor: bg_f3f5f9,
      body: GetBuilder<OrderHistoryViewModel>(
        builder: (controller) {
          if (controller.tHistoryDetailApiResponse.status == Status.LOADING) {
            return const CircularIndicator();
          }
          if (controller.tHistoryDetailApiResponse.status == Status.ERROR) {
            return const ServerError();
          }
          if (controller.tHistoryDetailApiResponse.status == Status.COMPLETE) {
            response = controller.tHistoryDetailApiResponse.data;

            if (response!.data!.orderPickupTime != null) {
              final dateTime = DateTime.parse(response!.data!.orderPickupTime);

              // Format the DateTime object to the desired time format
              formattedTime = DateFormat('h:mm a').format(dateTime);
            }
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context, false),
                        child: Container(
                            width: 40.w,
                            height: 40.w,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SvgPicture.asset(icon_arrow_left),
                            ))),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Order #${response!.data!.orderId.toString()}",
                        style: TextStyle(
                            fontFamily: fontJosefinSansBold,
                            color: black_354356,
                            fontSize: 20.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: response!.data!.orderStatus == "PICKED_UP"
                                ? green_5cb85c
                                : red_d9534f),
                        child: // Completed
                            Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 6.h),
                          child: Text(
                              response!.data!.orderStatus == "PICKED_UP"
                                  ? "Completed"
                                  : "Cancelled",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontMavenProMedium,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // ToolbarWithTitleType(
              //     "Order #${response!.data!.orderId.toString()}",
              //     "${response!.data!.orderStatus}",
              //     green_5cb85c),
              Expanded(
                flex: 1,
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
                              ])),
                              SizedBox(
                                height: 10.h,
                              ),
                              // Order: 12 Arp, 2022 at 8.30 PM
                              response!.data!.orderStatus == "PICKED_UP"
                                  ? RichText(
                                      text: TextSpan(children: [
                                      TextSpan(
                                          style: TextStyle(
                                              color: light_black_5f6d7b,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: fontMavenProRegular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          text: "Picked up at: "),
                                      TextSpan(
                                          style: TextStyle(
                                              color: light_black_5f6d7b,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          text: formattedTime)
                                    ]))
                                  : RichText(
                                      text: TextSpan(children: [
                                      TextSpan(
                                          style: TextStyle(
                                              color: light_black_5f6d7b,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: fontMavenProRegular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          text: "Cancelled: "),
                                      TextSpan(
                                          style: TextStyle(
                                              color: red_d9534f,
                                              fontWeight: FontWeight.w100,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          text:
                                              response!.data!.rejectedReason ??
                                                  "")
                                    ]))
                            ],
                          ),
                        ),

                        /*customer detail*/
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

                        /*item layout*/
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
            ],
          );
        },
      ),
    ));
  }
}
