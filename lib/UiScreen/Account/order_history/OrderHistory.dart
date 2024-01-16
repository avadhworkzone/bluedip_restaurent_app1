import 'package:bluedip_restaurent/UiScreen/Account/order_history/OrderHistoryDetail.dart';
import 'package:bluedip_restaurent/UiScreen/Account/order_history/OrderHistoryDineInDetail.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/Widget/search_bar.dart';
import 'package:bluedip_restaurent/modal/apiModel/request_model/dine_in_history_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/request_model/tack_order_history_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/dine_in_booking_list_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/tackaway_history_order_list.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Styles/my_colors.dart';
import '../../../Styles/my_font.dart';
import '../../../Styles/my_icons.dart';
import '../../../Styles/my_strings.dart';
import '../../../Widget/common_blue_border_button.dart';
import '../../../viewModel/order_history_view_model.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  DateTime? from_date;
  int activeTabIndex = 0;

  ///= DateTime(2016, 10, 26);
  DateTime? to_date;

  /// = DateTime(2018, 06, 28);

  bool all_day = false;
  bool time_limit = false;
  bool dine_in = false;
  String? formattedDateFrom;
  String? formattedDateTo;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  OrderHistoryViewModel orderHistoryViewModel = Get.find();
  DineInOrderHistoryListReqModel dReqModel = DineInOrderHistoryListReqModel();
  DFilter dFilter = DFilter();
  TackAwayOrderHistoryListReqModel reqModel =
      TackAwayOrderHistoryListReqModel();
  Filter filter = Filter();

  TackAwayOrderHistoryListResModel? orderHistoryRes;
  DineInBookingListResModel? dBookingRes;
  tackOrderHistoryListApiCall(
      {required String status,
      String? from,
      String? to,
      required String action}) async {
    reqModel.action = action;
    reqModel.status = status;
    reqModel.keyword = "";
    await orderHistoryViewModel.tOrderHistoryViewModel(body: reqModel);
  }

  dineOrderHistoryListApiCall(
      {required String status,
      String? from,
      String? to,
      required String action}) async {
    dReqModel.action = action;
    dReqModel.status = status;
    dReqModel.keyword = "";
    await orderHistoryViewModel
        .dOrderHistoryViewModel(body: dReqModel)
        .then((value) {
      dBookingRes = orderHistoryViewModel.dOrderHistoryApiResponse.data;
    });
  }

  @override
  void initState() {
    tackOrderHistoryListApiCall(
        status: "", action: "takeaway_history_order_list");
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

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: bg_f3f5f9,
          body: Container(
            color: bg_f3f5f9,
            child: Column(
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
                        width: 10.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Order History",
                          style: TextStyle(
                              fontFamily: fontJosefinSansBold,
                              color: black_354356,
                              fontSize: 20.sp),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          selectFilter(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 8.h),
                          child: SvgPicture.asset(icon_filter),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  // margin: EdgeInsets.only(left: 32.w,right: 0.w),
                  height: 35.h,
                  color: bg_f3f5f9,
                  width: double.infinity,
                  child: TabBar(
                    onTap: (val) async {
                      activeTabIndex = val;
                      if (activeTabIndex == 0) {
                        all_day = false;
                        time_limit = false;
                        to_date = null;
                        from_date = null;
                        tackOrderHistoryListApiCall(
                            status: "", action: "takeaway_history_order_list");

                        setState(() {});
                      } else {
                        all_day = false;
                        time_limit = false;
                        to_date = null;
                        from_date = null;
                        dineOrderHistoryListApiCall(
                            status: "", action: "dine_in_history_booking_list");
                        setState(() {});
                      }
                    },
                    padding: EdgeInsets.only(left: 16.w, right: 16.w),
                    labelPadding: EdgeInsets.zero,
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: grey_969da8,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Blue_5468ff),
                    tabs: [
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: const Text("Takeaway"),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: const Text("Dine-in"),
                        ),
                      ),

                      // Tab(
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 14.w),
                      //     child: const Text("Offline Takeaway"),
                      //   ),
                      // ),
                    ],
                    // indicatorWeight: 10,
                    labelStyle: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: fontMavenProMedium), //For Selected tab
                    unselectedLabelStyle: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: fontMavenProMedium), //For Un-selected Tabs
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  flex: 1,
                  child: GetBuilder<OrderHistoryViewModel>(
                    builder: (controller) {
                      if (controller.tOrderHistoryApiResponse.status ==
                              Status.LOADING ||
                          controller.dOrderHistoryApiResponse.status ==
                              Status.LOADING) {
                        return const CircularIndicator();
                      }
                      if (controller.tOrderHistoryApiResponse.status ==
                              Status.ERROR ||
                          controller.dOrderHistoryApiResponse.status ==
                              Status.ERROR) {
                        return const ServerError();
                      }
                      if (controller.tOrderHistoryApiResponse.status ==
                          Status.COMPLETE) {
                        orderHistoryRes =
                            controller.tOrderHistoryApiResponse.data;
                      }
                      if (controller.dOrderHistoryApiResponse.status ==
                          Status.COMPLETE) {
                        dBookingRes = controller.dOrderHistoryApiResponse.data;
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /*search bar*/
                                  SearchBarWidget(
                                    hintText: strSearch,
                                    onSubmitted: (String) {},
                                    onChanged: (val) async {
                                      if (activeTabIndex == 0) {
                                        reqModel.action =
                                            "takeaway_history_order_list";
                                        reqModel.status = "";
                                        reqModel.keyword = val;
                                        await orderHistoryViewModel
                                            .tOrderHistoryViewModel(
                                                body: reqModel);
                                      } else {
                                        dReqModel.action =
                                            "dine_in_history_booking_list";
                                        dReqModel.status = "";
                                        dReqModel.keyword = val;
                                        await orderHistoryViewModel
                                            .dOrderHistoryViewModel(
                                                body: dReqModel);
                                      }
                                    },
                                  ),

                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  from_date == null &&
                                          to_date == null &&
                                          all_day == false &&
                                          time_limit == false
                                      ? const SizedBox()
                                      : SizedBox(
                                          height: 44.h,
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Row(
                                                children: [
                                                  from_date == null &&
                                                          to_date == null
                                                      ? const SizedBox()
                                                      : Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.r),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.r),
                                                              color:
                                                                  Colors.white),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              SvgPicture.asset(
                                                                  icon_calender_date_event),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              // Sep 29, 2021 - Sep 31, 2021
                                                              Text(
                                                                  "$formattedDateFrom - $formattedDateTo",
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
                                                                      fontSize: 12
                                                                          .sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  if (activeTabIndex ==
                                                                      0) {
                                                                    reqModel.action =
                                                                        "takeaway_history_order_list";
                                                                    reqModel
                                                                        .status = all_day ==
                                                                            true
                                                                        ? "COMPLETED"
                                                                        : "CANCELLED";
                                                                    to_date =
                                                                        null;
                                                                    from_date =
                                                                        null;
                                                                    await orderHistoryViewModel
                                                                        .tOrderHistoryViewModel(
                                                                            body:
                                                                                reqModel);
                                                                  } else {
                                                                    dReqModel
                                                                            .action =
                                                                        "dine_in_history_booking_list";
                                                                    dReqModel
                                                                        .status = all_day ==
                                                                            true
                                                                        ? "COMPLETED"
                                                                        : "CANCELLED";
                                                                    to_date =
                                                                        null;
                                                                    from_date =
                                                                        null;
                                                                    await orderHistoryViewModel
                                                                        .dOrderHistoryViewModel(
                                                                            body:
                                                                                dReqModel);
                                                                  }
                                                                },
                                                                child: SvgPicture
                                                                    .asset(
                                                                        icon_cancel_with_circle),
                                                              ),
                                                            ],
                                                          )),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  all_day == false &&
                                                          time_limit == false
                                                      ? SizedBox()
                                                      : Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  11.r),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.r),
                                                              color:
                                                                  Colors.white),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              // Sep 29, 2021 - Sep 31, 2021
                                                              Text(
                                                                  all_day ==
                                                                          true
                                                                      ? "COMPLETED"
                                                                      : "CANCELLED",
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
                                                                      fontSize: 12
                                                                          .sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  if (activeTabIndex ==
                                                                      0) {
                                                                    reqModel.action =
                                                                        "takeaway_history_order_list";
                                                                    reqModel.status =
                                                                        "";
                                                                    if (to_date !=
                                                                            null &&
                                                                        from_date !=
                                                                            null) {
                                                                      filter.from =
                                                                          "${from_date!.year}-${from_date!.month}-${from_date!.day}";
                                                                      filter.to =
                                                                          "${to_date!.year}-${to_date!.month}-${to_date!.day}";
                                                                      reqModel.filter =
                                                                          filter;
                                                                    }
                                                                    all_day =
                                                                        false;
                                                                    time_limit =
                                                                        false;
                                                                    await orderHistoryViewModel
                                                                        .tOrderHistoryViewModel(
                                                                            body:
                                                                                reqModel);
                                                                  } else {
                                                                    dReqModel
                                                                            .action =
                                                                        "dine_in_history_booking_list";
                                                                    dReqModel
                                                                        .status = "";
                                                                    if (to_date !=
                                                                            null &&
                                                                        from_date !=
                                                                            null) {
                                                                      dFilter.from =
                                                                          "${from_date!.year}-${from_date!.month}-${from_date!.day}";
                                                                      dFilter.to =
                                                                          "${to_date!.year}-${to_date!.month}-${to_date!.day}";
                                                                      dReqModel
                                                                              .filter =
                                                                          dFilter;
                                                                    }
                                                                    all_day =
                                                                        false;
                                                                    time_limit =
                                                                        false;
                                                                    await orderHistoryViewModel
                                                                        .dOrderHistoryViewModel(
                                                                            body:
                                                                                dReqModel);
                                                                  }
                                                                },
                                                                child: SvgPicture
                                                                    .asset(
                                                                        icon_cancel_with_circle),
                                                              ),
                                                            ],
                                                          ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                  SizedBox(
                                    height: 16.h,
                                  ),

                                  /// tack away
                                  if (activeTabIndex == 0)
                                    orderHistoryRes == null ||
                                            orderHistoryRes!.data!.isEmpty
                                        ? EmptyView()
                                        : ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            primary: false,
                                            shrinkWrap: true,
                                            itemCount:
                                                orderHistoryRes!.data!.length,
                                            itemBuilder: (context, i) {
                                              final data =
                                                  orderHistoryRes!.data![i];

                                              return GestureDetector(
                                                onTap: () {
                                                  // if (i == 0) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            OrderHistoryDetailScreen(
                                                                orderId: data
                                                                    .orderId
                                                                    .toString()),
                                                      ));
                                                  // }
                                                  // else if (i == 1) {
                                                  //   Navigator.push(
                                                  //       context,
                                                  //       MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             OrderHistoryTakeawayDetailCancelled(),
                                                  //       ));
                                                  // }
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 16.h),
                                                  child: Container(
                                                    decoration: boxDecoration,
                                                    padding:
                                                        EdgeInsets.all(14.r),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                // Order ID #123113
                                                                Text(
                                                                    "Order ID #${data.orderId}",
                                                                    style: TextStyle(
                                                                        color:
                                                                            black_354356,
                                                                        fontFamily:
                                                                            fontMavenProProSemiBold,
                                                                        fontSize: 15
                                                                            .sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),

                                                                SizedBox(
                                                                  height: 4.h,
                                                                ),
                                                                // Pickup at: 9:00 PM
                                                                RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                      TextSpan(
                                                                          style: TextStyle(
                                                                              color: light_black_5f6d7b,
                                                                              fontFamily: fontMavenProRegular,
                                                                              fontSize: 14.sp),
                                                                          text: "Pickup at: "),
                                                                      TextSpan(
                                                                          style: TextStyle(
                                                                              color: Blue_5468ff,
                                                                              fontFamily: fontMavenProMedium,
                                                                              fontSize: 14.sp),
                                                                          text: data.time)
                                                                    ])),
                                                              ],
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(4
                                                                              .r),
                                                                  color: data.orderStatus ==
                                                                          "PICKED_UP"
                                                                      ? green_5cb85c
                                                                      : red_d9534f),
                                                              child: // Completed
                                                                  Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal: 10
                                                                            .w,
                                                                        vertical:
                                                                            5),
                                                                child: Text(
                                                                    data.orderStatus == "PICKED_UP"
                                                                        ? "Completed"
                                                                        : "Cancelled",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            fontMavenProMedium,
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize: 12
                                                                            .sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 14.h,
                                                        ),
                                                        const DottedLine(
                                                          direction:
                                                              Axis.horizontal,
                                                          lineLength:
                                                              double.infinity,
                                                          lineThickness: 1.0,
                                                          dashLength: 4.0,
                                                          dashColor:
                                                              divider_d4dce7,
                                                          dashRadius: 0.0,
                                                          dashGapLength: 4.0,
                                                          dashGapColor: Colors
                                                              .transparent,
                                                          dashGapRadius: 0.0,
                                                        ),
                                                        SizedBox(
                                                          height: 14.h,
                                                        ),
                                                        activeTabIndex == 0
                                                            ? Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        // John doe
                                                                        Text(
                                                                            data.userFullName ??
                                                                                "",
                                                                            style: TextStyle(
                                                                                color: black_354356,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontFamily: fontMavenProProSemiBold,
                                                                                fontSize: 15.sp),
                                                                            textAlign: TextAlign.left),
                                                                        SizedBox(
                                                                          height:
                                                                              8.h,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 6.w),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: const Color(0xffedf0ff)),
                                                                              child: Row(
                                                                                children: [
                                                                                  SvgPicture.asset(icon_room_buffet_dinner),
                                                                                  SizedBox(
                                                                                    width: 4.w,
                                                                                  ),
                                                                                  Text(data.dishes.toString(), style: TextStyle(color: black_354356, fontWeight: FontWeight.w600, fontFamily: fontMavenProProSemiBold, fontSize: 14.sp), textAlign: TextAlign.right)
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 6.w,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 6.w),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: const Color(0xffedf0ff)),
                                                                              child: Row(
                                                                                children: [
                                                                                  SvgPicture.asset(icon_champayne_glass),
                                                                                  SizedBox(
                                                                                    width: 4.w,
                                                                                  ),
                                                                                  Text(data.coldDrinks.toString(), style: TextStyle(color: black_354356, fontWeight: FontWeight.w600, fontFamily: fontMavenProProSemiBold, fontSize: 14.sp), textAlign: TextAlign.right)
                                                                                ],
                                                                              ),
                                                                            )
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  // Paid
                                                                  data.paymentData!
                                                                              .paymentStatus ==
                                                                          null
                                                                      ? SizedBox()
                                                                      : Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 6.w,
                                                                              vertical: 2.h),
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(4.r),
                                                                              color: const Color(0x215cb85c)),
                                                                          child: Text(
                                                                              data.paymentData!.paymentStatus!,
                                                                              style: TextStyle(color: green_5cb85c, fontFamily: fontMavenProMedium, fontStyle: FontStyle.normal, fontSize: 14.sp),
                                                                              textAlign: TextAlign.right),
                                                                        ),

                                                                  SizedBox(
                                                                    width: 8.w,
                                                                  ),

                                                                  data.paymentData!
                                                                              .netPayable ==
                                                                          null
                                                                      ? const SizedBox()
                                                                      : Row(
                                                                          children: [
                                                                            Image.asset(
                                                                              icon_rupee_slim,
                                                                              width: 10.w,
                                                                              height: 10.h,
                                                                            ),
                                                                            Text(data.paymentData!.netPayable.toString(),
                                                                                style: TextStyle(color: black_354356, fontFamily: fontMavenProProSemiBold, fontSize: 14.sp),
                                                                                textAlign: TextAlign.left),
                                                                          ],
                                                                        )
                                                                ],
                                                              )
                                                            : SizedBox()
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),

                                  /// dine in
                                  if (activeTabIndex == 1)
                                    dBookingRes == null ||
                                            dBookingRes!.data!.isEmpty
                                        ? EmptyView()
                                        : ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            primary: false,
                                            shrinkWrap: true,
                                            itemCount:
                                                dBookingRes!.data!.length,
                                            itemBuilder: (context, i) {
                                              final data =
                                                  dBookingRes!.data![i];

                                              return GestureDetector(
                                                onTap: () {
                                                  Get.to(() =>
                                                      OrderHistoryDineInDetail(
                                                        orderId: data.bookingId
                                                            .toString(),
                                                      ));
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 16.h),
                                                  child: Container(
                                                    decoration: boxDecoration,
                                                    padding:
                                                        EdgeInsets.all(14.r),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                // Order ID #123113
                                                                Text(
                                                                    "Booking ID #${data.bookingId}",
                                                                    style: TextStyle(
                                                                        color:
                                                                            black_354356,
                                                                        fontFamily:
                                                                            fontMavenProProSemiBold,
                                                                        fontSize: 15
                                                                            .sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),

                                                                SizedBox(
                                                                  height: 4.h,
                                                                ),
                                                                // Pickup at: 9:00 PM
                                                                RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                      TextSpan(
                                                                          style: TextStyle(
                                                                              color: light_black_5f6d7b,
                                                                              fontFamily: fontMavenProRegular,
                                                                              fontSize: 14.sp),
                                                                          text: "Booking for: "),
                                                                      TextSpan(
                                                                          style: TextStyle(
                                                                              color: Blue_5468ff,
                                                                              fontFamily: fontMavenProMedium,
                                                                              fontSize: 14.sp),
                                                                          text: data.bookingTime)
                                                                    ])),
                                                              ],
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(4
                                                                              .r),
                                                                  color: data.orderStatus ==
                                                                              "CANCEL_BOOKING" ||
                                                                          data.orderStatus ==
                                                                              "REJECT"
                                                                      ? red_d9534f
                                                                      : green_5cb85c),
                                                              child: // Completed
                                                                  Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal: 10
                                                                            .w,
                                                                        vertical:
                                                                            5),
                                                                child: Text(
                                                                    data.orderStatus ==
                                                                                "CANCEL_BOOKING" ||
                                                                            data.orderStatus ==
                                                                                "REJECT"
                                                                        ? "Cancelled"
                                                                        : "Completed",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            fontMavenProMedium,
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize: 12
                                                                            .sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 14.h,
                                                        ),
                                                        const DottedLine(
                                                          direction:
                                                              Axis.horizontal,
                                                          lineLength:
                                                              double.infinity,
                                                          lineThickness: 1.0,
                                                          dashLength: 4.0,
                                                          dashColor:
                                                              divider_d4dce7,
                                                          dashRadius: 0.0,
                                                          dashGapLength: 4.0,
                                                          dashGapColor: Colors
                                                              .transparent,
                                                          dashGapRadius: 0.0,
                                                        ),
                                                        SizedBox(
                                                          height: 14.h,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
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
                                                                  Text("Name",
                                                                      style: TextStyle(
                                                                          color:
                                                                              grey_969da8,
                                                                          fontFamily:
                                                                              fontMavenProMedium,
                                                                          fontStyle: FontStyle
                                                                              .normal,
                                                                          fontSize: 14
                                                                              .sp),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left),
                                                                  SizedBox(
                                                                    height: 3.h,
                                                                  ),
                                                                  // Jenny
                                                                  Container(
                                                                    width: 80.w,
                                                                    child: Text(
                                                                        data.userFullName ??
                                                                            "",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              black_354356,
                                                                          fontFamily:
                                                                              fontMavenProProSemiBold,
                                                                          fontSize:
                                                                              15.sp,
                                                                        ),
                                                                        overflow:
                                                                            TextOverflow
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
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text("Guest",
                                                                      style: TextStyle(
                                                                          color:
                                                                              grey_969da8,
                                                                          fontFamily:
                                                                              fontMavenProMedium,
                                                                          fontStyle: FontStyle
                                                                              .normal,
                                                                          fontSize: 14
                                                                              .sp),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left),
                                                                  SizedBox(
                                                                    height: 3.h,
                                                                  ),
                                                                  // Jenny
                                                                  data.noOfGuest ==
                                                                          null
                                                                      ? SizedBox()
                                                                      : Text(
                                                                          data.noOfGuest
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              color: black_354356,
                                                                              fontFamily: fontMavenProProSemiBold,
                                                                              fontSize: 15.sp),
                                                                          textAlign: TextAlign.left)
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })
                                  /*order list item*/
                                ],
                              ),
                            )),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column EmptyView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 60.h,
        ),
        Center(
          child: Image.asset(
            img_no_orders,
            width: 300.w,
            height: 236.h,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text("No Orders",
            style: TextStyle(
                color: black_354356,
                fontWeight: FontWeight.w700,
                fontFamily: fontJosefinSansBold,
                fontStyle: FontStyle.normal,
                fontSize: 18.sp),
            textAlign: TextAlign.center),
        SizedBox(
          height: 4.h,
        ),
        // Create your first offer and start earning.
        Text("Completed orders and booking \nwill show here.",
            style: TextStyle(
                color: grey_5f6d7b,
                fontWeight: FontWeight.w500,
                fontFamily: fontMavenProMedium,
                fontStyle: FontStyle.normal,
                fontSize: 14.sp),
            textAlign: TextAlign.center)
      ],
    );
  }

  void selectFilter(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return StatefulBuilder(
            builder: (context, update) {
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Daily Opportunities
                                // Title
                                Center(
                                  child: Text("Filter Order History",
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontMavenProBold,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.sp),
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

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 20.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Status Type",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily:
                                                  fontMavenProProSemiBold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              update(() {
                                                all_day = true;
                                                time_limit = false;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(all_day
                                                    ? icon_selected_radio
                                                    : icon_unselected_radio),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                // All day
                                                Text("Completed",
                                                    style: TextStyle(
                                                        color: black_354356,
                                                        fontFamily:
                                                            fontMavenProMedium,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14.sp),
                                                    textAlign: TextAlign.left)
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50.w,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              update(() {
                                                all_day = false;
                                                time_limit = true;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(time_limit
                                                    ? icon_selected_radio
                                                    : icon_unselected_radio),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                // All day
                                                Text("Cancelled",
                                                    style: TextStyle(
                                                        color: black_354356,
                                                        fontFamily:
                                                            fontMavenProMedium,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14.sp),
                                                    textAlign: TextAlign.left)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      // Title
                                      Text("Date filter",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily:
                                                  fontMavenProProSemiBold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        height: 6.h,
                                      ),

                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: GestureDetector(
                                              onTap: () => _showDialog(
                                                CupertinoDatePicker(
                                                  initialDateTime: from_date,
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                  use24hFormat: false,
                                                  // This is called when the user changes the time.
                                                  onDateTimeChanged:
                                                      (DateTime newTime) {
                                                    update(() =>
                                                        from_date = newTime);
                                                  },
                                                ),
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 14.w,
                                                    vertical: 8.h),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.r),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: grey_d9dde3),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        icon_calender_date_event),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // From
                                                        Text("From",
                                                            style: TextStyle(
                                                                color:
                                                                    grey_969da8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    fontMavenProRegular,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize:
                                                                    12.sp),
                                                            textAlign:
                                                                TextAlign.left),
                                                        SizedBox(
                                                          height: 3.h,
                                                        ),
                                                        // Select
                                                        Text(
                                                            from_date == null
                                                                ? "Select"
                                                                : "${from_date!.year}-${from_date!.month}-${from_date!.day}",
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
                                                                    14.sp),
                                                            textAlign:
                                                                TextAlign.left)
                                                      ],
                                                    )
                                                  ],
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
                                              onTap: () => _showDialog(
                                                CupertinoDatePicker(
                                                  initialDateTime: to_date,
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                  use24hFormat: false,
                                                  // This is called when the user changes the time.
                                                  onDateTimeChanged:
                                                      (DateTime newTime) {
                                                    update(() =>
                                                        to_date = newTime);
                                                  },
                                                ),
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 14.w,
                                                    vertical: 8.h),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.r),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: grey_d9dde3),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        icon_calender_date_event),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // From
                                                        Text("To",
                                                            style: TextStyle(
                                                                color:
                                                                    grey_969da8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    fontMavenProRegular,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize:
                                                                    12.sp),
                                                            textAlign:
                                                                TextAlign.left),
                                                        SizedBox(
                                                          height: 3.h,
                                                        ),
                                                        // Select
                                                        Text(
                                                            to_date == null
                                                                ? "Select"
                                                                : "${to_date!.year}-${to_date!.month}-${to_date!.day}",
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
                                                                    14.sp),
                                                            textAlign:
                                                                TextAlign.left)
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CommonBlueBorderButton(
                                  strCancel.toUpperCase(), () {
                                update(() async {
                                  all_day = false;
                                  time_limit = false;
                                  to_date = null;
                                  from_date = null;
                                  if (activeTabIndex == 0) {
                                    await tackOrderHistoryListApiCall(
                                        status: "",
                                        action: "takeaway_history_order_list");
                                  } else {
                                    await dineOrderHistoryListApiCall(
                                        status: "",
                                        action: "dine_in_history_booking_list");
                                  }
                                  Navigator.pop(context, false);
                                });
                              }, Colors.white, Colors.white, Blue_5468ff),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: CommonBlueBorderButton(
                                  "Apply".toUpperCase(), () async {
                                if (activeTabIndex == 0) {
                                  reqModel.action =
                                      "takeaway_history_order_list";
                                  reqModel.status = all_day == true
                                      ? "COMPLETED"
                                      : "CANCELLED";
                                  if (to_date != null && from_date != null) {
                                    filter.from =
                                        "${from_date!.year}-${from_date!.month}-${from_date!.day}";
                                    filter.to =
                                        "${to_date!.year}-${to_date!.month}-${to_date!.day}";
                                    reqModel.filter = filter;
                                  }
                                  await orderHistoryViewModel
                                      .tOrderHistoryViewModel(body: reqModel)
                                      .then((value) {
                                    /// from date
                                    if (to_date != null && from_date != null) {
                                      final String dateStr =
                                          "${from_date!.year}-${from_date!.month}-${from_date!.day}";
                                      List<String> dateParts =
                                          dateStr.split('-');
                                      int year = int.parse(dateParts[0]);
                                      int month = int.parse(dateParts[1]);
                                      int day = int.parse(dateParts[2]);
                                      DateTime dateTime =
                                          DateTime(year, month, day);
                                      formattedDateFrom =
                                          DateFormat.yMMMd().format(dateTime);

                                      /// to date
                                      final String dateToStr =
                                          "${to_date!.year}-${to_date!.month}-${to_date!.day}";
                                      List<String> dateTOParts =
                                          dateToStr.split('-');
                                      int toYear = int.parse(dateTOParts[0]);
                                      int toMonth = int.parse(dateTOParts[1]);
                                      int toDay = int.parse(dateTOParts[2]);
                                      DateTime dateTimeTO =
                                          DateTime(toYear, toMonth, toDay);
                                      formattedDateTo =
                                          DateFormat.yMMMd().format(dateTimeTO);
                                    }
                                    Get.back();
                                  });
                                } else {
                                  dReqModel.action =
                                      "dine_in_history_booking_list";
                                  dReqModel.status = all_day == true
                                      ? "COMPLETED"
                                      : "CANCELLED";
                                  if (to_date != null && from_date != null) {
                                    dFilter.from =
                                        "${from_date!.year}-${from_date!.month}-${from_date!.day}";
                                    dFilter.to =
                                        "${to_date!.year}-${to_date!.month}-${to_date!.day}";
                                    dReqModel.filter = dFilter;
                                  }
                                  await orderHistoryViewModel
                                      .dOrderHistoryViewModel(body: dReqModel)
                                      .then((value) {
                                    /// from date
                                    if (to_date != null && from_date != null) {
                                      final String dateStr =
                                          "${from_date!.year}-${from_date!.month}-${from_date!.day}";
                                      List<String> dateParts =
                                          dateStr.split('-');
                                      int year = int.parse(dateParts[0]);
                                      int month = int.parse(dateParts[1]);
                                      int day = int.parse(dateParts[2]);
                                      DateTime dateTime =
                                          DateTime(year, month, day);
                                      formattedDateFrom =
                                          DateFormat.yMMMd().format(dateTime);

                                      /// to date
                                      final String dateToStr =
                                          "${to_date!.year}-${to_date!.month}-${to_date!.day}";
                                      List<String> dateTOParts =
                                          dateToStr.split('-');
                                      int toYear = int.parse(dateTOParts[0]);
                                      int toMonth = int.parse(dateTOParts[1]);
                                      int toDay = int.parse(dateTOParts[2]);
                                      DateTime dateTimeTO =
                                          DateTime(toYear, toMonth, toDay);
                                      formattedDateTo =
                                          DateFormat.yMMMd().format(dateTimeTO);
                                    }
                                    Get.back();
                                    setState(() {});
                                  });
                                }
                              }, Colors.white, Colors.white, Blue_5468ff),
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
