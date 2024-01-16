import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/UiScreen/bottom_bar/LatestBottomNavigationScreen.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/common_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_booking_order_detail_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/bottom_view_model.dart';
import 'package:bluedip_restaurent/viewModel/dine_in_order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_icons.dart';
import '../../Widget/blue_box_shadow.dart';
import '../../Widget/booking_detail_widget.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/customer_detail_widget.dart';
import '../../Widget/toolbar_with_title.dart';

class DineInBookingDetail extends StatefulWidget {
  DineInBookingDetail({Key? key, required this.bookingID}) : super(key: key);
  String bookingID;

  @override
  State<DineInBookingDetail> createState() => _DineInBookingDetailState();
}

class _DineInBookingDetailState extends State<DineInBookingDetail> {
  DineInOrderViewModel dineInOrderViewModel = Get.find();
  GetBookingOrderDetailResModel? response;
  bool isBookingComplete = false;
  bool isReasonLayout = false;
  String selectOffer = '';
  BottomViewModel bottomViewModel = Get.find();

  getBookingOrderDetail() async {
    await dineInOrderViewModel.getBookingOrderDetailViewModel(
        orderId: widget.bookingID);
  }

  @override
  void initState() {
    getBookingOrderDetail();
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
      body: GetBuilder<DineInOrderViewModel>(
        builder: (controller) {
          if (controller.getBookingOrderDetailApiResponse.status ==
              Status.LOADING) {
            return const CircularIndicator();
          }
          if (controller.getBookingOrderDetailApiResponse.status ==
              Status.ERROR) {
            return const ServerError();
          }
          if (controller.getBookingOrderDetailApiResponse.status ==
              Status.COMPLETE) {
            response = controller.getBookingOrderDetailApiResponse.data;
            DateTime parsedBookingTime =
                DateFormat("h:mm a").parse(response!.data!.time!);
            // DateTime bookingTime = format.parse("4:53 PM");
            DateTime currentDateTime = DateTime.now();

            DateTime currentBookingDateTime = DateTime(
              currentDateTime.year,
              currentDateTime.month,
              currentDateTime.day,
              parsedBookingTime.hour,
              parsedBookingTime.minute,
            );

            isBookingComplete = currentDateTime.isAfter(currentBookingDateTime);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToolbarWithTitle("Booking #${response!.data!.bookingId}"),
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
                                    text: "Booking: "),
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*bottom two buttons here*/
                    response!.data!.orderStatus == "CANCEL_BOOKING"
                        ? Container(
                            width: Get.width,
                            padding: EdgeInsets.all(13.r),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: grey_d9dde3),
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.transparent),
                            child: // Frame 34242
                                Text("Booking Cancel By User",
                                    style: TextStyle(
                                        color: orange_d6483d,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.sp),
                                    textAlign: TextAlign.center),
                          )
                        : response!.data!.orderStatus == "ACCEPT"
                            ? Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () async {
                                          if (isBookingComplete) {
                                            await dineInOrderViewModel
                                                .changeOrderStatusViewModel(
                                                    orderId: response!
                                                        .data!.bookingId
                                                        .toString(),
                                                    orderStatus:
                                                        "GUEST_DID_NOT_COME");
                                            if (dineInOrderViewModel
                                                    .changeStatusApiResponse
                                                    .status ==
                                                Status.COMPLETE) {
                                              CommonResponseModel acceptRes =
                                                  dineInOrderViewModel
                                                      .changeStatusApiResponse
                                                      .data;
                                              if (acceptRes.status == true) {
                                                // bottomViewModel
                                                //     .setDineInIndex(
                                                //     index: 1);
                                                await dineInOrderViewModel
                                                    .bookingOrderCountViewModel();

                                                bottomViewModel.currentIndex =
                                                    3;
                                                Get.off(() =>
                                                    const LatestBottomNavigationScreen());
                                              } else {
                                                snackBar(
                                                    title: acceptRes.message);
                                              }
                                            }
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 13.h),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: grey_d9dde3),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: Colors.transparent),
                                          child: // Frame 34242
                                              Text("Guest didn't come",
                                                  style: TextStyle(
                                                      color: isBookingComplete
                                                          ? orange_d6483d
                                                          : grey_969da8,
                                                      fontFamily:
                                                          fontMavenProMedium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 15.sp),
                                                  textAlign: TextAlign.center),
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
                                                  orderId: response!
                                                      .data!.bookingId
                                                      .toString(),
                                                  orderStatus: "ONGOING");
                                          if (dineInOrderViewModel
                                                  .changeStatusApiResponse
                                                  .status ==
                                              Status.COMPLETE) {
                                            CommonResponseModel acceptRes =
                                                dineInOrderViewModel
                                                    .changeStatusApiResponse
                                                    .data;
                                            if (acceptRes.status == true) {
                                              // bottomViewModel
                                              //     .setDineInIndex(
                                              //     index: 2);
                                              await dineInOrderViewModel
                                                  .bookingOrderCountViewModel();
                                              await dineInOrderViewModel
                                                  .getBookingOrderDetailViewModel(
                                                      orderId:
                                                          widget.bookingID);
                                            } else {
                                              snackBar(
                                                  title: acceptRes.message);
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
                                          padding: EdgeInsets.all(14.r),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: Blue_5468ff),
                                          child: // Frame 34242
                                              Text("START",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          fontMavenProMedium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 15.sp),
                                                  textAlign: TextAlign.center),
                                        ),
                                      )),
                                ],
                              )
                            : response!.data!.orderStatus == null
                                ? Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              selectCancellation(
                                                  context: context,
                                                  orderId: response!
                                                      .data!.bookingId
                                                      .toString());
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(13.r),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: grey_d9dde3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.r),
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
                                                      textAlign:
                                                          TextAlign.center),
                                            ),
                                          )),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: InkWell(
                                            onTap: () async {
                                              await dineInOrderViewModel
                                                  .changeOrderStatusViewModel(
                                                      orderId: response!
                                                          .data!.bookingId
                                                          .toString(),
                                                      orderStatus: "ACCEPT");
                                              if (dineInOrderViewModel
                                                      .changeStatusApiResponse
                                                      .status ==
                                                  Status.COMPLETE) {
                                                CommonResponseModel acceptRes =
                                                    dineInOrderViewModel
                                                        .changeStatusApiResponse
                                                        .data;
                                                if (acceptRes.status == true) {
                                                  // bottomViewModel
                                                  //     .setDineInIndex(
                                                  //     index:
                                                  //     1);
                                                  await dineInOrderViewModel
                                                      .bookingOrderCountViewModel();
                                                  await dineInOrderViewModel
                                                      .getBookingOrderDetailViewModel(
                                                          orderId:
                                                              widget.bookingID);
                                                } else {
                                                  snackBar(
                                                      title: acceptRes.message);
                                                }
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(14.r),
                                              decoration: blueboxDecoration,
                                              child: // Frame 34242
                                                  Text("ACCEPT ",
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
                                          )),
                                    ],
                                  )
                                : response!.data!.orderStatus == "ONGOING"
                                    ? GestureDetector(
                                        onTap: () async {
                                          await dineInOrderViewModel
                                              .changeOrderStatusViewModel(
                                                  orderId: response!
                                                      .data!.bookingId
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
                                                  BorderRadius.circular(10.r),
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
                                                  textAlign: TextAlign.center),
                                        ),
                                      )
                                    : SizedBox()
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ));
  }

  selectCancellation({required BuildContext context, required String orderId}) {
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
          onOfferModel.add(OfferModel("Low on Staff"));
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
                                  await dineInOrderViewModel
                                      .rejectOrderStatusViewModel(
                                          orderId: orderId,
                                          rejectReason: selectOffer)
                                      .then((value) async {
                                    if (dineInOrderViewModel
                                            .rejectOrderStatusApiResponse
                                            .status ==
                                        Status.COMPLETE) {
                                      CommonResponseModel res =
                                          dineInOrderViewModel
                                              .rejectOrderStatusApiResponse
                                              .data;
                                      if (res.status == true) {
                                        Get.back();
                                        await dineInOrderViewModel
                                            .bookingOrderCountViewModel();

                                        bottomViewModel.currentIndex = 1;
                                        Get.off(() =>
                                            const LatestBottomNavigationScreen());
                                      } else {
                                        snackBar(title: res.message);
                                      }
                                    }
                                  });
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
