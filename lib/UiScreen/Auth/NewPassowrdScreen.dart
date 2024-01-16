import 'package:bluedip_restaurent/viewModel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/back_button.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/passwordtextfield.dart';
import '../../modal/apiModel/response_model/common_res_model.dart';
import '../../modal/apis/api_response.dart';
import '../AddRestoDetailScreen/AddDetailsScreen.dart';

class NewPassowrdScreen extends StatefulWidget {
  NewPassowrdScreen({Key? key, required this.email, required this.otpId})
      : super(key: key);

  String email;
  String otpId;

  @override
  State<NewPassowrdScreen> createState() => _NewPassowrdScreenState();
}

class _NewPassowrdScreenState extends State<NewPassowrdScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  AuthViewModel authViewModel = Get.find();

  @override
  void initState() {
    // newPasswordController.text = "";
    // confirmPasswordController.text = "";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: bg_f3f5f9, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return Scaffold(
      backgroundColor: bg_f3f5f9,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(left: 12.w),
                    //   child: back_button(),
                    // ),

                    SizedBox(
                      height: 26.h,
                    ),
                    // Log In
                    Text(strSetNewPassword,
                        style: TextStyle(
                            color: black_354356,
                            fontWeight: FontWeight.w700,
                            fontFamily: fontJosefinSansBold,
                            fontStyle: FontStyle.normal,
                            fontSize: 28.sp),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 24.h,
                    ),
                    // Title
                    Text(strNewPassword,
                        style: TextStyle(
                            color: black_354356,
                            fontStyle: FontStyle.normal,
                            fontFamily: fontMavenProRegular,
                            fontSize: 14.sp),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 6.h,
                    ),

                    PasswordTextField(
                      textInputAction: TextInputAction.next,
                      controller: newPasswordController,
                    ),

                    SizedBox(
                      height: 20.h,
                    ),

                    // Title
                    Text(strConfirmNewPassword,
                        style: TextStyle(
                            color: black_354356,
                            fontStyle: FontStyle.normal,
                            fontFamily: fontMavenProRegular,
                            fontSize: 14.sp),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 6.h,
                    ),

                    PasswordTextField(
                        textInputAction: TextInputAction.done,
                        controller: confirmPasswordController),

                    SizedBox(
                      height: 40.h,
                    ),

                    CommonBlueButton(strSubmit, () async {
                      // if (newPasswordController.text ==
                      //     confirmPasswordController.text) {
                      // } else {
                      if (newPasswordController.text.isNotEmpty) {
                        if (newPasswordController.text !=
                            confirmPasswordController.text) {
                          Get.snackbar('', 'Password must be same',
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.white,
                              backgroundColor: blue_3d56f0);
                        } else {
                          await authViewModel.resetPasswordViewModel(
                              emailId: widget.email,
                              otpId: widget.otpId,
                              newPassword: newPasswordController.text);
                          if (authViewModel.resetPasswordApiResponse.status ==
                              Status.COMPLETE) {
                            CommonResponseModel response =
                                authViewModel.resetPasswordApiResponse.data;
                            if (response.status == false) {
                              Get.snackbar('', '${response.message}',
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  backgroundColor: blue_3d56f0);
                            } else {
                              Get.offAll(AddDetailsScreen())?.then((value) {
                                newPasswordController.clear();
                                confirmPasswordController.clear();
                              });
                              // Navigationor.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => AddDetailsScreen(),
                              //     ));
                            }
                          }
                        }
                      } else {
                        await authViewModel.resetPasswordViewModel(
                            emailId: widget.email,
                            otpId: widget.otpId,
                            newPassword: newPasswordController.text);
                        if (authViewModel.resetPasswordApiResponse.status ==
                            Status.COMPLETE) {
                          CommonResponseModel response =
                              authViewModel.resetPasswordApiResponse.data;
                          if (response.status == false) {
                            Get.snackbar('', '${response.message}',
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.white,
                                backgroundColor: blue_3d56f0);
                          } else {
                            Get.offAll(AddDetailsScreen())?.then((value) {
                              newPasswordController.clear();
                              confirmPasswordController.clear();
                            });

                            // Navigationor.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => AddDetailsScreen(),
                            //     ));
                          }
                        }
                      }

                      // }
                    }, blue_3653f6),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
