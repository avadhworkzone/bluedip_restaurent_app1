import 'package:bluedip_restaurent/UiScreen/OrderDetailPreparingFinal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_font.dart';
import '../../Styles/my_icons.dart';

class BottomSheetOrderLate extends StatefulWidget {
  const BottomSheetOrderLate({Key? key}) : super(key: key);

  @override
  State<BottomSheetOrderLate> createState() => _BottomSheetOrderLateState();
}

class _BottomSheetOrderLateState extends State<BottomSheetOrderLate> {
  List<OfferModel> offerList = [
    OfferModel("Order ID #123113"),
    OfferModel("Order ID #123113"),
  ];
  int mySelectConsultation = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  primary: false,
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  itemCount: offerList.length,
                  itemBuilder: (context, i) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OrderDetailPreparingFinal(),
                              ));
                        },
                        child: Container(
                            margin: EdgeInsets.only(bottom: 16.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(width: 1, color: grey_d9dde3),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(14.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Order ID #123113
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(offerList[i].title,
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily:
                                                    fontMavenProProSemiBold,
                                                fontSize: 15.sp),
                                            textAlign: TextAlign.left),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              style: TextStyle(
                                                  color: light_black_5f6d7b,
                                                  fontFamily:
                                                      fontMavenProRegular,
                                                  fontSize: 14.sp),
                                              text: "Pickup at: "),
                                          TextSpan(
                                              style: TextStyle(
                                                  color: Blue_5468ff,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  fontSize: 14.sp),
                                              text: "9:00 PM")
                                        ])),
                                      ],
                                    ),

                                    Text("Placed \n30 mint ago",
                                        style: TextStyle(
                                            color: red_d9534f,
                                            fontFamily: fontMavenProRegular,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.right)
                                  ],
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffedf0ff),
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                      ),
                                      child: // x1
                                          Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 4.h),
                                        child: Text("x1",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.left),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    // Paneer Masala
                                    Expanded(
                                      flex: 1,
                                      child: Text("Paneer Masala",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                    ),
                                    // 250
                                    Row(
                                      children: [
                                        Image.asset(
                                          icon_rupee_slim,
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                        Text("250",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily:
                                                    fontMavenProProSemiBold,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.left),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffedf0ff),
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                      ),
                                      child: // x1
                                          Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 4.h),
                                        child: Text("x2",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily: fontMavenProMedium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.left),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    // Paneer Masala
                                    Expanded(
                                      flex: 1,
                                      child: Text("Masala Papad",
                                          style: TextStyle(
                                              color: black_354356,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                    ),
                                    // 250
                                    Row(
                                      children: [
                                        Image.asset(
                                          icon_rupee_slim,
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                        Text("50",
                                            style: TextStyle(
                                                color: black_354356,
                                                fontFamily:
                                                    fontMavenProProSemiBold,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.left),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )),
                      )),
            ],
          )
        ]);
  }
}
