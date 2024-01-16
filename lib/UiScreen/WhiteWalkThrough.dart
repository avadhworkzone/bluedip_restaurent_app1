import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_strings.dart';
import '../Widget/Textfield.dart';
import '../Widget/back_button.dart';
import '../Widget/box_shadow.dart';
import '../Widget/common_blue_button.dart';
import '../Widget/common_white_button.dart';
import '../Widget/passwordtextfield.dart';
import '../Widget/toolbar_with_title.dart';

import 'WelcomeView/WalkThroughThird.dart';
import 'WhiteWalkThroughFirst.dart';

class WhiteWalkThrough extends StatefulWidget {
  const WhiteWalkThrough({Key? key}) : super(key: key);

  @override
  State<WhiteWalkThrough> createState() => _WhiteWalkThroughState();
}

class _WhiteWalkThroughState extends State<WhiteWalkThrough> {
  // declare and initizlize the page controller
  final PageController _pageController = PageController(initialPage: 0);

  // the index of the current page
  int _activePage = 0;

  // this list holds all the pages
  // all of them are constructed in the very end of this file for readability
  final List<Widget> _pages = [
    const WhiteWalkThroughFirst(),
    const WhiteWalkThroughFirst(),
    const WhiteWalkThroughFirst()
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: bg_f3f5f9, // navigation bar color
      statusBarColor: bg_f3f5f9, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: bg_f3f5f9,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _activePage = page;
                      });
                    },
                    itemCount: _pages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _pages[index % _pages.length];
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  color: bg_f3f5f9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        _pages.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: InkWell(
                                onTap: () {
                                  _pageController.animateToPage(index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                child: CircleAvatar(
                                  radius: 3,
                                  // check if a dot is connected to the current page
                                  // if true, give it a different color
                                  backgroundColor: _activePage == index
                                      ? Blue_5468ff
                                      : Blue_5468ff.withOpacity(0.5),
                                ),
                              ),
                            )),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
                  child: Column(
                    children: [
                      CommonBlueButton(
                          strRegister.toUpperCase(), () {}, blue_3653f6),
                      SizedBox(
                        height: 18.h,
                      ),
                      CommonWhiteButton(
                          strLogIn.toUpperCase(), () {}, Color(0xffe7e9ff)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
