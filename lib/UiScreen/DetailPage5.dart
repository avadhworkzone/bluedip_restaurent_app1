import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Model_list_logic/Category_Model.dart';
import '../Styles/my_font.dart';
import '../Styles/my_strings.dart';
import '../Widget/box_shadow.dart';
import '../Widget/common_blue_button.dart';

class DetailPage5 extends StatefulWidget {
  const DetailPage5({Key? key}) : super(key: key);

  @override
  State<DetailPage5> createState() => _DetailPage5State();
}

class _DetailPage5State extends State<DetailPage5> {
  List<CategoryModel> categoryList = [
    CategoryModel("AC", 0),
    CategoryModel("Live Music", 0),
    CategoryModel("Smoking Area", 0),
    CategoryModel("Luxury Dinner", 0),
    CategoryModel("Breakfast", 0),
    CategoryModel("Brunch", 0),
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        primary: false,
                        shrinkWrap: true,
                        itemCount: categoryList.length,
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
                                  Text(categoryList[i].tvTitle,
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.sp),
                                      textAlign: TextAlign.left),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            categoryList[i].type = 1;
                                            print("Click tayu" +
                                                categoryList[i]
                                                    .type
                                                    .toString());
                                            // isYes =false;
                                            // isNo =true;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.7,
                                                  color: categoryList[i].type ==
                                                          1
                                                      ? red_ec3b45
                                                      : grey_d9dde3),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      bottomLeft:
                                                          Radius.circular(
                                                              10.0)),
                                              color: categoryList[i].type == 1
                                                  ? light_red_ffd7d9
                                                  : Colors.white),
                                          child: // No
                                              Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 6),
                                            child: Text("No",
                                                style: TextStyle(
                                                    color:
                                                        categoryList[i].type ==
                                                                1
                                                            ? red_ec3b45
                                                            : grey_969da8,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        fontMavenProMedium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15.sp),
                                                textAlign: TextAlign.left),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            categoryList[i].type = 2;
                                            print("Click");
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.7,
                                                  color:
                                                      categoryList[i].type == 2
                                                          ? green_37c93a
                                                          : grey_d9dde3),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10.0),
                                                      bottomRight:
                                                          Radius.circular(10.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      bottomLeft:
                                                          Radius.circular(0.0)),
                                              color: categoryList[i].type == 2
                                                  ? light_green_e9ffe9
                                                  : Colors.white),
                                          child: // No
                                              Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 6),
                                            child: Text("Yes",
                                                style: TextStyle(
                                                    color:
                                                        categoryList[i].type ==
                                                                2
                                                            ? green_37c93a
                                                            : grey_969da8,
                                                    fontFamily:
                                                        fontMavenProMedium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15.sp),
                                                textAlign: TextAlign.left),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              i == categoryList.length - 1
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
                                          dashGapColor: Colors.transparent,
                                          dashGapRadius: 0.0,
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            CommonBlueButton(strContinue.toUpperCase(), () {}, blue_3653f6),
          ],
        ),
      ),
    );
  }
}
