import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/dine_in_order_history.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/order_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Styles/my_icons.dart';
import '../../../Widget/box_shadow.dart';

class OrderHistoryDineInDetail extends StatefulWidget {
  OrderHistoryDineInDetail({Key? key, required this.orderId}) : super(key: key);
  String orderId;

  @override
  State<OrderHistoryDineInDetail> createState() =>
      _OrderHistoryDineInDetailState();
}

class _OrderHistoryDineInDetailState extends State<OrderHistoryDineInDetail> {
  OrderHistoryViewModel orderHistoryViewModel = Get.find();
  DineInHistoryDetailResModel? response;

  getDetail() {
    orderHistoryViewModel.dOrderHistoryDetailViewModel(orderId: widget.orderId);
  }

  @override
  void initState() {
    getDetail();
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
          if (controller.dHistoryDetailApiResponse.status == Status.LOADING) {
            return const CircularIndicator();
          }
          if (controller.dHistoryDetailApiResponse.status == Status.ERROR) {
            return const ServerError();
          }
          if (controller.dHistoryDetailApiResponse.status == Status.COMPLETE) {
            response = controller.dHistoryDetailApiResponse.data;
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
                        "Booking #${response!.data!.bookingId}",
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
                            color: response!.data!.orderStatus ==
                                        "CANCEL_BOOKING" ||
                                    response!.data!.orderStatus == "REJECT"
                                ? red_d9534f
                                : green_5cb85c),
                        child: // Completed
                            Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 6.h),
                          child: Text(
                              response!.data!.orderStatus == "CANCEL_BOOKING" ||
                                      response!.data!.orderStatus == "REJECT"
                                  ? "Cancelled"
                                  : "Completed",
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
              // ToolbarWithTitleType("Booking #${response!.data!.bookingId}",
              //     "Completed", green_5cb85c),
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

                        /*booking layout*/
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
                                    text: "Booking for: "),
                                TextSpan(
                                    style: TextStyle(
                                        color: Blue_5468ff,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    text: response!.data!.bookingTime ?? "")
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
                                    text: "Booking: "),
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
                              response!.data!.orderStatus == "CANCEL_BOOKING"
                                  ? RichText(
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
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          text: "by Customer")
                                    ]))
                                  : response!.data!.orderStatus == "REJECT"
                                      ? RichText(
                                          text: TextSpan(children: [
                                          TextSpan(
                                              style: TextStyle(
                                                  color: light_black_5f6d7b,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      fontMavenProRegular,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.sp),
                                              text: "Cancelled: "),
                                          TextSpan(
                                              style: TextStyle(
                                                  color: red_d9534f,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.sp),
                                              text: response!
                                                      .data!.rejectedReason ??
                                                  "")
                                        ]))
                                      : RichText(
                                          text: TextSpan(children: [
                                          TextSpan(
                                              style: TextStyle(
                                                  color: light_black_5f6d7b,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      fontMavenProRegular,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.sp),
                                              text: "Completed: "),
                                          TextSpan(
                                              style: TextStyle(
                                                  color: light_black_5f6d7b,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.sp),
                                              text: response!.data!
                                                      .orderCompletedTime ??
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
                                        child: response!.data!.userImg == null
                                            ? Image.asset(img_girl)
                                            : Image.network(
                                                response!.data!.userImg)
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

                        /*Booking Details*/
                        Container(
                          width: double.infinity,
                          decoration: boxDecoration,
                          padding: EdgeInsets.all(14.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Customer Detail
                              Text("Booking Details".toUpperCase(),
                                  style: TextStyle(
                                      color: grey_969da8,
                                      fontFamily: fontMavenProMedium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: 14.h,
                              ),
                              // Make it little spicy
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Guest",
                                      style: TextStyle(
                                          color: light_black_5f6d7b,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),
                                  Text(response!.data!.noOfGuest.toString(),
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontMavenProProSemiBold,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),
                                ],
                              ),

                              SizedBox(
                                height: 8.h,
                              ),
                              // Make it little spicy
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Offer",
                                      style: TextStyle(
                                          color: Blue_5468ff,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),
                                  Text("${response!.data!.offerPercentage} off",
                                      style: TextStyle(
                                          color: Blue_5468ff,
                                          fontFamily: fontMavenProProSemiBold,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),
                                ],
                              )
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
