import 'package:bluedip_restaurent/UiScreen/Auth/VerifyEmailOtpScreen.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/forgot_pass_res_model.dart';
import 'package:bluedip_restaurent/viewModel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/back_button.dart';
import '../../Widget/circular_progrss_indicator.dart';
import '../../Widget/common_blue_button.dart';
import '../../modal/apis/api_response.dart';
import '../../utils/enum_utils.dart';
import '../../utils/validation_utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    AuthViewModel authViewModel = Get.find();

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
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: back_button(),
                          ),

                          SizedBox(
                            height: 26.h,
                          ),
                          // Log In
                          Text(strForgotPassword,
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
                          Text(strEmail,
                              style: TextStyle(
                                  color: black_354356,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  fontFamily: fontMavenProRegular),
                              textAlign: TextAlign.left),

                          SizedBox(
                            height: 6.h,
                          ),

                          loginTextformField(
                            "",
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            controller: emailController,
                            obscureText: true,
                            onChanged: (value) {},
                            regularExpression: RegularExpression.emailPattern,
                            validationType: ValidationType.Email,
                          ),

                          SizedBox(
                            height: 8.h,
                          ),
                          // We will send 4 digit verification code on registered email address.
                          Text(
                              "We will send 4 digit verification code on registered email address.",
                              style: TextStyle(
                                  color: light_black_5f6d7b,
                                  fontFamily: fontMavenProRegular,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp),
                              textAlign: TextAlign.left),

                          SizedBox(
                            height: 40.h,
                          ),

                          CommonBlueButton(strNext.toUpperCase(), () async {
                            if (_formKey.currentState!.validate()) {
                              await authViewModel.forgotPasswordViewModel(
                                emailId: emailController.text,
                              );
                              ForgotPasswordResModel response =
                                  authViewModel.forgotPasswordApiResponse.data;
                              if (authViewModel
                                      .forgotPasswordApiResponse.status ==
                                  Status.COMPLETE) {
                                if (response.status == false) {
                                  Get.snackbar('', '${response.message}',
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Colors.white,
                                      backgroundColor: blue_3d56f0);
                                } else {
                                  Get.to(VerifyEmailOtpScreen(
                                    id: 0,
                                    otp: response.otp,
                                    emailId: emailController.text,
                                  ));
                                }
                              }
                              // if (authViewModel
                              //         .forgotPasswordApiResponse.status ==
                              //     Status.ERROR) {
                            }
                          }, blue_3653f6),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GetBuilder<AuthViewModel>(
                builder: (authViewModel) {
                  if (authViewModel.forgotPasswordApiResponse.status ==
                      Status.LOADING) {
                    return CircularIndicator();
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
