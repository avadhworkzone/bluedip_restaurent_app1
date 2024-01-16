import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/back_button.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/passwordtextfield.dart';
import '../../Widget/toolbar_with_title.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    final _uploadmenuController = TextEditingController();
    final _highmarginmenuController = TextEditingController();

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
          ToolbarWithTitle("Menu"),
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

                        // Title
                        Text("Upload Menu (pdf)",
                            style: TextStyle(
                                color: black_354356,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp,
                                fontFamily: fontMavenProRegular),
                            textAlign: TextAlign.left),

                        SizedBox(
                          height: 6.h,
                        ),

                        GestureDetector(
                          onTap: () async {
                            image = await picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              //update UI
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(16.r),
                            decoration: boxDecoration,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Hint text
                                Text("Browse".toUpperCase(),
                                    style: TextStyle(
                                        color: Blue_5468ff,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.right)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        // loginTextformField(
                        //   "",
                        //   keyboardType: TextInputType.text,
                        //   textInputAction: TextInputAction.next,
                        //   controller:_uploadmenuController,
                        //   obscureText: true,
                        //   readOnly: true,
                        //   suffixIcon: // Hint text
                        //   Padding(
                        //     padding: const EdgeInsets.only(top: 15,right: 15),
                        //     child: Text(
                        //         "Browse".toUpperCase(),
                        //         style:  TextStyle(
                        //             color: Blue_5468ff,
                        //             fontFamily: fontMavenProMedium,
                        //             fontStyle:  FontStyle.normal,
                        //             fontSize: 14.sp
                        //         ),
                        //         textAlign: TextAlign.left
                        //     ),
                        //   ),
                        //   onChanged: (value) async {
                        //
                        //     image = await picker.pickImage(source: ImageSource.gallery);
                        //     setState(() {
                        //       print("Checking");
                        //     });
                        //   },
                        // ) ,
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    child: Image.asset(
                                      royal_hotel_img,
                                      width: 164.w,
                                      height: 190.h,
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(icon_cancel_menu),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    child: Image.asset(
                                      royal_hotel_img,
                                      width: 164.w,
                                      height: 190.h,
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(icon_cancel_menu),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        CommonBlueButton(strUPLOAD, () {}, blue_3653f6),

                        SizedBox(
                          height: 44.h,
                        ),

                        // Title
                        Text("High Margin Menu (pdf)",
                            style: TextStyle(
                                color: black_354356,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp,
                                fontFamily: fontMavenProRegular),
                            textAlign: TextAlign.left),

                        SizedBox(
                          height: 6.h,
                        ),

                        GestureDetector(
                          onTap: () async {
                            image = await picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              //update UI
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(16.r),
                            decoration: boxDecoration,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Hint text
                                Text("Browse".toUpperCase(),
                                    style: TextStyle(
                                        color: Blue_5468ff,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.right)
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    child: Image.asset(
                                      royal_hotel_img,
                                      width: 164.w,
                                      height: 190.h,
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(icon_cancel_menu),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    child: Image.asset(
                                      royal_hotel_img,
                                      width: 164.w,
                                      height: 190.h,
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(icon_cancel_menu),
                                )
                              ],
                            )
                          ],
                        ),

                        SizedBox(
                          height: 20.h,
                        ),

                        CommonBlueButton(strUPLOAD, () {}, blue_3653f6),
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
}
