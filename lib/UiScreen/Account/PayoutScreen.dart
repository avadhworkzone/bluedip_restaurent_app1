import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/UiScreen/AddBankAccount.dart';
import 'package:bluedip_restaurent/UiScreen/PayoutOrderList.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../Model_list_logic/OfferModel.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/back_button.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/passwordtextfield.dart';
import '../../Widget/toolbar_with_title.dart';

import 'ProfileDetail.dart';
import '../bottomsheets/BottomSheetEditBank.dart';

class PayoutScreen extends StatefulWidget {
  const PayoutScreen({Key? key}) : super(key: key);

  @override
  State<PayoutScreen> createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen> {
  bool statusBiometric = false;

  List<OfferModel> offerList = [
    OfferModel("Pending"),
    OfferModel("Paid"),
    OfferModel("failed"),
  ];

  bool addbanklayout = true;
  bool Withdrawlayout = false;
  bool editbanklayout = false;

  bool isPastLayoutList = false;
  bool isNoPayout = true;

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
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToolbarWithTitle("Payout"),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),

                        Container(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                icon_wallet_summery,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Available Balance
                                          Text("Available Balance",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      fontMavenProRegular,
                                                  fontSize: 14.sp,
                                                  letterSpacing: 0.14),
                                              textAlign: TextAlign.left),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          // 1,632.93
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                icon_rupee_slim,
                                                width: 20.w,
                                                height: 20.h,
                                                color: Colors.white,
                                              ),
                                              Text("1,632.93",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          fontJosefinSansBold,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 24.sp),
                                                  textAlign: TextAlign.left),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          // for 10 orders
                                          Text("for 10 orders",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      fontMavenProRegular,
                                                  fontSize: 12.sp,
                                                  letterSpacing: 0.5),
                                              textAlign: TextAlign.left)
                                        ],
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              print("Click check");
                                              addbanklayout = false;
                                              Withdrawlayout = true;
                                            });
                                          },
                                          child: Visibility(
                                            visible: addbanklayout,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: Colors.white),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 18.w,
                                                    vertical: 8),
                                                child: Text("Add Bank",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xfff59237),
                                                        fontFamily:
                                                            fontMavenProMedium,
                                                        fontSize: 15.sp),
                                                    textAlign: TextAlign.left),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: Withdrawlayout,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  selectEditBank(context);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.r),
                                                      color: Colors.white),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 18.w,
                                                            vertical: 8),
                                                    child: Text("Withdraw",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xfff59237),
                                                            fontFamily:
                                                                fontMavenProMedium,
                                                            fontSize: 15.sp),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              // Edit Bank Details
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const AddBankAccount(),
                                                        ));
                                                  });
                                                },
                                                child: Text("Edit Bank Details",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            fontMavenProMedium,
                                                        fontSize: 12.sp),
                                                    textAlign: TextAlign.left),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20.h,
                        ),

                        // Past Payouts
                        Text("Past Payouts",
                            style: TextStyle(
                                color: black_354356,
                                fontFamily: fontMavenProBold,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.sp),
                            textAlign: TextAlign.left),

                        SizedBox(
                          height: 16.h,
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isPastLayoutList = true;
                              isNoPayout = false;
                            });
                          },
                          child: Visibility(
                            visible: isNoPayout,
                            child: Container(
                              color: bg_f3f5f9,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 1.7,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    icon_no_payouts_yet,
                                    width: 300.w,
                                    height: 226.h,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  // No Payout Found
                                  Text("No Payouts yet!",
                                      style: TextStyle(
                                          color: black_354356,
                                          fontFamily: fontJosefinSansBold,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.sp),
                                      textAlign: TextAlign.left),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  // Your all payout request will be list down here.
                                  Text(
                                      "Your all payout request will be \nlist down here.",
                                      style: TextStyle(
                                          color: grey_5f6d7b,
                                          fontFamily: fontMavenProMedium,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.center)
                                ],
                              ),
                            ),
                          ),
                        ),
                        /*past payout list item*/
                        Visibility(
                          visible: isPastLayoutList,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              primary: false,
                              shrinkWrap: true,
                              itemCount: offerList.length,
                              itemBuilder: (context, i) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const PayoutOrderList(),
                                          ));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 16.h),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Order ID #123113
                                                    Text("Trxn Id: 13112131",
                                                        style: TextStyle(
                                                            color: black_354356,
                                                            fontFamily:
                                                                fontMavenProProSemiBold,
                                                            fontSize: 15.sp),
                                                        textAlign:
                                                            TextAlign.left),

                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    // 11 Jun, 2022
                                                    Text("11 Jun, 2022",
                                                        style: TextStyle(
                                                            color:
                                                                light_black_5f6d7b,
                                                            fontFamily:
                                                                fontMavenProRegular,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)
                                                  ],
                                                ),
                                                i == 0
                                                    ? Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.r),
                                                          color:
                                                              Color(0xfff0ad4e),
                                                        ),
                                                        child: // Completed
                                                            Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.w,
                                                                  vertical: 5),
                                                          child: Text(
                                                              offerList[i]
                                                                  .title,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      fontMavenProMedium,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize:
                                                                      12.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left),
                                                        ),
                                                      )
                                                    : Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.r),
                                                          color: i == 1
                                                              ? green_5cb85c
                                                              : red_d9534f,
                                                        ),
                                                        child: // Completed
                                                            Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.w,
                                                                  vertical: 5),
                                                          child: Text(
                                                              offerList[i]
                                                                  .title,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      fontMavenProMedium,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize:
                                                                      12.sp),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // 20 Orders
                                                Text("20 Orders",
                                                    style: TextStyle(
                                                        color: black_354356,
                                                        fontFamily:
                                                            fontMavenProProSemiBold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15.sp),
                                                    textAlign: TextAlign.left),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      icon_rupee_slim,
                                                      width: 10.w,
                                                      height: 10.h,
                                                    ),
                                                    Text("5000",
                                                        style: TextStyle(
                                                            color: black_354356,
                                                            fontFamily:
                                                                fontMavenProProSemiBold,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 15.sp),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void selectEditBank(BuildContext context) {
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
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r))),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Wrap(
                  children: [BottomSheetEditBank()],
                ),
              ));
        });
  }
}
