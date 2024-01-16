// ignore_for_file: non_constant_identifier_names

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_rating_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/utils/utility.dart';
import 'package:bluedip_restaurent/viewModel/add_resto_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../Styles/my_font.dart';
import '../../Styles/my_icons.dart';
import '../../Widget/box_shadow.dart';

class DetailPage2 extends StatefulWidget {
  const DetailPage2({Key? key}) : super(key: key);

  @override
  State<DetailPage2> createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2> {
  TextEditingController ratingController = TextEditingController();
  AddRestaurantsViewModel addRestaurantsViewModel = AddRestaurantsViewModel();
  GetRatingResModel? response;
  double? dineRatting;
  double? deliveryRatting;
  bool isTakeaway = false;
  bool isDineIn = false;
  @override
  void initState() {
    // getRatingDataApiCall();
    super.initState();
  }

  getRatingDataApiCall() async {
    await addRestaurantsViewModel.getRatingViewModel(action: "get_rating");
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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.h,
              ),
              //
              // /*Dine-in Ratings*/
              // Container(
              //   decoration: boxDecoration,
              //   padding: EdgeInsets.all(14.r),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         mainAxisAlignment:
              //             MainAxisAlignment.spaceBetween,
              //         children: [
              //           // Monthly Revenue Goal
              //           Text("Dine-in Ratings",
              //               style: TextStyle(
              //                   color: black_354356,
              //                   fontFamily: fontMavenProProSemiBold,
              //                   fontSize: 15.sp),
              //               textAlign: TextAlign.left),
              //
              //           RatingBar.builder(
              //             initialRating: dineRatting!,
              //             minRating: 1,
              //             direction: Axis.horizontal,
              //             allowHalfRating: true,
              //             unratedColor: Color(0xffd4dce7),
              //             itemCount: 5,
              //             itemSize: 30,
              //             itemPadding:
              //                 EdgeInsets.symmetric(horizontal: 0.0),
              //             itemBuilder: (context, index) =>
              //                 SvgPicture.asset(
              //               icon_star,
              //               color: Blue_5468ff,
              //             ),
              //             onRatingUpdate: (rating) {
              //               print(rating);
              //             },
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 16.h,
              //       ),
              //       Row(
              //         mainAxisAlignment:
              //             MainAxisAlignment.spaceBetween,
              //         children: [
              //           // Rating Count
              //           Text("Rating Count",
              //               style: TextStyle(
              //                   color: black_354356,
              //                   fontFamily: fontMavenProRegular,
              //                   fontSize: 14.sp),
              //               textAlign: TextAlign.left),
              //
              //           Container(
              //             width: 150.w,
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: 14.w, vertical: 10.h),
              //             decoration: BoxDecoration(
              //                 border: Border.all(
              //                     width: 1, color: Color(0xffd9dde3)),
              //                 borderRadius:
              //                     BorderRadius.circular(10.r),
              //                 color: Colors.white),
              //             child: TextField(
              //               controller: ratingController,
              //               onChanged: (val) {},
              //               style: TextStyle(
              //                   color: black_354356,
              //                   fontFamily: fontMavenProMedium,
              //                   fontSize: 15.sp),
              //               decoration: InputDecoration(
              //                 border: InputBorder.none,
              //                 hintText: 'e.g. 122',
              //                 contentPadding: EdgeInsets.zero,
              //                 isDense: true,
              //                 hintStyle: TextStyle(
              //                     color: grey_969da8,
              //                     fontFamily: fontMavenProMedium,
              //                     fontSize: 15.sp),
              //               ),
              //             ),
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              //
              // /*Delivery Ratings*/
              // Container(
              //   decoration: boxDecoration,
              //   padding: EdgeInsets.all(14.r),
              //   margin: EdgeInsets.only(top: 20.h),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         mainAxisAlignment:
              //             MainAxisAlignment.spaceBetween,
              //         children: [
              //           // Monthly Revenue Goal
              //           Text("Delivery Ratings",
              //               style: TextStyle(
              //                   color: black_354356,
              //                   fontFamily: fontMavenProProSemiBold,
              //                   fontSize: 15.sp),
              //               textAlign: TextAlign.left),
              //
              //           RatingBar.builder(
              //             initialRating: deliveryRatting!,
              //             minRating: 1,
              //             direction: Axis.horizontal,
              //             allowHalfRating: true,
              //             unratedColor: Color(0xffd4dce7),
              //             itemCount: 5,
              //             itemSize: 30,
              //             itemPadding:
              //                 EdgeInsets.symmetric(horizontal: 0.0),
              //             itemBuilder: (context, _) =>
              //                 SvgPicture.asset(
              //               icon_star,
              //               color: Blue_5468ff,
              //             ),
              //             onRatingUpdate: (rating) {
              //               print(rating);
              //             },
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 16.h,
              //       ),
              //       Row(
              //         mainAxisAlignment:
              //             MainAxisAlignment.spaceBetween,
              //         children: [
              //           // Rating Count
              //           Text("Rating Count",
              //               style: TextStyle(
              //                   color: black_354356,
              //                   fontFamily: fontMavenProRegular,
              //                   fontSize: 14.sp),
              //               textAlign: TextAlign.left),
              //
              //           Container(
              //             width: 150.w,
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: 14.w, vertical: 10.h),
              //             decoration: BoxDecoration(
              //                 border: Border.all(
              //                     width: 1, color: Color(0xffd9dde3)),
              //                 borderRadius:
              //                     BorderRadius.circular(10.r),
              //                 color: Colors.white),
              //             child: TextField(
              //               style: TextStyle(
              //                   color: black_354356,
              //                   fontFamily: fontMavenProMedium,
              //                   fontSize: 15.sp),
              //               decoration: InputDecoration(
              //                 border: InputBorder.none,
              //                 hintText: 'e.g. 122',
              //                 contentPadding: EdgeInsets.zero,
              //                 isDense: true,
              //                 hintStyle: TextStyle(
              //                     color: grey_969da8,
              //                     fontFamily: fontMavenProMedium,
              //                     fontSize: 15.sp),
              //               ),
              //             ),
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // ),

              /*Takeaway*/
              Container(
                decoration: boxDecoration,
                padding: EdgeInsets.all(14.r),
                margin: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Takeaway",
                          style: TextStyle(
                              color: black_354356,
                              fontFamily: fontMavenProProSemiBold,
                              fontSize: 15.sp),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isTakeaway = true;
                                if (Utility.restaurantType
                                    .contains('takeaway')) {
                                  print('already added');
                                } else {
                                  Utility.restaurantType.add('takeaway');
                                }
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: isTakeaway == true
                                          ? Blue_5468ff
                                          : Colors.grey,
                                      width: 1),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(
                                          color: isTakeaway == true
                                              ? Blue_5468ff
                                              : black_354356,
                                          fontFamily: fontMavenProProSemiBold,
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isTakeaway = false;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: isTakeaway == false
                                          ? Blue_5468ff
                                          : Colors.grey,
                                      width: 1),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                          color: isTakeaway == false
                                              ? Blue_5468ff
                                              : black_354356,
                                          fontFamily: fontMavenProProSemiBold,
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              /*Dine-In*/
              Container(
                decoration: boxDecoration,
                padding: EdgeInsets.all(14.r),
                // margin: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Dine-In",
                          style: TextStyle(
                              color: black_354356,
                              fontFamily: fontMavenProProSemiBold,
                              fontSize: 15.sp),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isDineIn = true;
                                if (Utility.restaurantType
                                    .contains('dine-in')) {
                                  print('already added');
                                } else {
                                  Utility.restaurantType.add('dine-in');
                                }
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: isDineIn == true
                                          ? Blue_5468ff
                                          : Colors.grey,
                                      width: 1),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(
                                          color: isDineIn == true
                                              ? Blue_5468ff
                                              : black_354356,
                                          fontFamily: fontMavenProProSemiBold,
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isDineIn = false;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: isDineIn == false
                                          ? Blue_5468ff
                                          : Colors.grey,
                                      width: 1),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                          color: isDineIn == false
                                              ? Blue_5468ff
                                              : black_354356,
                                          fontFamily: fontMavenProProSemiBold,
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              /*Monthly Revenue Goal*/
              Container(
                decoration: boxDecoration,
                padding: EdgeInsets.all(14.r),
                margin: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Monthly Revenue Goal
                        Text("Monthly Revenue Goal",
                            style: TextStyle(
                                color: black_354356,
                                fontFamily: fontMavenProProSemiBold,
                                fontSize: 15.sp),
                            textAlign: TextAlign.left),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Cost:
                            const Text("Goal:",
                                style: TextStyle(
                                    color: Blue_5468ff,
                                    fontFamily: fontMavenProMedium,
                                    fontSize: 15.0),
                                textAlign: TextAlign.right),

                            // 2500
                            Text("₹${Utility.monthlyRevenueGoal}",
                                style: TextStyle(
                                    color: Blue_5468ff,
                                    fontFamily: fontMavenProMedium,
                                    fontSize: 15.sp),
                                textAlign: TextAlign.right)
                          ],
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        // here
                        trackHeight: 6,

                        trackShape: CustomTrackShape(),
                      ),
                      child: Slider(
                          value: Utility.monthlyRevenueGoal.toDouble(),
                          min: 10000.0,
                          max: 90000.0,
                          activeColor: Blue_5468ff,
                          inactiveColor: unselected_greey_e7e9ff,
                          label: 'Set volume value',
                          onChanged: (double newValue) {
                            setState(() {
                              Utility.monthlyRevenueGoal = newValue.toInt();
                            });
                          },
                          semanticFormatterCallback: (double newValue) {
                            return '${newValue.round()} dollars';
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 500
                        Text("₹500",
                            style: TextStyle(
                                color: black_354356,
                                fontFamily: fontMavenProProSemiBold,
                                fontSize: 15.sp),
                            textAlign: TextAlign.right),

                        Text("₹5000+",
                            style: TextStyle(
                                color: black_354356,
                                fontFamily: fontMavenProProSemiBold,
                                fontSize: 15.sp),
                            textAlign: TextAlign.right)
                      ],
                    )
                  ],
                ),
              ),

              /*Price Range*/
              Container(
                decoration: boxDecoration,
                padding: EdgeInsets.all(14.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Monthly Revenue Goal
                        Text("Price Range",
                            style: TextStyle(
                                color: black_354356,
                                fontFamily: fontMavenProProSemiBold,
                                fontSize: 15.sp),
                            textAlign: TextAlign.left),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Cost:
                            const Text("Range:",
                                style: TextStyle(
                                    color: Blue_5468ff,
                                    fontFamily: fontMavenProMedium,
                                    fontSize: 15.0),
                                textAlign: TextAlign.right),

                            // 2500
                            Text("₹${Utility.priceRange}",
                                style: TextStyle(
                                    color: Blue_5468ff,
                                    fontFamily: fontMavenProMedium,
                                    fontSize: 15.sp),
                                textAlign: TextAlign.right)
                          ],
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        // here
                        trackHeight: 6,

                        trackShape: CustomTrackShape(),
                      ),
                      child: Slider(
                          value: Utility.priceRange.toDouble(),
                          min: 500,
                          max: 5000,
                          activeColor: Blue_5468ff,
                          inactiveColor: unselected_greey_e7e9ff,
                          label: 'Set volume value',
                          onChanged: (double newValue) {
                            setState(() {
                              Utility.priceRange = newValue.toInt();
                            });
                          },
                          semanticFormatterCallback: (double newValue) {
                            return '${newValue.round()} dollars';
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 500
                        Text("₹10,000",
                            style: TextStyle(
                                color: black_354356,
                                fontFamily: fontMavenProProSemiBold,
                                fontSize: 15.sp),
                            textAlign: TextAlign.right),

                        Text("₹90,000+",
                            style: TextStyle(
                                color: black_354356,
                                fontFamily: fontMavenProProSemiBold,
                                fontSize: 15.sp),
                            textAlign: TextAlign.right)
                      ],
                    )
                  ],
                ),
              )
              // GetBuilder<AddRestaurantsViewModel>(
              //   builder: (controller) {
              //     if (controller.getRatingApiResponse.status ==
              //         Status.LOADING) {
              //       return const Center(child: CircularIndicator());
              //     }
              //     if (controller.getRatingApiResponse.status ==
              //         Status.COMPLETE) {
              //       response =
              //           addRestaurantsViewModel.getRatingApiResponse.data;
              //       response != null
              //           ? response!.data!.forEach((element) {
              //               if (element.type == "delivery") {
              //                 deliveryRatting =
              //                     double.parse(element.avg.toString());
              //               } else {
              //                 dineRatting =
              //                     double.parse(element.avg.toString());
              //               }
              //             })
              //           : SizedBox();
              //       if (response!.status == false) {
              //         Text('${response!.status}');
              //       }
              //     }
              //     if (controller.getRatingApiResponse.status == Status.ERROR) {
              //       return const Center(child: ServerError());
              //     }
              //     return Expanded(
              //         child: SingleChildScrollView(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           SizedBox(
              //             height: 4.h,
              //           ),
              //           //
              //           // /*Dine-in Ratings*/
              //           // Container(
              //           //   decoration: boxDecoration,
              //           //   padding: EdgeInsets.all(14.r),
              //           //   child: Column(
              //           //     mainAxisAlignment: MainAxisAlignment.start,
              //           //     crossAxisAlignment: CrossAxisAlignment.start,
              //           //     children: [
              //           //       Row(
              //           //         mainAxisAlignment:
              //           //             MainAxisAlignment.spaceBetween,
              //           //         children: [
              //           //           // Monthly Revenue Goal
              //           //           Text("Dine-in Ratings",
              //           //               style: TextStyle(
              //           //                   color: black_354356,
              //           //                   fontFamily: fontMavenProProSemiBold,
              //           //                   fontSize: 15.sp),
              //           //               textAlign: TextAlign.left),
              //           //
              //           //           RatingBar.builder(
              //           //             initialRating: dineRatting!,
              //           //             minRating: 1,
              //           //             direction: Axis.horizontal,
              //           //             allowHalfRating: true,
              //           //             unratedColor: Color(0xffd4dce7),
              //           //             itemCount: 5,
              //           //             itemSize: 30,
              //           //             itemPadding:
              //           //                 EdgeInsets.symmetric(horizontal: 0.0),
              //           //             itemBuilder: (context, index) =>
              //           //                 SvgPicture.asset(
              //           //               icon_star,
              //           //               color: Blue_5468ff,
              //           //             ),
              //           //             onRatingUpdate: (rating) {
              //           //               print(rating);
              //           //             },
              //           //           ),
              //           //         ],
              //           //       ),
              //           //       SizedBox(
              //           //         height: 16.h,
              //           //       ),
              //           //       Row(
              //           //         mainAxisAlignment:
              //           //             MainAxisAlignment.spaceBetween,
              //           //         children: [
              //           //           // Rating Count
              //           //           Text("Rating Count",
              //           //               style: TextStyle(
              //           //                   color: black_354356,
              //           //                   fontFamily: fontMavenProRegular,
              //           //                   fontSize: 14.sp),
              //           //               textAlign: TextAlign.left),
              //           //
              //           //           Container(
              //           //             width: 150.w,
              //           //             padding: EdgeInsets.symmetric(
              //           //                 horizontal: 14.w, vertical: 10.h),
              //           //             decoration: BoxDecoration(
              //           //                 border: Border.all(
              //           //                     width: 1, color: Color(0xffd9dde3)),
              //           //                 borderRadius:
              //           //                     BorderRadius.circular(10.r),
              //           //                 color: Colors.white),
              //           //             child: TextField(
              //           //               controller: ratingController,
              //           //               onChanged: (val) {},
              //           //               style: TextStyle(
              //           //                   color: black_354356,
              //           //                   fontFamily: fontMavenProMedium,
              //           //                   fontSize: 15.sp),
              //           //               decoration: InputDecoration(
              //           //                 border: InputBorder.none,
              //           //                 hintText: 'e.g. 122',
              //           //                 contentPadding: EdgeInsets.zero,
              //           //                 isDense: true,
              //           //                 hintStyle: TextStyle(
              //           //                     color: grey_969da8,
              //           //                     fontFamily: fontMavenProMedium,
              //           //                     fontSize: 15.sp),
              //           //               ),
              //           //             ),
              //           //           )
              //           //         ],
              //           //       )
              //           //     ],
              //           //   ),
              //           // ),
              //           //
              //           // /*Delivery Ratings*/
              //           // Container(
              //           //   decoration: boxDecoration,
              //           //   padding: EdgeInsets.all(14.r),
              //           //   margin: EdgeInsets.only(top: 20.h),
              //           //   child: Column(
              //           //     mainAxisAlignment: MainAxisAlignment.start,
              //           //     crossAxisAlignment: CrossAxisAlignment.start,
              //           //     children: [
              //           //       Row(
              //           //         mainAxisAlignment:
              //           //             MainAxisAlignment.spaceBetween,
              //           //         children: [
              //           //           // Monthly Revenue Goal
              //           //           Text("Delivery Ratings",
              //           //               style: TextStyle(
              //           //                   color: black_354356,
              //           //                   fontFamily: fontMavenProProSemiBold,
              //           //                   fontSize: 15.sp),
              //           //               textAlign: TextAlign.left),
              //           //
              //           //           RatingBar.builder(
              //           //             initialRating: deliveryRatting!,
              //           //             minRating: 1,
              //           //             direction: Axis.horizontal,
              //           //             allowHalfRating: true,
              //           //             unratedColor: Color(0xffd4dce7),
              //           //             itemCount: 5,
              //           //             itemSize: 30,
              //           //             itemPadding:
              //           //                 EdgeInsets.symmetric(horizontal: 0.0),
              //           //             itemBuilder: (context, _) =>
              //           //                 SvgPicture.asset(
              //           //               icon_star,
              //           //               color: Blue_5468ff,
              //           //             ),
              //           //             onRatingUpdate: (rating) {
              //           //               print(rating);
              //           //             },
              //           //           ),
              //           //         ],
              //           //       ),
              //           //       SizedBox(
              //           //         height: 16.h,
              //           //       ),
              //           //       Row(
              //           //         mainAxisAlignment:
              //           //             MainAxisAlignment.spaceBetween,
              //           //         children: [
              //           //           // Rating Count
              //           //           Text("Rating Count",
              //           //               style: TextStyle(
              //           //                   color: black_354356,
              //           //                   fontFamily: fontMavenProRegular,
              //           //                   fontSize: 14.sp),
              //           //               textAlign: TextAlign.left),
              //           //
              //           //           Container(
              //           //             width: 150.w,
              //           //             padding: EdgeInsets.symmetric(
              //           //                 horizontal: 14.w, vertical: 10.h),
              //           //             decoration: BoxDecoration(
              //           //                 border: Border.all(
              //           //                     width: 1, color: Color(0xffd9dde3)),
              //           //                 borderRadius:
              //           //                     BorderRadius.circular(10.r),
              //           //                 color: Colors.white),
              //           //             child: TextField(
              //           //               style: TextStyle(
              //           //                   color: black_354356,
              //           //                   fontFamily: fontMavenProMedium,
              //           //                   fontSize: 15.sp),
              //           //               decoration: InputDecoration(
              //           //                 border: InputBorder.none,
              //           //                 hintText: 'e.g. 122',
              //           //                 contentPadding: EdgeInsets.zero,
              //           //                 isDense: true,
              //           //                 hintStyle: TextStyle(
              //           //                     color: grey_969da8,
              //           //                     fontFamily: fontMavenProMedium,
              //           //                     fontSize: 15.sp),
              //           //               ),
              //           //             ),
              //           //           )
              //           //         ],
              //           //       )
              //           //     ],
              //           //   ),
              //           // ),
              //
              //           /*Monthly Revenue Goal*/
              //           Container(
              //             decoration: boxDecoration,
              //             padding: EdgeInsets.all(14.r),
              //             margin: EdgeInsets.symmetric(vertical: 20.h),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     // Monthly Revenue Goal
              //                     Text("Monthly Revenue Goal",
              //                         style: TextStyle(
              //                             color: black_354356,
              //                             fontFamily: fontMavenProProSemiBold,
              //                             fontSize: 15.sp),
              //                         textAlign: TextAlign.left),
              //
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: [
              //                         // Cost:
              //                         const Text("Goal:",
              //                             style: TextStyle(
              //                                 color: Blue_5468ff,
              //                                 fontFamily: fontMavenProMedium,
              //                                 fontSize: 15.0),
              //                             textAlign: TextAlign.right),
              //
              //                         // 2500
              //                         Text("₹${Utility.monthlyRevenueGoal}",
              //                             style: TextStyle(
              //                                 color: Blue_5468ff,
              //                                 fontFamily: fontMavenProMedium,
              //                                 fontSize: 15.sp),
              //                             textAlign: TextAlign.right)
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //                 SliderTheme(
              //                   data: SliderThemeData(
              //                     // here
              //                     trackHeight: 6,
              //
              //                     trackShape: CustomTrackShape(),
              //                   ),
              //                   child: Slider(
              //                       value:
              //                           Utility.monthlyRevenueGoal.toDouble(),
              //                       min: 10000.0,
              //                       max: 90000.0,
              //                       activeColor: Blue_5468ff,
              //                       inactiveColor: unselected_greey_e7e9ff,
              //                       label: 'Set volume value',
              //                       onChanged: (double newValue) {
              //                         setState(() {
              //                           Utility.monthlyRevenueGoal =
              //                               newValue.toInt();
              //                         });
              //                       },
              //                       semanticFormatterCallback:
              //                           (double newValue) {
              //                         return '${newValue.round()} dollars';
              //                       }),
              //                 ),
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     // 500
              //                     Text("₹500",
              //                         style: TextStyle(
              //                             color: black_354356,
              //                             fontFamily: fontMavenProProSemiBold,
              //                             fontSize: 15.sp),
              //                         textAlign: TextAlign.right),
              //
              //                     Text("₹5000+",
              //                         style: TextStyle(
              //                             color: black_354356,
              //                             fontFamily: fontMavenProProSemiBold,
              //                             fontSize: 15.sp),
              //                         textAlign: TextAlign.right)
              //                   ],
              //                 )
              //               ],
              //             ),
              //           ),
              //
              //           /*Price Range*/
              //           Container(
              //             decoration: boxDecoration,
              //             padding: EdgeInsets.all(14.r),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     // Monthly Revenue Goal
              //                     Text("Price Range",
              //                         style: TextStyle(
              //                             color: black_354356,
              //                             fontFamily: fontMavenProProSemiBold,
              //                             fontSize: 15.sp),
              //                         textAlign: TextAlign.left),
              //
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: [
              //                         // Cost:
              //                         const Text("Range:",
              //                             style: TextStyle(
              //                                 color: Blue_5468ff,
              //                                 fontFamily: fontMavenProMedium,
              //                                 fontSize: 15.0),
              //                             textAlign: TextAlign.right),
              //
              //                         // 2500
              //                         Text("₹${Utility.priceRange}",
              //                             style: TextStyle(
              //                                 color: Blue_5468ff,
              //                                 fontFamily: fontMavenProMedium,
              //                                 fontSize: 15.sp),
              //                             textAlign: TextAlign.right)
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //                 SliderTheme(
              //                   data: SliderThemeData(
              //                     // here
              //                     trackHeight: 6,
              //
              //                     trackShape: CustomTrackShape(),
              //                   ),
              //                   child: Slider(
              //                       value: Utility.priceRange.toDouble(),
              //                       min: 500,
              //                       max: 5000,
              //                       activeColor: Blue_5468ff,
              //                       inactiveColor: unselected_greey_e7e9ff,
              //                       label: 'Set volume value',
              //                       onChanged: (double newValue) {
              //                         setState(() {
              //                           Utility.priceRange = newValue.toInt();
              //                         });
              //                       },
              //                       semanticFormatterCallback:
              //                           (double newValue) {
              //                         return '${newValue.round()} dollars';
              //                       }),
              //                 ),
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     // 500
              //                     Text("₹10,000",
              //                         style: TextStyle(
              //                             color: black_354356,
              //                             fontFamily: fontMavenProProSemiBold,
              //                             fontSize: 15.sp),
              //                         textAlign: TextAlign.right),
              //
              //                     Text("₹90,000+",
              //                         style: TextStyle(
              //                             color: black_354356,
              //                             fontFamily: fontMavenProProSemiBold,
              //                             fontSize: 15.sp),
              //                         textAlign: TextAlign.right)
              //                   ],
              //                 )
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ));
              //   },
              // ),
              // CommonBlueButton(
              //     strNext.toUpperCase(),(){},blue_3653f6
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 1.3;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
