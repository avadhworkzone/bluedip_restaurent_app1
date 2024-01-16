import 'dart:async';

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/common_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_booking_order_list.dart';
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

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_icons.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/search_bar.dart';
import 'DineInBookingDetail.dart';
import 'dineIn_empty_data_view.dart';

class DineInIncomingTab extends StatefulWidget {
  const DineInIncomingTab({Key? key}) : super(key: key);

  @override
  State<DineInIncomingTab> createState() => _DineInIncomingTabState();
}

class _DineInIncomingTabState extends State<DineInIncomingTab> {
  DineInOrderViewModel dineInOrderViewModel = Get.find();
  bool isReasonLayout = false;
  String selectOffer = '';
  BottomViewModel bottomViewModel = Get.find();

  getIncomingOrderList() async {
    await dineInOrderViewModel.getBookingOrderListViewModel(
        orderStatus: "INCOMING");
  }

  GetBookingOrderListResModel? response;

  @override
  void initState() {
    getIncomingOrderList();
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
                                  orderStatus: "INCOMING", keyWord: val);
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
                                              Text(
                                                  "Booking ID #${data.bookingId.toString()}",
                                                  style: TextStyle(
                                                      color: black_354356,
                                                      fontFamily:
                                                          fontMavenProProSemiBold,
                                                      fontSize: 15.sp),
                                                  textAlign: TextAlign.left),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff00d9cd),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.r),
                                                ),
                                                child: // New
                                                    Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 4),
                                                  child: Text("New",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              fontMavenProMedium,
                                                          fontSize: 12.sp),
                                                      textAlign:
                                                          TextAlign.right),
                                                ),
                                              ),
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
                                            height: 20.h,
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
                                                          onTap: () {
                                                            selectCancellation(
                                                                context:
                                                                    context,
                                                                orderId: data
                                                                    .bookingId
                                                                    .toString());
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    13.r),
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
                                                    Expanded(
                                                        flex: 2,
                                                        child: InkWell(
                                                          onTap: () async {
                                                            await dineInOrderViewModel
                                                                .changeOrderStatusViewModel(
                                                                    orderId: data
                                                                        .bookingId
                                                                        .toString(),
                                                                    orderStatus:
                                                                        "ACCEPT");
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
                                                                Text("ACCEPT ",
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
                                            .getBookingOrderListViewModel(
                                                orderStatus: "INCOMING");
                                        await dineInOrderViewModel
                                            .bookingOrderCountViewModel();
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
