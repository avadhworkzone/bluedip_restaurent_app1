import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_constant.dart';
import '../../Styles/my_font.dart';
import '../../Styles/my_icons.dart';
import '../../Widget/box_shadow_ticket.dart';
import '../../Widget/box_shadow_ticket_second.dart';

class BottomSheetDayOfWeek extends StatefulWidget {
  const BottomSheetDayOfWeek({Key? key}) : super(key: key);

  @override
  State<BottomSheetDayOfWeek> createState() => _BottomSheetDayOfWeekState();
}

class _BottomSheetDayOfWeekState extends State<BottomSheetDayOfWeek> {
  // bool selectedsecond = false;
  List<OfferModel> onOfferModel = [];
//  List<OfferModel> selectedList = [];
  List<String> selectedList = [];

  @override
  void initState() {
    onOfferModel.clear();
    onOfferModel.add(OfferModel("Sunday"));
    onOfferModel.add(OfferModel("Monday"));
    onOfferModel.add(OfferModel("Tuesday"));
    onOfferModel.add(OfferModel("Wednesday"));
    onOfferModel.add(OfferModel("Thursday"));
    onOfferModel.add(OfferModel("Friday"));
    onOfferModel.add(OfferModel("Saturday"));
    super.initState();
  }

  // List<OfferModel> offerList = [
  //   OfferModel("Sunday"),
  //   OfferModel("Monday"),
  //   OfferModel("Tuesday"),
  //   OfferModel("Wednesday"),
  //   OfferModel("Thursday"),
  //   OfferModel("Friday"),
  //   OfferModel("Saturday"),
  // ];
  // int mySelectConsultation = -1;
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
                child: Text("Select Day(s) of the week",
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
                              if (selectedList
                                  .contains(onOfferModel[i].title)) {
                                selectedList.remove(onOfferModel[i].title);
                              } else {
                                selectedList.add(onOfferModel[i].title);
                              }

                              final removedBrackets = selectedList
                                  .toString()
                                  .substring(
                                      1, selectedList.toString().length - 1);
                              final parts = removedBrackets.split(', ');

                              var joined =
                                  parts.map((part) => "$part").join(', ');

                              print(joined);
                              MyConstant.strdays = joined;
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
            ],
          ),
        ),
      ],
    );
  }
}
