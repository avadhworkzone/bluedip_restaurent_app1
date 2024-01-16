import 'dart:io';
import 'package:bluedip_restaurent/Model_list_logic/AccountModel.dart';
import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/UiScreen/Account/charges/ChargesScreen.dart';
import 'package:bluedip_restaurent/UiScreen/Account/MenuScreen.dart';
import 'package:bluedip_restaurent/UiScreen/Account/MySubscriptionPlan.dart';
import 'package:bluedip_restaurent/UiScreen/Account/order_history/OrderHistory.dart';
import 'package:bluedip_restaurent/UiScreen/Account/PayoutScreen.dart';
import 'package:bluedip_restaurent/UiScreen/Account/location/RestaurantLocation.dart';
import 'package:bluedip_restaurent/UiScreen/Account/SecurityScreen.dart';
import 'package:bluedip_restaurent/UiScreen/Account/TermsAndCondition.dart';
import 'package:bluedip_restaurent/Widget/box_shadow.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_resto_detail_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/viewModel/add_resto_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Styles/my_icons.dart';
import 'AddDetailsEditScreen.dart';
import 'ProfileDetail.dart';
import 'RestaurantHours.dart';
import '../bottomsheets/BottomSheetDelete.dart';
import '../bottomsheets/BottomSheetLogout.dart';
import '../bottomsheets/BottomSheetSupport.dart';
import 'location/locationSettingScreen.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> with TickerProviderStateMixin {
  List<AccountModel> accountList = [
    //  AccountModel(icon_offline_takeaway,"Offline Takeaways"),
    AccountModel(icon_clock_time_account, "Restaurant Hours"),
    AccountModel(icon_menu_account, "Menu"),
    AccountModel(icon_order_history_account, "Order History"),
    AccountModel(icon_my_subscription_account, "My Subscription Plan"),
    AccountModel(icon_location_pin_account, "Restaurant Location"),
    AccountModel(icon_security_account, "Security"),
    AccountModel(icon_list_bullet, "Restaurant Details"),
    AccountModel(icon_charges_account, "Charges"),
    AccountModel(icon_payouts_account, "Payout"),
    AccountModel(icon_help_info_account, "Help & Support"),
    AccountModel(icon_terms_condition_red, "Terms & Conditions"),
    AccountModel(icon_thrash_delete, "Delete Account"),
    AccountModel(icon_log_out_sign, "Log Out"),
  ];
  AddRestaurantsViewModel addRestaurantsViewModel = Get.find();
  GetRestoDetailResModel? res;

  getRestoDetail() async {
    await addRestaurantsViewModel.getRestoDetailViewModel();
  }

  @override
  void initState() {
    getRestoDetail();
    // TODO: implement initState
    super.initState();
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
      body: GetBuilder<AddRestaurantsViewModel>(
        builder: (controller) {
          if (controller.getRestoDetailApiResponse.status == Status.LOADING) {
            return const CircularIndicator();
          }
          if (controller.getRestoDetailApiResponse.status == Status.ERROR) {
            return const ServerError();
          }
          if (controller.getRestoDetailApiResponse.status == Status.COMPLETE) {
            res = controller.getRestoDetailApiResponse.data;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0017191a),
                      offset: Offset(
                        0.0,
                        3.0,
                      ),
                      blurRadius: 21.0,
                      spreadRadius: 0.0,
                    )
                  ],
                ),
                child: Text("Account",
                    style: TextStyle(
                        color: black_354356,
                        fontWeight: FontWeight.w700,
                        fontFamily: fontJosefinSansBold,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.sp),
                    textAlign: TextAlign.left),
              ),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileDetail(),
                                ));
                          },
                          child: Container(
                            decoration: boxDecoration,
                            padding: EdgeInsets.all(14.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: res!.data!.restaurantImg == "" ||
                                          res!.data!.restaurantImg == null
                                      ? Image.asset(
                                          bluedip_app_icon,
                                          width: 92.w,
                                          height: 92.h,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.network(
                                          "${res!.data!.restaurantImg!}",
                                          width: 92.w,
                                          height: 92.h,
                                          fit: BoxFit.fill),
                                  // Image.asset(
                                  //   royal_hotel_img,
                                  //   width: 92.w,
                                  //   height: 92.h,
                                  //   fit: BoxFit.fill,
                                  // ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Hotel Royal
                                      Text(
                                          "${res!.data!.restaurantName}"
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.center),
                                      SizedBox(
                                        height: 8.h,
                                      ),

                                      Row(
                                        children: [
                                          Text("${res!.data!.avg ?? ""}",
                                              style: TextStyle(
                                                  color: black_354356,
                                                  fontFamily:
                                                      fontMavenProMedium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 4.h,
                                          ),
                                          res!.data!.avg == null
                                              ? const SizedBox()
                                              : SvgPicture.asset(
                                                  icon_star,
                                                  width: 20.w,
                                                  height: 20.h,
                                                  color: Blue_5468ff,
                                                )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                          "${res!.data!.restaurantMobileNumber ?? ""}",
                                          style: TextStyle(
                                              color: grey_969da8,
                                              fontFamily: fontMavenProMedium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.center),
                                      // // Edit
                                      // GestureDetector(
                                      //   onTap: (){
                                      //     Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //           builder: (context) => const ProfileDetail(),
                                      //         ));
                                      //   },
                                      //   child: Text(
                                      //       "Edit",
                                      //       style:  TextStyle(
                                      //           color:  blue_3653f6,
                                      //           fontFamily: fontMavenProRegular,
                                      //           fontStyle:  FontStyle.normal,
                                      //           fontSize: 14.sp
                                      //       ),
                                      //       textAlign: TextAlign.left
                                      //   ),
                                      // )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        /*Listview Layout*/
                        Container(
                          decoration: boxDecoration,
                          padding: EdgeInsets.only(
                              left: 14.w, right: 14.w, top: 12.h, bottom: 24.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: accountList.length,
                                  //   padding: EdgeInsets.only(bottom: 10),
                                  itemBuilder: (context, i) => Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print("Click check");
                                              // if(i==0){
                                              //   Navigator.push(
                                              //       context,
                                              //       MaterialPageRoute(
                                              //         builder: (context) =>  OfflineTakeaway(),
                                              //       ));
                                              // }
                                              if (i == 0) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          RestaurantHours(),
                                                    ));
                                              } else if (i == 1) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          MenuScreen(),
                                                    ));
                                              } else if (i == 2) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OrderHistory(),
                                                    ));
                                              } else if (i == 3) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          MySubscriptionPlan(),
                                                    ));
                                              } else if (i == 4) {
                                                requestLocationPermission();
                                              } else if (i == 5) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          SecurityScreen(),
                                                    ));
                                              } else if (i == 6) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddDetailsEditScreen(),
                                                    ));
                                              } else if (i == 7) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChargesScreen(),
                                                    ));
                                              } else if (i == 8) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PayoutScreen(),
                                                    ));
                                              } else if (i == 9) {
                                                selectSupport(context);
                                              } else if (i == 10) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TermsAndCondition(),
                                                    ));
                                              } else if (i == 11) {
                                                selectDelete(context);
                                              } else if (i == 12) {
                                                selectLogout(context);
                                              }
                                            },
                                            child: Container(
                                              color: Colors.white,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 40.w,
                                                    height: 40.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(11.r),
                                                        color:
                                                            Color(0xfff3f5f9)),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(9.r),
                                                      child: SvgPicture.asset(
                                                          accountList[i].icon),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ),
                                                  // Restaurant Hours
                                                  Text(accountList[i].title,
                                                      style: TextStyle(
                                                          color: black_354356,
                                                          fontFamily:
                                                              fontMavenProMedium,
                                                          fontSize: 15.sp),
                                                      textAlign: TextAlign.left)
                                                ],
                                              ),
                                            ),
                                          ),
                                          i == accountList.length - 1
                                              ? SizedBox()
                                              : Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 12.h,
                                                    ),
                                                    const Divider(
                                                      thickness: 1,
                                                      height: 0.5,
                                                      indent: 50,
                                                      color: divider_d4dce7,
                                                    ),
                                                  ],
                                                )
                                        ],
                                      )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // App vr. 1.221.11
                        Center(
                          child: Text("App vr. 1.221.11",
                              style: TextStyle(
                                  color: grey_969da8,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: fontMavenProMedium,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp),
                              textAlign: TextAlign.left),
                        ),

                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    ));
  }

  void selectSupport(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r))),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Wrap(
                  children: [BottomSheetSupport()],
                ),
              ));
        });
  }

  void selectLogout(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
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
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13)),
                  child: Column(
                    children: [BottomSheetLogout()],
                  ),
                ),
              ));
        });
  }

  void selectDelete(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (
          BuildContext context,
        ) {
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
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13)),
                  child: Column(
                    children: [BottomSheetDelete()],
                  ),
                ),
              ));
        });
  }
}

Future<void> requestLocationPermission() async {
  final permissionStatus = await Permission.location.status;
  print('permissionStatus:=>$permissionStatus');
  if (await Permission.location.request().isGranted ||
      await Permission.locationWhenInUse.request().isGranted) {
    try {
      final position = await Geolocator.getCurrentPosition();
      Get.to(RestaurantLocation());
      // await PreferenceManagerUtils.setLatitude(position.latitude);
      // await PreferenceManagerUtils.setLongitude(position.longitude);
    } on Exception catch (e) {
      print('LOCATION ERROR :=>$e');
    }
  } else if (await Permission.location.status.isDenied) {
    if (Platform.isAndroid) {
      await Get.to(() => const LocationSettingScreen());
    } else {
      requestLocationPermission();
    }
  } else {
    if (Platform.isAndroid) {
      await Get.to(() => const LocationSettingScreen());
    } else {
      requestLocationPermission();
    }
  }
}
