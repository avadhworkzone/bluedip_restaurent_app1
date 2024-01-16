import 'dart:convert';
import 'dart:math';

import 'package:bluedip_restaurent/Model_list_logic/Category_Model.dart';
import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_sub_facility_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/utils/utility.dart';
import 'package:bluedip_restaurent/viewModel/add_resto_detail_view_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Styles/my_strings.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/circular_progrss_indicator.dart';
import '../../Widget/common_blue_button.dart';

class DetailPage3 extends StatefulWidget {
  const DetailPage3({Key? key}) : super(key: key);

  @override
  State<DetailPage3> createState() => _DetailPage3State();
}

class _DetailPage3State extends State<DetailPage3> {
  AddRestaurantsViewModel addRestaurantsViewModel = Get.find();
  List<Map<String, dynamic>> facilityTypeList = [];

  GetSubFacilityResModel? response;
  getFacilityList() async {
    await addRestaurantsViewModel
        .getSubFacilityViewModel(action: "get_sub_facility")
        .then((value) {
      if (addRestaurantsViewModel.getSubFacilityApiResponse.status ==
          Status.COMPLETE) {
        response = addRestaurantsViewModel.getSubFacilityApiResponse.data;
        facilityTypeList.clear();
        response!.getCategory!.forEach((element) {
          facilityTypeList
              .add({"facility_name": element.subFacilityName, "type": 0});
        });

        print('facility list===${facilityTypeList.toString()}');
        if (response!.status == false) {
          Text('${response!.status}');
        }
      }
    });
  }

  int facilityType = 0;

  @override
  void initState() {
    getFacilityList();
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: boxDecoration,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetBuilder<AddRestaurantsViewModel>(
                          builder: (controller) {
                            if (controller.getSubFacilityApiResponse.status ==
                                Status.LOADING) {
                              return const Center(child: CircularIndicator());
                            }

                            if (controller.getSubFacilityApiResponse.status ==
                                Status.ERROR) {
                              return const Center(child: ServerError());
                            }
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              primary: false,
                              shrinkWrap: true,
                              itemCount: response!.getCategory!.length,
                              padding: EdgeInsets.only(top: 23.h),
                              itemBuilder: (context, i) => Padding(
                                padding: EdgeInsets.only(
                                    left: 14.w, right: 14.w, bottom: 23),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // text
                                        Text(
                                            response!.getCategory![i]
                                                .subFacilityName!,
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 15.sp),
                                            textAlign: TextAlign.left),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  facilityTypeList[i]["type"] =
                                                      1;
                                                });
                                                if (facilityTypeList[i]
                                                        ['type'] ==
                                                    1) {
                                                  Utility.facilityData.remove(
                                                      facilityTypeList[i]
                                                          ["facility_name"]);
                                                }
                                                print(
                                                    'wskljwekdhekw${Utility.facilityData}');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.7,
                                                        color: facilityTypeList[i]
                                                                    ["type"] ==
                                                                1
                                                            ? red_ec3b45
                                                            : grey_d9dde3),
                                                    borderRadius: const BorderRadius.only(
                                                        topRight: Radius.circular(
                                                            0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft: Radius.circular(
                                                            10.0),
                                                        bottomLeft: Radius.circular(
                                                            10.0)),
                                                    color: facilityTypeList[i]["type"] == 1
                                                        ? light_red_ffd7d9
                                                        : Colors.white),
                                                child: // No
                                                    Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16,
                                                      vertical: 6),
                                                  child: Text("No",
                                                      style: TextStyle(
                                                          color: facilityTypeList[
                                                                          i][
                                                                      "type"] ==
                                                                  1
                                                              ? red_ec3b45
                                                              : grey_969da8,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              fontMavenProMedium,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 15.sp),
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  facilityTypeList[i]["type"] =
                                                      2;
                                                });
                                                if (facilityTypeList[i]
                                                        ['type'] ==
                                                    2) {
                                                  Utility.facilityData.add(
                                                      facilityTypeList[i]
                                                          ["facility_name"]);
                                                }
                                                print(
                                                    'wskljwekdhekw${Utility.facilityData}');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.7,
                                                        color: facilityTypeList[i]
                                                                    ["type"] ==
                                                                2
                                                            ? green_37c93a
                                                            : grey_d9dde3),
                                                    borderRadius: const BorderRadius.only(
                                                        topRight: Radius.circular(
                                                            10.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                10.0),
                                                        topLeft: Radius.circular(
                                                            0.0),
                                                        bottomLeft: Radius.circular(
                                                            0.0)),
                                                    color: facilityTypeList[i]["type"] == 2
                                                        ? light_green_e9ffe9
                                                        : Colors.white),
                                                child: // No
                                                    Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16,
                                                      vertical: 6),
                                                  child: Text("Yes",
                                                      style: TextStyle(
                                                          color: facilityTypeList[
                                                                          i][
                                                                      "type"] ==
                                                                  2
                                                              ? green_37c93a
                                                              : grey_969da8,
                                                          fontFamily:
                                                              fontMavenProMedium,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 15.sp),
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    i == response!.getCategory!.length - 1
                                        ? SizedBox()
                                        : Column(
                                            children: [
                                              SizedBox(
                                                height: 23.h,
                                              ),
                                              const DottedLine(
                                                direction: Axis.horizontal,
                                                lineLength: double.infinity,
                                                lineThickness: 1.0,
                                                dashLength: 4.0,
                                                dashColor: divider_d4dce7,
                                                dashRadius: 0.0,
                                                dashGapLength: 4.0,
                                                dashGapColor:
                                                    Colors.transparent,
                                                dashGapRadius: 0.0,
                                              ),
                                            ],
                                          )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 75.h,
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          //   child: CommonBlueButton(strNext.toUpperCase(), () {}, blue_3653f6),
          // ),
        ],
      ),
    );
  }
}
