import 'package:bluedip_restaurent/Styles/my_icons.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/sign_up_res_model.dart';
import 'package:bluedip_restaurent/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/back_button.dart';
import '../../Widget/box_shadow.dart';
import '../../Widget/circular_progrss_indicator.dart';
import '../../Widget/common_verify_blue_button.dart';
import '../../modal/apis/api_response.dart';
import '../../utils/enum_utils.dart';
import '../../utils/validation_utils.dart';
import '../../viewModel/auth_view_model.dart';
import 'VerifyEmailOtpScreen.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _selectedFirst = true;
  bool _passwordVisible = false;
  bool checkDigit = false;
  bool checkLetter = false;
  bool checkLowerLetter = false;
  bool checkCharacters = false;
  bool checkSpecialCharacters = false;
  bool isObscure = true;
  bool errorMessage = false;

  RegExp r =
      RegExp("r'^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$");

  bool isButtonEnable = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthViewModel authViewModel = Get.find();

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
                          Text(strRegister,
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

                          // PasswordTextField(textInputAction: TextInputAction.done,),

                          Container(
                            decoration: boxDecoration,
                            child: TextFormField(
                              obscureText: !_passwordVisible,
                              controller: passwordController,
                              validator: (value) {
                                if ((value as String).isEmpty) {
                                  return ValidationMsg.isRequired;
                                }
                                // else {
                                RegExp r3 = RegExp(r'.{8,}');
                                if (r3.hasMatch(value)) {
                                  checkCharacters = true;
                                } else {
                                  checkCharacters = false;
                                }
                                RegExp r1 = RegExp(r'(?=.*[A-Z])');
                                if (r1.hasMatch(value)) {
                                  checkLetter = true;
                                } else {
                                  checkLetter = false;
                                }
                                RegExp r0 = RegExp(r'(?=.*[a-z])');
                                if (r0.hasMatch(value)) {
                                  checkLowerLetter = true;
                                } else {
                                  checkLowerLetter = false;
                                }
                                RegExp r2 = RegExp(r'(?=.*?[0-9])');
                                if (r2.hasMatch(value)) {
                                  checkDigit = true;
                                } else {
                                  checkDigit = false;
                                }
                                RegExp r4 = RegExp(r'(?=.*?[!@#\$&*~])');
                                if (r4.hasMatch(value)) {
                                  checkSpecialCharacters = true;
                                } else {
                                  checkSpecialCharacters = false;
                                }
                                if (r.hasMatch(value)) {
                                  checkLetter = true;
                                  checkCharacters = true;
                                  checkDigit = true;
                                  checkSpecialCharacters = true;
                                }
                                if (checkCharacters == true &&
                                    checkDigit == true &&
                                    checkLetter == true &&
                                    checkSpecialCharacters == true &&
                                    emailController.text.isNotEmpty) {
                                  isButtonEnable = true;
                                } else {
                                  isButtonEnable = false;
                                }
                                // }
                                return null;
                              },
                              style: TextStyle(
                                  color: black_354356,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: fontMavenProMedium,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp),
                              onChanged: (value) {
                                setState(() {
                                  RegExp r3 = RegExp(r'.{8,}');
                                  if (r3.hasMatch(value)) {
                                    checkCharacters = true;
                                  } else {
                                    checkCharacters = false;
                                  }
                                  RegExp r1 = RegExp(r'(?=.*[A-Z])');
                                  if (r1.hasMatch(value)) {
                                    checkLetter = true;
                                  } else {
                                    checkLetter = false;
                                  }
                                  RegExp r0 = RegExp(r'(?=.*[a-z])');
                                  if (r0.hasMatch(value)) {
                                    checkLowerLetter = true;
                                  } else {
                                    checkLowerLetter = false;
                                  }
                                  RegExp r2 = RegExp(r'(?=.*?[0-9])');
                                  if (r2.hasMatch(value)) {
                                    checkDigit = true;
                                  } else {
                                    checkDigit = false;
                                  }
                                  RegExp r4 = RegExp(r'(?=.*?[!@#\$&*~])');
                                  if (r4.hasMatch(value)) {
                                    checkSpecialCharacters = true;
                                  } else {
                                    checkSpecialCharacters = false;
                                  }
                                  if (r.hasMatch(value)) {
                                    checkLetter = true;
                                    checkCharacters = true;
                                    checkDigit = true;
                                    checkSpecialCharacters = true;
                                  }
                                  if (checkCharacters == true &&
                                      checkDigit == true &&
                                      checkLetter == true &&
                                      checkSpecialCharacters == true &&
                                      emailController.text.isNotEmpty) {
                                    isButtonEnable = true;
                                  } else {
                                    isButtonEnable = false;
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                suffixIconConstraints: const BoxConstraints(
                                    minHeight: 24, minWidth: 70),
                                suffixIcon: IconButton(
                                  // icon: Icon(
                                  //   // Based on passwordVisible state choose the icon
                                  //   _passwordVisible
                                  //       ? Icons.visibility
                                  //       : Icons.visibility_off,
                                  //   color: Theme.of(context).primaryColorDark,
                                  // ),
                                  icon: Text(
                                      _passwordVisible
                                          ? "Hide".toUpperCase()
                                          : "Show".toUpperCase(),
                                      style: TextStyle(
                                        color: grey_969da8,
                                        fontFamily: fontMavenProMedium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp,
                                      ),
                                      textAlign: TextAlign.left),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                isDense: true,
                                // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                                border: InputBorder.none,

                                labelStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                    fontFamily: fontMavenProMedium,
                                    fontWeight: FontWeight.w600),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(color: blue_3653f6),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 1),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              cursorColor: Blue_5468ff,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(15),
                              ],
                              textInputAction: TextInputAction.done,
                            ),
                          ),

                          SizedBox(
                            height: 5.w,
                          ),
                          errorMessage == true
                              ? Text(
                                  'Enter Valid Password',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12.sp),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 14.h,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              checkCharacters == true
                                  ? SvgPicture.asset(
                                      icon_selected_circle,
                                      width: 16.w,
                                      height: 16.h,
                                    )
                                  : SvgPicture.asset(
                                      icon_unselected_circle,
                                      width: 16.w,
                                      height: 16.h,
                                    ),
                              SizedBox(
                                width: 6.w,
                              ),
                              // At least 8 characters in length
                              Text("At least 8 characters in length",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProRegular,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              checkLetter == true
                                  ? SvgPicture.asset(
                                      icon_selected_circle,
                                      width: 16.w,
                                      height: 16.h,
                                    )
                                  : SvgPicture.asset(
                                      icon_unselected_circle,
                                      width: 16.w,
                                      height: 16.h,
                                    ),
                              SizedBox(
                                width: 6.w,
                              ),
                              // At least 8 characters in length
                              Text("An uppercase letter",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProRegular,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              checkLowerLetter == true
                                  ? SvgPicture.asset(
                                      icon_selected_circle,
                                      width: 16.w,
                                      height: 16.h,
                                    )
                                  : SvgPicture.asset(
                                      icon_unselected_circle,
                                      width: 16.w,
                                      height: 16.h,
                                    ),
                              SizedBox(
                                width: 6.w,
                              ),
                              // At least 8 characters in length
                              Text("A lowercase letter",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProRegular,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              checkSpecialCharacters == true
                                  ? SvgPicture.asset(
                                      icon_selected_circle,
                                      width: 16.w,
                                      height: 16.h,
                                    )
                                  : SvgPicture.asset(
                                      icon_unselected_circle,
                                      width: 16.w,
                                      height: 16.h,
                                    ),
                              SizedBox(
                                width: 6.w,
                              ),
                              // At least 8 characters in length
                              Text("A special character",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProRegular,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              checkDigit == true
                                  ? SvgPicture.asset(
                                      icon_selected_circle,
                                      width: 16.w,
                                      height: 16.h,
                                    )
                                  : SvgPicture.asset(
                                      icon_unselected_circle,
                                      width: 16.w,
                                      height: 16.h,
                                    ),
                              SizedBox(
                                width: 6.w,
                              ),
                              // At least 8 characters in length
                              Text("A number",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProRegular,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),

                          SizedBox(
                            height: 24.h,
                          ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedFirst = !_selectedFirst;
                                print(
                                    "click thay che value is ---$_selectedFirst");
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.r)),
                                      border: Border.all(
                                          color: _selectedFirst
                                              ? grey_d9dde3
                                              : Blue_5468ff,
                                          width: 1),
                                      color: _selectedFirst
                                          ? const Color(0xffffffff)
                                          : Blue_5468ff),
                                  child: _selectedFirst
                                      ? Icon(
                                          Icons.check,
                                          size: 18.sp,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.check,
                                          size: 18.sp,
                                          color: Colors.white,
                                        ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                // Same as Business address
                                RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          style: TextStyle(
                                              color: black_354356,
                                              fontFamily: fontMavenProRegular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          text: str_i_agree_with),
                                      TextSpan(
                                          style: TextStyle(
                                              color: Blue_5468ff,
                                              fontFamily: fontMavenProRegular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp,
                                              height: 1.5),
                                          text: str_terms_conditions),
                                    ]))
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 40.h,
                          ),

                          CommonVerifyBlueButton(strNext.toUpperCase(),
                              () async {
                            if (_formKey.currentState!.validate()) {
                              if (_selectedFirst == false) {
                                if (checkCharacters == true &&
                                    checkLetter == true &&
                                    checkLowerLetter == true &&
                                    checkSpecialCharacters == true &&
                                    checkDigit == true) {
                                  await authViewModel.signupViewModel(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  if (authViewModel.signUpApiResponse.status ==
                                      Status.COMPLETE) {
                                    SignUpResModel response =
                                        authViewModel.signUpApiResponse.data;
                                    if (response.status == false) {
                                      Get.snackbar('', '${response.message}',
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.white,
                                          backgroundColor: blue_3d56f0);
                                    } else if (response.status == true) {
                                      await PreferenceManagerUtils.setToken(
                                          response.data!.token);

                                      Get.to(VerifyEmailOtpScreen(
                                        id: 1,
                                        otp: response.data!.otp,
                                        emailId: emailController.text,
                                      ))?.then((value) {
                                        emailController.clear();
                                        passwordController.clear();
                                      });
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
                                    //           VerifyEmailOtpScreen(id: 1),
                                    //     ));
                                  }
                                } else {
                                  setState(() {});
                                  errorMessage = true;
                                }
                              } else {
                                Get.snackbar('', 'Please Agree with T&C',
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,
                                    backgroundColor: blue_3d56f0);
                              }
                            }
                          },
                              isButtonEnable == true
                                  ? blue_3653f6
                                  : grey_969da8),
                          SizedBox(
                            height: 40.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GetBuilder<AuthViewModel>(
                builder: (authViewModel) {
                  if (authViewModel.signUpApiResponse.status ==
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
