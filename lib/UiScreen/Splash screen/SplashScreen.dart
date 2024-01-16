import 'dart:async';

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/UiScreen/Account/location/RestaurantLocation.dart';
import 'package:bluedip_restaurent/UiScreen/AddRestoDetailScreen/AddDetailsScreen.dart';
import 'package:bluedip_restaurent/UiScreen/WelcomeView/WalkThrough.dart';
import 'package:bluedip_restaurent/UiScreen/bottom_bar/LatestBottomNavigationScreen.dart';
import 'package:bluedip_restaurent/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Styles/my_strings.dart';
import '../Auth/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    PreferenceManagerUtils.clearPreference();
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    if (PreferenceManagerUtils.getAlreadyLogin() == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const LatestBottomNavigationScreen()));
    } else if (PreferenceManagerUtils.getAlreadySignup() == true &&
        PreferenceManagerUtils.getRestoDetailsAdd() == false) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const AddDetailsScreen()));
    } else if (PreferenceManagerUtils.getRestoDetailsAdd() == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const LatestBottomNavigationScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const WalkThrough()));
    }
  }

  // void navigateUser() async {
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => RestaurantLocation()));
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Blue_5468ff, // navigation bar color
      statusBarColor: Blue_5468ff, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));

    return Scaffold(
      backgroundColor: Blue_5468ff,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 20.h,
                ),

                Image.asset(
                  bluedip_app_icon,
                  width: 103.w,
                  height: 103.h,
                ),

                // Bludip
                Text(strBluedip,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontJosefinSansBold,
                        fontSize: 28.sp),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 4.h,
                ),
                // RESTAURENT
                Text(strRESTAURANT.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontMavenProRegular,
                        fontSize: 15.sp,
                        letterSpacing: 0.7),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          SpinKitCircle(
            color: Colors.white,
            size: 35,
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
