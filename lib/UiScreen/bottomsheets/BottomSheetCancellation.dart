import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_font.dart';
import '../../Styles/my_icons.dart';

class BottomSheetCancellation extends StatefulWidget {
  const BottomSheetCancellation({Key? key}) : super(key: key);

  @override
  State<BottomSheetCancellation> createState() =>
      _BottomSheetCancellationState();
}

class _BottomSheetCancellationState extends State<BottomSheetCancellation> {
// bool selectedsecond = false;
  List<OfferModel> onOfferModel = [];
//  List<OfferModel> selectedList = [];
  List<String> selectedList = [];

  @override
  void initState() {
    onOfferModel.clear();
    onOfferModel.add(OfferModel("Restaurant became busy"));
    onOfferModel.add(OfferModel("Not profitable"));
    onOfferModel.add(OfferModel("Other Reasons"));
    super.initState();
  }

  // List<OfferModel> offerList = [
  //   OfferModel("Restaurant became busy"),
  //   OfferModel("Not profitable"),
  //   OfferModel("Other Reasons"),
  // ];
  int mySelectConsultation = -1;
  bool isReasonLayout = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 16),
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
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  itemCount: onOfferModel.length,
                  itemBuilder: (context, i) => GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              // if(i==2){
                              //   isReasonLayout = true;
                              //
                              // }else {
                              //   isReasonLayout = false;
                              //
                              // }
                              if (selectedList
                                  .contains(onOfferModel[i].title)) {
                                selectedList.remove(onOfferModel[i].title);
                                if (i == 2) {
                                  isReasonLayout = false;
                                }
                              } else {
                                if (i == 2) {
                                  isReasonLayout = true;
                                }

                                selectedList.add(onOfferModel[i].title);
                              }

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
                          padding: const EdgeInsets.only(
                              left: 16, top: 11, bottom: 11),
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SvgPicture.asset(
                                    selectedList.contains(onOfferModel[i].title)
                                        ? icon_selected_checkbox
                                        : icon_unselected_checkbox),
                                SizedBox(
                                  width: 12.w,
                                ),
                                // Value Selected
                                Text(onOfferModel[i].title,
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
                        ),
                      )),

              Visibility(
                visible: isReasonLayout,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 45, right: 16),
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xffd9dde3)),
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white),
                  child: TextField(
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
      ],
    );
  }
}
