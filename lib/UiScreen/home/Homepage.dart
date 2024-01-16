import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/UiScreen/Offers/DeleteDeal.dart';
import 'package:bluedip_restaurent/UiScreen/Offers/EditOneTimeDeal.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_offer_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/offer_view_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';
import '../../Styles/my_font.dart';
import '../../Widget/box_shadow_ticket.dart';
import '../../Widget/box_shadow_ticket_second.dart';
import '../bottomsheets/BottomSheetDailyOpportunities.dart';
import 'NotificationScreen.dart';

class Homepage extends StatefulWidget {
  Homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

var current = DateTime.now();
DateTime startDate = current.subtract(Duration(days: 14));
DateTime endDate = current.add(Duration(days: 7));

class _HomepageState extends State<Homepage> {
  DatePickerController _datePickerController = DatePickerController();
  ManageOfferViewModel manageOfferViewModel = Get.find();
  bool statusHomeNoti = false;
  String? selectedWeekDay;
  String? selectedDate;
  GetOfferResModel? getOfferResponse;
  ScrollController? scrollController;
  bool isFirstTime = false;
  DateTime? selectDateVal;

  @override
  void initState() {
    super.initState();
    initData();
    statusHomeNoti;
  }

  getOfferApiCall() async {
    selectedDate = "${current.year}-${current.month}-${current.day}";
    selectedWeekDay = current.weekday == 1
        ? "Monday"
        : current.weekday == 2
            ? "Tuesday"
            : current.weekday == 3
                ? "Wednesday"
                : current.weekday == 4
                    ? "Thursday"
                    : current.weekday == 5
                        ? "Friday"
                        : current.weekday == 6
                            ? "Saturday"
                            : "Sunday";
    await manageOfferViewModel.getOfferViewModel(
        date: selectedDate!,
        day: selectedWeekDay!,
        page: manageOfferViewModel.pageNumber,
        limit: 5);
  }

  selectDateApiCall() async {
    selectedDate =
        "${selectDateVal!.year}-${selectDateVal!.month}-${selectDateVal!.day}";

    selectedWeekDay = selectDateVal!.weekday == 1
        ? "Monday"
        : selectDateVal!.weekday == 2
            ? "Tuesday"
            : selectDateVal!.weekday == 3
                ? "Wednesday"
                : selectDateVal!.weekday == 4
                    ? "Thursday"
                    : selectDateVal!.weekday == 5
                        ? "Friday"
                        : selectDateVal!.weekday == 6
                            ? "Saturday"
                            : "Sunday";
    await manageOfferViewModel.getOfferViewModel(
        date: selectedDate!,
        day: selectedWeekDay!,
        page: manageOfferViewModel.pageNumber,
        limit: 5);
  }

  void _scrollDown() {
    scrollController!.jumpTo(scrollController!.position.maxScrollExtent);
  }

  initScrolling(BuildContext context) {
    scrollController = new ScrollController();

    scrollController!.addListener(() async {
      print("Scrolling");

      if (scrollController!.position.maxScrollExtent ==
          scrollController!.position.pixels) {
        _scrollDown();

        setState(() {});
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          // isPaginationLoading = true;
          manageOfferViewModel.pageNumber = manageOfferViewModel.pageNumber + 1;
          selectDateVal == null ? getOfferApiCall() : selectDateApiCall();
        });
      }
    });
  }

  initData() {
    isFirstTime = true;
    manageOfferViewModel.clearResponse();
    initScrolling(context);
    selectDateVal == null ? getOfferApiCall() : selectDateApiCall();
    setState(() {});
    isFirstTime = false;
  }

  @override
  void dispose() {
    scrollController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: bg_f3f5f9,
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Payment
                          Text("Offers",
                              style: TextStyle(
                                  color: black_354356,
                                  fontFamily: fontJosefinSansBold,
                                  fontSize: 20.sp),
                              textAlign: TextAlign.left),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NotificationScreen(),
                                  ));
                            },
                            child: SvgPicture.asset(
                              icon_notification,
                              width: 24.w,
                              height: 24.h,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: divider_d4dce7,
                    ),
                  ],
                ),
              ),
            ];
          },
          body: GetBuilder<ManageOfferViewModel>(
            builder: (controller) {
              if (controller.getOfferApiResponse.status == Status.LOADING) {
                return const CircularIndicator();
              }
              if (controller.getOfferApiResponse.status == Status.ERROR) {
                return const ServerError();
              }
              // if (controller.getOfferApiResponse.status == Status.COMPLETE) {
              getOfferResponse = controller.getOfferApiResponse.data;
              // }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10.h),
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
                            bottomLeft: Radius.circular(25.r),
                            bottomRight: Radius.circular(25.r))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Sep 2022
                              Text("Sep 2022",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProBold,
                                      fontSize: 16.sp),
                                  textAlign: TextAlign.left),
                              // SvgPicture.asset(icon_down_arrow,width: 18.w,height: 18.h,)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        SizedBox(
                          height: 90.h,
                          child: Container(
                            // width: 52.w,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          // SelectdaydateList == i
                                          //     ? Color(0x8c4988f9)
                                          //     :
                                          Colors.white,
                                      offset: Offset(0, 2.5),
                                      blurRadius: 6,
                                      spreadRadius: 0)
                                ],
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment(0.8, 1),
                                    colors: [Colors.white, Colors.white])),
                            child: HorizontalDatePickerWidget(
                              startDate: startDate,
                              endDate: endDate,
                              selectedColor: Color(0xff73a5ff),
                              // disabledColor: black_354356,
                              // disabledTextColor: black_354356,
                              selectedDate: current,
                              normalTextColor: black_354356,
                              widgetWidth: Get.width,
                              onValueSelected: (date) async {
                                // setState(() {

                                selectDateVal = date;
                                current = date;
                                // manageOfferViewModel.pageNumber = 1;
                                initData();

                                // });

                                // selectDateApiCall(date: date);
                                // selectedDate =
                                //     "${date.year}-${date.month}-${date.day}";
                                //
                                // selectedWeekDay = date.weekday == 1
                                //     ? "Monday"
                                //     : date.weekday == 2
                                //         ? "Tuesday"
                                //         : date.weekday == 3
                                //             ? "Wednesday"
                                //             : date.weekday == 4
                                //                 ? "Thursday"
                                //                 : date.weekday == 5
                                //                     ? "Friday"
                                //                     : date.weekday == 6
                                //                         ? "Saturday"
                                //                         : "Sunday";
                                // await manageOfferViewModel.getOfferViewModel(
                                //     date: selectedDate!,
                                //     day: selectedWeekDay!,
                                //     page: manageOfferViewModel.pageNumber,
                                //     limit: 5);
                              },
                              datePickerController: _datePickerController,
                            ),
                          ),
                          // child: ListView.separated(
                          //     scrollDirection: Axis.horizontal,
                          //     primary: false,
                          //     shrinkWrap: true,
                          //     padding: EdgeInsets.symmetric(
                          //       horizontal: 16.w,
                          //     ),
                          //     separatorBuilder: (BuildContext context, int index) =>
                          //         SizedBox(
                          //           width: 5.w,
                          //         ),
                          //     itemCount: daydatefferList.length,
                          //     itemBuilder: (context, i) => GestureDetector(
                          //           onTap: () {
                          //             setState(() {
                          //               SelectdaydateList = i;
                          //             });
                          //           },
                          //           child: Container(
                          //             width: 52.w,
                          //             margin:
                          //                 const EdgeInsets.symmetric(vertical: 8),
                          //             decoration: BoxDecoration(
                          //                 borderRadius: const BorderRadius.all(
                          //                     Radius.circular(10)),
                          //                 boxShadow: [
                          //                   BoxShadow(
                          //                       color: SelectdaydateList == i
                          //                           ? Color(0x8c4988f9)
                          //                           : Colors.white,
                          //                       offset: Offset(0, 2.5),
                          //                       blurRadius: 6,
                          //                       spreadRadius: 0)
                          //                 ],
                          //                 gradient: LinearGradient(
                          //                     begin: Alignment.topLeft,
                          //                     end: Alignment(0.8, 1),
                          //                     colors: [
                          //                       SelectdaydateList == i
                          //                           ? Color(0xff73a5ff)
                          //                           : Colors.white,
                          //                       SelectdaydateList == i
                          //                           ? Color(0xff1e6af2)
                          //                           : Colors.white
                          //                     ])),
                          //             child: Padding(
                          //               padding:
                          //                   const EdgeInsets.symmetric(vertical: 6),
                          //               child: Column(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.center,
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.center,
                          //                 children: [
                          //                   // Tue
                          //                   Text(daydatefferList[i].Day,
                          //                       style: TextStyle(
                          //                           color: SelectdaydateList == i
                          //                               ? Colors.white
                          //                               : black_354356,
                          //                           fontFamily: fontMavenProMedium,
                          //                           fontStyle: FontStyle.normal,
                          //                           fontSize: 14.sp),
                          //                       textAlign: TextAlign.center),
                          //
                          //                   SizedBox(
                          //                     height: 5.h,
                          //                   ),
                          //                   Text(daydatefferList[i].Date,
                          //                       style: TextStyle(
                          //                           color: SelectdaydateList == i
                          //                               ? Colors.white
                          //                               : grey_969da8,
                          //                           fontFamily: fontMavenProMedium,
                          //                           fontStyle: FontStyle.normal,
                          //                           fontSize: 15.sp),
                          //                       textAlign: TextAlign.center)
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            selectDailyOpportunity(context);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 14.h, horizontal: 16.w),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.8, 1),
                                colors: <Color>[
                                  Color(0xff62DDFF),
                                  Color(0xff0CB9EB),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14.r),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Daily Opportunities
                                      Text("Daily Opportunities",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                  SvgPicture.asset(icon_next_arrow)
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// empty state screen
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => const EmptyStateScreen(),
                        //         ));
                        //   },
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(vertical: 15.h),
                        //     child: Center(
                        //       child: Text("Empty State Screen Click here",
                        //           style: TextStyle(
                        //               color: black_354356,
                        //               fontFamily: fontMavenProBold,
                        //               fontSize: 16.sp),
                        //           textAlign: TextAlign.center),
                        //     ),
                        //   ),
                        // ),

                        /// subscription plan layout
                        // Visibility(
                        //   visible: issubscribeplan,
                        //   child: Container(
                        //     margin: EdgeInsets.symmetric(
                        //         vertical: 4.h, horizontal: 16.w),
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 14.w, vertical: 24.h),
                        //     decoration: boxDecoration,
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 issubscriptionList = true;
                        //                 issubscribeplan = false;
                        //               });
                        //             },
                        //             child: Image.asset(
                        //               icon_rocket_blue_png,
                        //               width: 60.w,
                        //               height: 60.h,
                        //             )),
                        //         SizedBox(
                        //           height: 16.h,
                        //         ),
                        //         // Maximise your profit by 10x
                        //         Text(
                        //             "Please buy subscription plan \nfor active your services.",
                        //             style: TextStyle(
                        //                 color: black_354356,
                        //                 fontFamily: fontJosefinSansBold,
                        //                 fontSize: 20.sp,
                        //                 height: 1.3),
                        //             textAlign: TextAlign.center),
                        //         SizedBox(
                        //           height: 6.h,
                        //         ),
                        //         // With our range of subscription plans, we aim to provide our restaurant partners with the flexibility
                        //         Text(
                        //             "With our range of subscription plans, we aim to provide our restaurant partners with the flexibility and support they need to maximize their revenue potential.",
                        //             style: TextStyle(
                        //                 color: black_354356,
                        //                 fontFamily: fontMavenProRegular,
                        //                 fontStyle: FontStyle.normal,
                        //                 fontSize: 14.sp,
                        //                 height: 1.5),
                        //             textAlign: TextAlign.center),
                        //         SizedBox(
                        //           height: 20.h,
                        //         ),
                        //         Container(
                        //           width: 200,
                        //           child: CommonBlueButton("Subscribe Plan", () {
                        //             setState(() {
                        //               Navigator.push(
                        //                   context,
                        //                   MaterialPageRoute(
                        //                     builder: (context) =>
                        //                         const BuySubscriptionPlan(),
                        //                   ));
                        //             });
                        //           }, blue_3653f6),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        manageOfferViewModel.offerDataList.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 60.h,
                                  ),
                                  Center(
                                    child: Image.asset(
                                      img_no_offers,
                                      width: 300.w,
                                      height: 236.h,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text("No Offers",
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
                                  Text(
                                      "Create your first offer \nand start earning.",
                                      style: TextStyle(
                                          color: grey_5f6d7b,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.center)
                                ],
                              )
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                primary: false,
                                shrinkWrap: true,
                                itemCount:
                                    manageOfferViewModel.offerDataList.length,
                                itemBuilder: (context, i) {
                                  final data =
                                      manageOfferViewModel.offerDataList[i];
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.w, right: 16.w, bottom: 16.w),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: boxDecorationTicket,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 12.w,
                                                right: 12.w,
                                                top: 12.h,
                                                bottom: 5.h),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    // Offer ID #123113
                                                    Row(
                                                      children: [
                                                        Text(
                                                            'Offer ID #${data.randomOfferId}',
                                                            style: TextStyle(
                                                                color:
                                                                    black_354356,
                                                                fontFamily:
                                                                    fontMavenProRegular,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize:
                                                                    14.sp),
                                                            textAlign:
                                                                TextAlign.left),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        // Container(
                                                        //   decoration: BoxDecoration(
                                                        //       borderRadius:
                                                        //           BorderRadius
                                                        //               .circular(4.r),
                                                        //       color:
                                                        //           Color(0xffe7e9ff)),
                                                        //   child: // Live later
                                                        //       Padding(
                                                        //     padding:
                                                        //         EdgeInsets.symmetric(
                                                        //             horizontal: 10.w,
                                                        //             vertical: 2),
                                                        //     child: Text("Live later",
                                                        //         style: TextStyle(
                                                        //             color:
                                                        //                 black_354356,
                                                        //             fontFamily:
                                                        //                 fontMavenProMedium,
                                                        //             fontStyle:
                                                        //                 FontStyle
                                                        //                     .normal,
                                                        //             fontSize: 12.sp),
                                                        //         textAlign:
                                                        //             TextAlign.right),
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),

                                                    SizedBox(
                                                      width: 20,
                                                      child: PopupMenuButton(
                                                        offset: const Offset(
                                                            -10, 15),
                                                        itemBuilder:
                                                            (context) => [
                                                          PopupMenuItem(
                                                            value: 0,
                                                            onTap: () async {
                                                              final navigator =
                                                                  Navigator.of(
                                                                      context);
                                                              await Future
                                                                  .delayed(
                                                                      Duration
                                                                          .zero);
                                                              navigator.push(
                                                                MaterialPageRoute(
                                                                    builder: (_) =>
                                                                        EditOneTimeDeal(
                                                                          offerId: data
                                                                              .offerId!
                                                                              .toString(),
                                                                          offerPersantage:
                                                                              data.offerPercentage,
                                                                          startTime: data
                                                                              .timePeriod!
                                                                              .start,
                                                                          endTime: data
                                                                              .timePeriod!
                                                                              .end,
                                                                          timePeriod:
                                                                              data.timeType,
                                                                          deal:
                                                                              data.totalDeal,
                                                                          day: data
                                                                              .day,
                                                                          offerType:
                                                                              data.offerType,
                                                                        )),
                                                              );
                                                            },
                                                            child: // Edit
                                                                Text("Edit",
                                                                    style: TextStyle(
                                                                        color:
                                                                            black_354356,
                                                                        fontFamily:
                                                                            fontMavenProMedium,
                                                                        fontSize: 14
                                                                            .sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                          ),
                                                          // PopupMenuItem(
                                                          //     value: 2,
                                                          //     child: StatefulBuilder(
                                                          //       builder: (BuildContext
                                                          //               context,
                                                          //           void Function(
                                                          //                   void
                                                          //                       Function())
                                                          //               setState) {
                                                          //         return Container(
                                                          //           width: 130,
                                                          //           child: Row(
                                                          //             children: [
                                                          //               Text("Status",
                                                          //                   style: TextStyle(
                                                          //                       color:
                                                          //                           black_354356,
                                                          //                       fontFamily:
                                                          //                           fontMavenProMedium,
                                                          //                       fontSize: 14
                                                          //                           .sp),
                                                          //                   textAlign:
                                                          //                       TextAlign
                                                          //                           .left),
                                                          //               SizedBox(
                                                          //                 width: 50,
                                                          //               ),
                                                          //               FlutterSwitch(
                                                          //                 width: 40.0,
                                                          //                 height:
                                                          //                     23.0,
                                                          //                 activeColor:
                                                          //                     Blue_5468ff,
                                                          //                 inactiveColor:
                                                          //                     grey_e2e3e5,
                                                          //                 valueFontSize:
                                                          //                     0.0,
                                                          //                 toggleSize:
                                                          //                     18.0,
                                                          //                 value:
                                                          //                     statusHomeNoti,
                                                          //                 borderRadius:
                                                          //                     15.0,
                                                          //                 padding:
                                                          //                     2.0,
                                                          //                 showOnOff:
                                                          //                     true,
                                                          //                 onToggle:
                                                          //                     (val) {
                                                          //                   statusHomeNoti =
                                                          //                       val;
                                                          //                   setState(
                                                          //                       () {
                                                          //                     statusHomeNoti =
                                                          //                         val;
                                                          //                   });
                                                          //                 },
                                                          //               ),
                                                          //             ],
                                                          //           ),
                                                          //         );
                                                          //       },
                                                          //     )),
                                                          PopupMenuItem(
                                                            value: 3,
                                                            onTap: () async {
                                                              final navigator =
                                                                  Navigator.of(
                                                                      context);
                                                              await Future
                                                                  .delayed(
                                                                      Duration
                                                                          .zero);
                                                              navigator.push(
                                                                MaterialPageRoute(
                                                                    builder: (_) =>
                                                                        DeleteDeal(
                                                                          offerId:
                                                                              data.offerId!,
                                                                          offerPersantage:
                                                                              data.offerPercentage,
                                                                          startTime: data
                                                                              .timePeriod!
                                                                              .start,
                                                                          endTime: data
                                                                              .timePeriod!
                                                                              .end,
                                                                          day: data
                                                                              .day,
                                                                        )),
                                                              );
                                                            },
                                                            child: // Edit
                                                                Text("Delete",
                                                                    style: TextStyle(
                                                                        color:
                                                                            red_fa695e,
                                                                        fontFamily:
                                                                            fontMavenProMedium,
                                                                        fontSize: 14
                                                                            .sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                          ),
                                                        ],
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 24,
                                                                vertical: 10),
                                                        child: SvgPicture.asset(
                                                            icon_menu),
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
                                                          color:
                                                              light_black_5f6d7b,
                                                          fontFamily:
                                                              fontMavenProRegular,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 14.sp),
                                                      text: "Validity: "),
                                                  TextSpan(
                                                      style: TextStyle(
                                                          color: Blue_5468ff,
                                                          fontFamily:
                                                              fontMavenProRegular,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 14.sp),
                                                      text:
                                                          "${data.timeType} |  ${data.timePeriod!.start} to ${data.timePeriod!.end}")
                                                ])),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 25.h,
                                                width: 15.w,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      16.r),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      16.r)),
                                                      color: bg_f3f5f9),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.r),
                                                  child: LayoutBuilder(builder:
                                                      (context, constraints) {
                                                    return Flex(
                                                        direction:
                                                            Axis.horizontal,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: List.generate(
                                                            (constraints.constrainWidth() /
                                                                    10)
                                                                .floor(),
                                                            (index) =>
                                                                const SizedBox(
                                                                  height: 1,
                                                                  width: 5,
                                                                  child:
                                                                      DecoratedBox(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                divider_d4dce7),
                                                                  ),
                                                                )));
                                                  }),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 25.h,
                                                width: 15.w,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      16.r),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      16.r)),
                                                      color: bg_f3f5f9),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: boxDecorationTicketSecond,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 8.h,
                                                    left: 12.w,
                                                    right: 12.w),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                icon_green_rectangle,
                                                                width: 10.w,
                                                                height: 10.h,
                                                              ),
                                                              SizedBox(
                                                                width: 7.w,
                                                              ),
                                                              // 25% off
                                                              Text(
                                                                  "${data.offerPercentage} off",
                                                                  style: TextStyle(
                                                                      color:
                                                                          black_354356,
                                                                      fontFamily:
                                                                          fontMavenProMedium,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize: 12
                                                                          .sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left)
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                icon_green_rectangle,
                                                                width: 10.w,
                                                                height: 10.h,
                                                              ),
                                                              SizedBox(
                                                                width: 7.w,
                                                              ),
                                                              // 25% off
                                                              Text(
                                                                  "${data.offerType}",
                                                                  style: TextStyle(
                                                                      color:
                                                                          black_354356,
                                                                      fontFamily:
                                                                          fontMavenProMedium,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize: 12
                                                                          .sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left)
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 6.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                icon_green_rectangle,
                                                                width: 10.w,
                                                                height: 10.h,
                                                              ),
                                                              SizedBox(
                                                                width: 7.w,
                                                              ),
                                                              // 25% off
                                                              Text(
                                                                  "${data.dealType}",
                                                                  style: TextStyle(
                                                                      color:
                                                                          black_354356,
                                                                      fontFamily:
                                                                          fontMavenProMedium,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize: 12
                                                                          .sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left)
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                icon_green_rectangle,
                                                                width: 10.w,
                                                                height: 10.h,
                                                              ),
                                                              SizedBox(
                                                                width: 7.w,
                                                              ),
                                                              // 25% off
                                                              Text(
                                                                  "${data.totalDeal} Deals",
                                                                  style: TextStyle(
                                                                      color:
                                                                          black_354356,
                                                                      fontFamily:
                                                                          fontMavenProMedium,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize: 12
                                                                          .sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left)
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 16.h,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Expanded(
                                                    flex: 1,
                                                    child: DottedLine(
                                                      direction:
                                                          Axis.horizontal,
                                                      lineLength:
                                                          double.infinity,
                                                      lineThickness: 1.0,
                                                      dashLength: 4.0,
                                                      dashColor: divider_d4dce7,
                                                      dashRadius: 0.0,
                                                      dashGapLength: 4.0,
                                                      dashGapColor:
                                                          Colors.transparent,
                                                      dashGapRadius: 0.0,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        100),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        100),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10)),
                                                            gradient:
                                                                LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment(
                                                                  0.8, 1),
                                                              colors: [
                                                                Color(
                                                                    0xffe9c870),
                                                                Color(
                                                                    0xffdea91b),
                                                              ],
                                                            )),
                                                    child: // predicted results
                                                        Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 21.w,
                                                              vertical: 4.h),
                                                      child: Text(
                                                          "predicted results"
                                                              .toUpperCase(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  fontMavenProMedium,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 14.sp,
                                                              letterSpacing:
                                                                  0.7),
                                                          textAlign:
                                                              TextAlign.left),
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    flex: 1,
                                                    child: DottedLine(
                                                      direction:
                                                          Axis.horizontal,
                                                      lineLength:
                                                          double.infinity,
                                                      lineThickness: 1.0,
                                                      dashLength: 4.0,
                                                      dashColor: divider_d4dce7,
                                                      dashRadius: 0.0,
                                                      dashGapLength: 4.0,
                                                      dashGapColor:
                                                          Colors.transparent,
                                                      dashGapRadius: 0.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        // Customers Predicted
                                                        Text(
                                                            "Customers Predicted",
                                                            style: TextStyle(
                                                                color:
                                                                    grey_969da8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    fontMavenProMedium,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize:
                                                                    12.sp),
                                                            textAlign: TextAlign
                                                                .right),
                                                        SizedBox(
                                                          height: 4.h,
                                                        ),

                                                        // 15-20
                                                        Text("15-20",
                                                            style: TextStyle(
                                                                color:
                                                                    black_354356,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    fontMavenProProSemiBold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize:
                                                                    14.sp),
                                                            textAlign:
                                                                TextAlign.right)
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        // Customers Predicted
                                                        Text(
                                                            "Revenue Predicted",
                                                            style: TextStyle(
                                                                color:
                                                                    grey_969da8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    fontMavenProMedium,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize:
                                                                    12.sp),
                                                            textAlign: TextAlign
                                                                .right),
                                                        SizedBox(
                                                          height: 4.h,
                                                        ),

                                                        // 15-20
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              icon_rupee_slim,
                                                              color:
                                                                  black_354356,
                                                              width: 10.w,
                                                              height: 10.h,
                                                            ),
                                                            Text("25,000",
                                                                style: TextStyle(
                                                                    color:
                                                                        black_354356,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontFamily:
                                                                        fontMavenProProSemiBold,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontSize:
                                                                        14.sp),
                                                                textAlign:
                                                                    TextAlign
                                                                        .right),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 14.h,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void selectDailyOpportunity(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
              decoration: BoxDecoration(
                  color: bg_f3f5f9,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.r),
                      topRight: Radius.circular(18.r))),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Wrap(
                  children: [BottomSheetDailyOpportunities()],
                ),
              ));
        });
  }
}
