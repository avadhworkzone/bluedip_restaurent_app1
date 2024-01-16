import 'package:bluedip_restaurent/UiScreen/Auth/LoginScreen.dart';
import 'package:bluedip_restaurent/UiScreen/Splash%20screen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/back_button.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/passwordtextfield.dart';
import '../AddRestoDetailScreen/DetailPage2.dart';
import '../AddRestoDetailScreen/DetailPage3.dart';
import '../AddRestoDetailScreen/DetailPage4.dart';
import '../BottomNavigationScreen.dart';
import '../AddRestoDetailScreen/DetailPage1.dart';

import '../DetailPage5.dart';
import '../DetailPage6.dart';
import '../Auth/ForgotPasswordScreen.dart';
import '../bottom_bar/LatestBottomNavigationScreen.dart';

class AddDetailsEditScreen extends StatefulWidget {
  const AddDetailsEditScreen({Key? key}) : super(key: key);

  @override
  State<AddDetailsEditScreen> createState() => _AddDetailsEditScreenState();
}

class _AddDetailsEditScreenState extends State<AddDetailsEditScreen> {
  PageController controller = PageController();

  final List<Widget> _list = <Widget>[
    const Center(child: DetailPage1()),
    const Center(child: DetailPage2()),
    const Center(child: DetailPage3()),
    const Center(child: DetailPage4()),
  ];
  int _curr = 0;

  bool bottomButton = false;

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
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 14.w),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      back_button(),
                      SizedBox(
                        width: 16.3.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          strAddDetails,
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: black_354356,
                              fontFamily: fontJosefinSansBold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bottomButton = true;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 10.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 17.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(color: Blue_5468ff, width: 1),
                          ),
                          child: Text("EDIT",
                              style: TextStyle(
                                  color: Blue_5468ff,
                                  fontFamily: fontMavenProMedium,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp),
                              textAlign: TextAlign.left),
                        ),
                      ),
                      Text(
                        (_curr + 1).toString() + "/" + _list.length.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: black_354356,
                          fontFamily: fontMavenProProSemiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: PageView(
                    children: _list,
                    scrollDirection: Axis.horizontal,
                    // reverse: true,
                    // physics: BouncingScrollPhysics(),
                    controller: controller,
                    onPageChanged: (num) {
                      setState(() {
                        _curr = num;
                      });
                    },
                  ),
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Visibility(
              visible: bottomButton,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: _curr != 3
                    ? CommonBlueButton(strNext.toUpperCase(), () {
                        setState(() {
                          controller.animateToPage(_curr + 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                        });
                      }, blue_3653f6)
                    : CommonBlueButton(strFinish.toUpperCase(), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LatestBottomNavigationScreen(),
                            ));
                      }, blue_3653f6),
              ),
            )));
  }
}
