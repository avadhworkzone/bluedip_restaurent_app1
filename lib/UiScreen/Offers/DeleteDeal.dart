import 'package:bluedip_restaurent/Model_list_logic/OfferModel.dart';
import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/UiScreen/bottom_bar/LatestBottomNavigationScreen.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/offer_view_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/common_blue_border_button.dart';
import '../../Widget/toolbar_with_title.dart';
import '../../modal/apiModel/response_model/common_res_model.dart';

class DeleteDeal extends StatefulWidget {
  DeleteDeal(
      {Key? key,
      this.offerId,
      this.offerPersantage,
      this.day,
      this.startTime,
      this.endTime})
      : super(key: key);
  int? offerId;
  String? offerPersantage;
  List? day;
  String? startTime;
  String? endTime;

  @override
  State<DeleteDeal> createState() => _DeleteDealState();
}

class _DeleteDealState extends State<DeleteDeal> {
  String? selectedCategory;
  List<OfferModel> onOfferModel = [];

  List<String> selectedList = [];
  String selectOffer = '';

  ManageOfferViewModel manageOfferViewModel = Get.find();
  bool isReasonLayout = false;
  TextEditingController otherReason = TextEditingController();

  @override
  void initState() {
    onOfferModel.clear();
    onOfferModel.add(OfferModel("Restaurant became busy"));
    onOfferModel.add(OfferModel("Not profitable"));
    onOfferModel.add(OfferModel("Other Reasons"));
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
    return SafeArea(
        child: Scaffold(
      backgroundColor: bg_f3f5f9,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToolbarWithTitle("Delete Deal"),
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
                        SizedBox(height: 4.h),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(8.r),
                          color: orange_d6483d,
                          //color of dotted/dash line
                          strokeWidth: 1,
                          //thickness of dash/dots
                          dashPattern: [4, 3],
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.w, horizontal: 12.h),
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: // You’re about to remove the following Deal.
                                      Text(
                                          "You’re about to remove the following Deal.",
                                          style: TextStyle(
                                              color: orange_d6483d,
                                              fontFamily: fontMavenProRegular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.left))),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xffe5ebf6),
                                    offset: Offset(0, 6),
                                    blurRadius: 8,
                                    spreadRadius: 0)
                              ],
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(0.8, 1),
                                  colors: [
                                    Color(0xff73a5ff),
                                    Color(0xff1e6af2)
                                  ])),
                          child: Padding(
                            padding: EdgeInsets.all(14.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Deal Id #213113
                                Text("Deal Id #${widget.offerId}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: fontMavenProRegular,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),
                                SizedBox(
                                  height: 8.h,
                                ),

                                // 35% off on Wednesday from 9AM - 11PM
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      widget.day!.length,
                                      (index) => Text(
                                          "${widget.offerPersantage} off on ${widget.day![index]} from ${widget.startTime} - ${widget.endTime}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: fontMavenProBold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left)),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        /*predicted results layout*/
                        Container(
                          decoration: boxDecoration,
                          padding: EdgeInsets.all(14.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(100),
                                          bottomLeft: Radius.circular(100),
                                          bottomRight: Radius.circular(10)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment(0.8, 1),
                                        colors: [
                                          Color(0xfffdae65),
                                          Color(0xfff28929),
                                        ],
                                      )),
                                  child: // predicted results
                                      Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40.w, vertical: 4.h),
                                    child: Text("Impact".toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontMavenProMedium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Customers Predicted
                                        Text("Change in Revenue",
                                            style: TextStyle(
                                                color: grey_969da8,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.right),
                                        SizedBox(
                                          height: 4.h,
                                        ),

                                        // 15-20
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              icon_rupee_slim,
                                              color: black_354356,
                                              width: 10.w,
                                              height: 10.h,
                                            ),
                                            Text("-5,000",
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        fontMavenProProSemiBold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.right),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Customers Predicted
                                        Text("Adjusted Revenue",
                                            style: TextStyle(
                                                color: grey_969da8,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.right),
                                        SizedBox(
                                          height: 4.h,
                                        ),

                                        // 15-20
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              icon_rupee_slim,
                                              color: black_354356,
                                              width: 10.w,
                                              height: 10.h,
                                            ),
                                            Text("18,000",
                                                style: TextStyle(
                                                    color: black_354356,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        fontMavenProProSemiBold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.right),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text("Improve Your AI Prediction",
                            style: TextStyle(
                                color: black_354356,
                                fontStyle: FontStyle.normal,
                                fontSize: 15.sp,
                                fontFamily: fontMavenProProSemiBold),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 6.h,
                        ),

                        /*Bottom Sheet Cancellation*/
                        GestureDetector(
                          onTap: () {
                            selectCancellation(context);
                          },
                          child: Container(
                            decoration: boxDecoration,
                            padding: EdgeInsets.all(14.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Select
                                Text(selectOffer == "" ? "Select" : selectOffer,
                                    style: TextStyle(
                                        color: black_354356,
                                        fontFamily: fontMavenProMedium,
                                        fontSize: 15.sp),
                                    textAlign: TextAlign.left),
                                SvgPicture.asset(
                                  icon_down_arrow,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /*bottom two buttons here*/
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: CommonBlueBorderButton(
                            strCancel.toUpperCase(),
                            () {},
                            Blue_5468ff,
                            Colors.transparent,
                            Blue_5468ff)),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          //  margin: EdgeInsets.only(left: 14.w, right: 14.w),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x5ed6483d),
                                blurRadius: 15.0,
                                spreadRadius: 0,
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              )
                            ],
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  await manageOfferViewModel
                                      .deleteOfferViewModel(
                                          offerId: widget.offerId.toString(),
                                          cancelReason: selectOffer);

                                  if (manageOfferViewModel
                                          .deleteOfferApiResponse.status ==
                                      Status.COMPLETE) {
                                    CommonResponseModel response =
                                        manageOfferViewModel
                                            .deleteOfferApiResponse.data;
                                    if (response.status == true) {
                                      Get.offAll(
                                          LatestBottomNavigationScreen());
                                    } else {
                                      Get.snackbar('', '${response.message}',
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.white,
                                          backgroundColor: blue_3d56f0);
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: red_d6483d,
                                  onPrimary: Colors.white,
                                  elevation: 0,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 15.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                    // side: BorderSide(color: skygreen_24d39e, width: 0),
                                  ),
                                ),
                                child: Text(
                                  strDelete.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontFamily: fontMavenProMedium),
                                )),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          GetBuilder<ManageOfferViewModel>(
            builder: (controller) {
              if (controller.deleteOfferApiResponse.status == Status.LOADING) {
                return CircularIndicator();
              }
              return SizedBox();
            },
          )
        ],
      ),
    ));
  }

  void selectCancellation(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) =>
                Container(
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
                            child: Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Daily Opportunities
                                  // Title
                                  Center(
                                    child: Text("Select Reason To Delete",
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

                                  // ListView.builder(
                                  //   scrollDirection: Axis.vertical,
                                  //   primary: false,
                                  //   shrinkWrap: true,
                                  //   padding: EdgeInsets.only(top: 10,),
                                  //   itemCount: offerList.length,
                                  //   itemBuilder: (context, i) =>   GestureDetector(
                                  //     onTap: () {
                                  //       setState(() {
                                  //         mySelectConsultation = i;
                                  //         if(i==2){
                                  //           isReasonLayout = true;
                                  //         }else{
                                  //           isReasonLayout = false;
                                  //         }
                                  //       });
                                  //     },
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.only(left: 16,top: 11,bottom: 11),
                                  //       child: Container(
                                  //         color: Colors.white,
                                  //         child: Row(
                                  //           mainAxisAlignment: MainAxisAlignment.start,
                                  //           children: [
                                  //             SvgPicture.asset(mySelectConsultation ==i ?icon_selected_radio:icon_unselected_radio),
                                  //             SizedBox(width: 12.w,),
                                  //             // Value Selected
                                  //             Text(
                                  //                 offerList[i].title,
                                  //                 style:  TextStyle(
                                  //                     color:  black_354356,
                                  //                     fontWeight: FontWeight.w500,
                                  //                     fontFamily: fontMavenProMedium,
                                  //                     fontStyle:  FontStyle.normal,
                                  //                     fontSize: 15.sp
                                  //                 ),
                                  //                 textAlign: TextAlign.left
                                  //             )
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   )
                                  // ),

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
                                              setModalState(
                                                () {
                                                  if (selectedList.contains(
                                                      onOfferModel[i].title)) {
                                                    selectedList.remove(
                                                        onOfferModel[i].title);
                                                    if (i == 2) {
                                                      isReasonLayout = false;
                                                    }
                                                  } else {
                                                    selectedList.add(
                                                        onOfferModel[i].title);
                                                    if (i == 2) {
                                                      isReasonLayout = true;
                                                    }
                                                  }
                                                  setState(() {
                                                    selectOffer =
                                                        onOfferModel[i].title;
                                                    // selectOffer ==
                                                    //         'Other Reasons'
                                                    //     ? selectOffer =
                                                    //         otherReason.text
                                                    //     : SizedBox();
                                                  });
                                                  print(
                                                      'selectOffer${selectOffer}');
                                                },
                                              );
                                              // setState(() {
                                              //   final removedBrackets =
                                              //       selectedList
                                              //           .toString()
                                              //           .substring(
                                              //               1,
                                              //               selectedList
                                              //                       .toString()
                                              //                       .length -
                                              //                   1);
                                              //   final parts =
                                              //       removedBrackets.split(', ');
                                              //
                                              //   var joined = parts
                                              //       .map((part) => "$part")
                                              //       .join(', ');
                                              //
                                              //   print(joined);
                                              //   MyConstant.strDeleteReason =
                                              //       joined;
                                              // });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16,
                                                  top: 11,
                                                  bottom: 11),
                                              child: Container(
                                                color: Colors.white,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    SvgPicture.asset(selectOffer ==
                                                            onOfferModel[i]
                                                                .title
                                                        ? icon_selected_checkbox
                                                        : icon_unselected_checkbox),
                                                    SizedBox(
                                                      width: 12.w,
                                                    ),
                                                    // Value Selected
                                                    Text(onOfferModel[i].title,
                                                        style: TextStyle(
                                                            color: black_354356,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                fontMavenProMedium,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 15.sp),
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
                                      margin:
                                          EdgeInsets.only(left: 45, right: 16),
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
                                        controller: otherReason,
                                        onChanged: (val) {
                                          if (val.isEmpty) {
                                            selectOffer = "";
                                          } else {
                                            selectOffer = otherReason.text;
                                            setState(() {});
                                            print(
                                                'otherReason---${otherReason}');
                                          }
                                          // if (otherReason.text.isNotEmpty) {

                                          // }
                                        },
                                        style: TextStyle(
                                            color: black_354356,
                                            fontFamily: fontMavenProMedium,
                                            fontSize: 15.sp),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'write reason',
                                          contentPadding: EdgeInsets.zero,
                                          isDense: true,
                                          hintStyle: TextStyle(
                                              color: grey_969da8,
                                              fontFamily: fontMavenProMedium,
                                              fontSize: 15.sp),
                                        ),
                                      ),
                                    ),
                                  )
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
                                    strCancel.toUpperCase(),
                                    () => Navigator.pop(context, false),
                                    Colors.white,
                                    Colors.white,
                                    Blue_5468ff),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                flex: 1,
                                child: CommonBlueBorderButton(
                                    "Confirm".toUpperCase(),
                                    () => Navigator.pop(context, false),
                                    Colors.white,
                                    Colors.white,
                                    red_d6483d),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
          );
        });
  }
}
