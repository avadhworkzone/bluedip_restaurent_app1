/*
 *  Copyright 2020 mailto:chaobinwu89@gmail.com
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import 'package:bluedip_restaurent/Styles/my_colors.dart';
import 'package:bluedip_restaurent/UiScreen/AddRestoDetailScreen/DetailPage1.dart';

import 'package:bluedip_restaurent/UiScreen/DetailPage5.dart';
import 'package:bluedip_restaurent/UiScreen/DineIn/DineIn.dart';
import 'package:bluedip_restaurent/UiScreen/Auth/ForgotPasswordScreen.dart';
import 'package:bluedip_restaurent/UiScreen/home/Homepage.dart';
import 'package:bluedip_restaurent/UiScreen/Auth/LoginScreen.dart';
import 'package:bluedip_restaurent/UiScreen/TakeaWay/Takeaways.dart';
import 'package:bluedip_restaurent/viewModel/bottom_view_model.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Styles/my_font.dart';
import '../../Styles/my_icons.dart';
import '../../Widget/blue_box_shadow.dart';
import '../../Widget/box_shadow.dart';
import '../Account/Account.dart';
import '../Offers/BluedipDeal.dart';

import '../Auth/RegisterScreen.dart';
import '../TestOne.dart';

class LatestBottomNavigationScreen extends StatefulWidget {
  const LatestBottomNavigationScreen({super.key});

  @override
  State createState() => _State();
}

class _State extends State<LatestBottomNavigationScreen> {
  // int _currentIndex = 0;

  BottomViewModel bottomViewModel = Get.find();

  final tabs = [
    Homepage(),
    const Takeaways(),
    const BluedipDeal(),
    const DineIn(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return Scaffold(
      body: tabs[bottomViewModel.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Blue_5468ff,
        unselectedItemColor: grey_9db2ce,
        selectedLabelStyle: TextStyle(
            fontFamily: fontMavenProMedium,
            fontSize: 12.sp,
            color: Blue_5468ff),
        unselectedLabelStyle: TextStyle(
            fontFamily: fontMavenProMedium,
            fontSize: 12.sp,
            color: grey_9db2ce),
        currentIndex: bottomViewModel.currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                icon_offer,
                width: 22.5,
                height: 22.5,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                icon_offer,
                width: 22.5,
                height: 22.5,
                color: Blue_5468ff,
              ),
            ),
            label: "Offer",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                icon_takeaway,
                width: 22.5,
                height: 22.5,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                icon_takeaway,
                width: 22.5,
                height: 22.5,
                color: Blue_5468ff,
              ),
            ),
            label: "Takeaway",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.asset(
                icon_logo_third,
                width: 55,
                height: 55,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.asset(
                icon_logo_third,
                width: 55,
                height: 55,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                icon_dinein,
                width: 22.5,
                height: 22.5,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                icon_dinein,
                width: 22.5,
                height: 22.5,
                color: Blue_5468ff,
              ),
            ),
            label: "Dine-in",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                icon_profile,
                width: 22.5,
                height: 22.5,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                icon_profile,
                width: 22.5,
                height: 22.5,
                color: Blue_5468ff,
              ),
            ),
            label: "Account",
          ),
        ],
        onTap: (index) {
          setState(() {
            bottomViewModel.currentIndex = index;
          });
        },
      ),
      // bottomNavigationBar: ConvexAppBar(
      //   style: TabStyle.fixed,
      //   backgroundColor: Colors.white,
      //   activeColor: Blue_5468ff,
      //   color:Color(0xff9db2ce),
      //
      //   items: [
      //
      //     TabItem(icon: SvgPicture.asset(icon_offer,), title: 'Offer',fontFamily: fontMavenProMedium,isIconBlend: true,),
      //
      //     TabItem(icon: SvgPicture.asset(icon_takeaway,), title: 'Takeaway',fontFamily: fontMavenProMedium,isIconBlend: true),
      //
      //     TabItem(icon:  Image.asset(icon_logo_third,fit: BoxFit.fill,)),
      //
      //     TabItem(icon: SvgPicture.asset(icon_dinein), title: 'Dinein',fontFamily: fontMavenProMedium,isIconBlend: true),
      //
      //     TabItem(icon: SvgPicture.asset(icon_profile), title: 'Profile',fontFamily: fontMavenProMedium,isIconBlend: true),
      //   ],
      //   initialActiveIndex: 0,
      //   onTap: (int i) => {
      //     setState(() {
      //       _currentIndex = i;
      //     })
      //   },
      // ),
    );
  }
}
