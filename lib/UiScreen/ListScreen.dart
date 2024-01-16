import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/UiScreen/AddRestoDetailScreen/AddDetailsScreen.dart';
import 'package:bluedip_restaurent/UiScreen/Offers/DeleteDeal.dart';
import 'package:bluedip_restaurent/UiScreen/DineIn/DineInDetailAccepted.dart';
import 'package:bluedip_restaurent/UiScreen/Offers/EditOneTimeDeal.dart';
import 'package:bluedip_restaurent/UiScreen/Auth/LoginScreen.dart';
import 'package:bluedip_restaurent/UiScreen/Account/MenuScreen.dart';
import 'package:bluedip_restaurent/UiScreen/OrderDetailPickup.dart';
import 'package:bluedip_restaurent/UiScreen/OrderDetailPreparing.dart';
import 'package:bluedip_restaurent/UiScreen/Account/order_history/OrderHistory.dart';
import 'package:bluedip_restaurent/UiScreen/Auth/RegisterScreen.dart';
import 'package:bluedip_restaurent/UiScreen/Account/RestaurantHours.dart';
import 'package:bluedip_restaurent/UiScreen/TestChecking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'AddBankAccount.dart';
import 'DineIn/DineInDetailCompleted.dart';
import 'bottomsheets/BottomSheet.dart';
import 'home/BuySubscriptionPlan.dart';
import 'ChangePasswordScreen.dart';
import 'Account/location/EditRestaurantLocation.dart';
import 'Auth/ForgotPasswordScreen.dart';
import 'HomepageTest.dart';
import 'bottom_bar/LatestBottomNavigationScreen.dart';
import 'Account/MySubscriptionPlan.dart';
import 'Account/order_history/OrderHistoryDineInDetail.dart';
import 'OrderHistoryDineInDetailCancelled.dart';
import 'OrderHistoryOfflineDetailCompleted.dart';
import 'OrderHistoryTakeawayDetailCancelled.dart';
import 'PageviewExample.dart';
import 'PaymentFailed.dart';
import 'PaymentSuccess.dart';
import 'PayoutOrderList.dart';
import 'Account/location/RestaurantLocation.dart';
import 'Splash screen/SplashScreen.dart';
import 'TakeawaysTesting.dart';
import 'TestSecond.dart';
import 'WelcomeView/WalkThrough.dart';
import 'WhiteWalkThrough.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Center(
              child: Text(
                "List of Screen",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontFamily: fontJosefinSansBold),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LatestBottomNavigationScreen(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "1.LatestBottomNavigationScreen Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SplashScreen(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "1.Splash Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "2.Login Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "3.Register Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "4.Forgot Password Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const NewPassowrdScreen(),
                //     ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "5.New Password Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const VerifyEmailOtpScreen(),
            //         ));
            //   },
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            //     child: Text(
            //       "6.Verify Email OTP Screen",
            //       style: TextStyle(
            //           color: Colors.black87,
            //           fontFamily: fontMavenProMedium,
            //           fontSize: 16.sp),
            //     ),
            //   ),
            // ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddDetailsScreen(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "7.Add Details Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => BottomNavigationScreen(),
            //         ));
            //   },
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            //     child: Text(
            //       "8.Bottom Navigation Screen",
            //       style: TextStyle(
            //           color: Colors.black87,
            //           fontFamily: fontMavenProMedium,
            //           fontSize: 16.sp),
            //     ),
            //   ),
            // ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditOneTimeDeal(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "9.EditOneTimeDeal Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeleteDeal(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "10.DeleteDeal Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => OrderDetail(),
            //         ));
            //   },
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            //     child: Text(
            //       "11.OrderDetail Screen",
            //       style: TextStyle(
            //           color: Colors.black87,
            //           fontFamily: fontMavenProMedium,
            //           fontSize: 16.sp),
            //     ),
            //   ),
            // ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailPreparing(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "12.OrderDetailPreparing Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailPickup(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "13.OrderDetailPickup Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => OrderDetailFinal(),
            //         ));
            //   },
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            //     child: Text(
            //       "14.OrderDetailFinal Screen",
            //       style: TextStyle(
            //           color: Colors.black87,
            //           fontFamily: fontMavenProMedium,
            //           fontSize: 16.sp),
            //     ),
            //   ),
            // ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomSheetTest(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "15.BottomSheetTest Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => DineInBookingDetail(),
            //         ));
            //   },
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            //     child: Text(
            //       "16.DineInBookingDetail Screen",
            //       style: TextStyle(
            //           color: Colors.black87,
            //           fontFamily: fontMavenProMedium,
            //           fontSize: 16.sp),
            //     ),
            //   ),
            // ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DineInDetailAccepted(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "17.DineInDetailAccepted Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DineInDetailCompleted(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "18.DineInDetailCompleted Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuScreen(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "19.MenuScreen Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RestaurantHours(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "20.RestaurantHours Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderHistory(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "21.OrderHistory Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => OrderDetailTakeawayHistory(),
                //     ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "22.OrderDetailTakeawayHistory Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OrderHistoryTakeawayDetailCancelled(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "23.OrderHistoryTakeawayDetailCancelled Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => OrderHistoryDineInDetail(),
                //     ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "24.OrderHistoryDineInDetail Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderHistoryDineInDetailCancelled(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "25.OrderHistoryDineInDetailCancelled Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "26.ChangePasswordScreen Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddBankAccount(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "27.AddBankAccount Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PayoutOrderList(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "28.PayoutOrderList Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSuccess(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "29.PaymentSuccess Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentFailed(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "30.PaymentFailed Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuySubscriptionPlan(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "31.BuySubscriptionPlan Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RestaurantLocation(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "32.RestaurantLocation Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditRestaurantLocation(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "33.EditRestaurantLocation Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MySubscriptionPlan(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "34.MySubscriptionPlan Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OrderHistoryOfflineDetailCompleted(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "35.OrderHistoryOfflineDetailCompleted Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WalkThrough(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "36.WalkThrough Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WhiteWalkThrough(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "37.WhiteWalkThrough Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TakeawaysTesting(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "36.TakeawaysTesting Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestChecking(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "18.TestChecking Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestSecond(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "18.TestSecond Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomepageTest(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "18.HomepageTest Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageviewExample(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Text(
                  "18.PageviewExample Screen",
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: fontMavenProMedium,
                      fontSize: 16.sp),
                ),
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>  PreferencesSelectTime('Notification Stop Time',
            //               " " as TimeOfDay,
            //               ),
            //         ));
            //   },
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            //     child: Text(
            //       "18.PreferencesSelectTime Screen",
            //       style: TextStyle(
            //           color: Colors.black87,
            //           fontFamily: fontMavenProMedium,
            //           fontSize: 16.sp),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
