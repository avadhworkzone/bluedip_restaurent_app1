import 'package:bluedip_restaurent/UiScreen/Auth/ForgotPasswordScreen.dart';
import 'package:bluedip_restaurent/UiScreen/Auth/RegisterScreen.dart';
import 'package:bluedip_restaurent/Widget/circular_progrss_indicator.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/sign_in_res_model.dart';
import 'package:bluedip_restaurent/utils/shared_preference_utils.dart';
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
import '../../Widget/common_blue_button.dart';
import '../../modal/apis/api_response.dart';
import '../../utils/enum_utils.dart';
import '../../utils/validation_utils.dart';
import '../bottom_bar/LatestBottomNavigationScreen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    AuthViewModel authViewModel = Get.find();

    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   systemNavigationBarColor: Colors.white, // navigation bar color
    //   statusBarColor: bg_f3f5f9, // status bar color
    //   statusBarIconBrightness: Brightness.dark, // status bar icons' color
    //   systemNavigationBarIconBrightness:
    //       Brightness.light, //navigation bar icons' color
    // ));
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent, // navigation bar color
        statusBarColor: Colors.transparent, // status bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
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
                            Text(strLogIn,
                                style: TextStyle(
                                    color: black_354356,
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
                              textInputAction: TextInputAction.next,
                              controller: emailController,
                              obscureText: true,
                              onChanged: (value) {},
                              regularExpression: RegularExpression.emailPattern,
                              validationType: ValidationType.Email,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            // Title
                            Text(strPassword,
                                style: TextStyle(
                                    color: black_354356,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp,
                                    fontFamily: fontMavenProRegular),
                                textAlign: TextAlign.left),

                            SizedBox(
                              height: 6.h,
                            ),

                            loginTextformField("",
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                controller: passwordController,
                                obscureText: false,
                                onChanged: (value) {},
                                regularExpression: "",
                                validationType: ValidationType.Password,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPasswordScreen(),
                                        ));
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: 10.w, top: 15.w),
                                    child: Text("Forgot?".toUpperCase(),
                                        style: TextStyle(
                                          color: grey_969da8,
                                          fontFamily: fontMavenProMedium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.left),
                                  ),
                                )),

                            // ForgotWithPasswordTextField(
                            //   textInputAction: TextInputAction.done,
                            // ),

                            // SizedBox(height: 14.h,),
                            // // Hint text
                            // GestureDetector(
                            //   onTap: (){
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => const ForgotPasswordScreen(),
                            //         ));
                            //   },
                            //   child: Align(
                            //     alignment: Alignment.topRight,
                            //     child: Text(
                            //         "Forgot Password?",
                            //         style:  TextStyle(
                            //             color:  grey_969da8,
                            //             fontFamily: fontMavenProMedium,
                            //             fontSize: 14.sp
                            //         ),
                            //         textAlign: TextAlign.right
                            //     ),
                            //   ),
                            // ),

                            SizedBox(
                              height: 40.h,
                            ),

                            CommonBlueButton(strLogIn.toUpperCase(), () async {
                              if (_formKey.currentState!.validate()) {
                                await authViewModel.signInViewModel(
                                    email: emailController.text,
                                    password: passwordController.text);
                                SignInResModel response =
                                    authViewModel.signInApiResponse.data;
                                print('response.status==${response.status}');

                                if (authViewModel.signInApiResponse.status ==
                                    Status.ERROR) {
                                  Get.snackbar('', 'There Must be error',
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Colors.white,
                                      backgroundColor: blue_3d56f0);
                                }
                                if (authViewModel.signInApiResponse.status ==
                                    Status.COMPLETE) {
                                  if (response.status == false) {
                                    print('jchjbfhjbff');

                                    Get.snackbar('', '${response.message}',
                                        snackPosition: SnackPosition.BOTTOM,
                                        colorText: Colors.white,
                                        backgroundColor: blue_3d56f0);
                                  } else if (response.status == true) {
                                    await PreferenceManagerUtils.setToken(
                                        response.data!.token);
                                    print(
                                        'token iss-------->>>${PreferenceManagerUtils.getToken()}');
                                    await PreferenceManagerUtils
                                        .setAlreadyLogin(true);

                                    Get.offAll(LatestBottomNavigationScreen());
                                  } else {
                                    Get.snackbar('', '${response.message}',
                                        snackPosition: SnackPosition.BOTTOM,
                                        colorText: Colors.white,
                                        backgroundColor: blue_3d56f0);
                                  }

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const LatestBottomNavigationScreen(),
                                  //     ));
                                }
                              }
                            }, blue_3653f6),
                            SizedBox(
                              height: 40.h,
                            ),

                            // Don’t have an account? Register
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen(),
                                      ));
                                },
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily: fontMavenProRegular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp,
                                              height: 1.2),
                                          text: "Don’t have an account?"),
                                      TextSpan(
                                          style: TextStyle(
                                              color: Blue_5468ff,
                                              fontFamily:
                                                  fontMavenProProSemiBold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp,
                                              height: 1.5),
                                          text: "\nRegister")
                                    ])),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

// This app is for restaurants, If you are customer Go to Customer App
                    Center(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(
                                    color: black_354356,
                                    fontFamily: fontMavenProRegular,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                text:
                                    "This app is for restaurants, If you are customer"),
                            TextSpan(
                                style: TextStyle(
                                    color: sky_00d9cd,
                                    fontFamily: fontMavenProMedium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp,
                                    height: 1.5),
                                text: "\nGo to Customer App")
                          ])),
                    )
                  ],
                ),
                GetBuilder<AuthViewModel>(
                  builder: (authViewModel) {
                    if (authViewModel.signInApiResponse.status ==
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
      ),
    );
  }
}
