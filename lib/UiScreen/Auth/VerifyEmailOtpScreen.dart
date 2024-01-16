import 'dart:async';
import 'package:bluedip_restaurent/UiScreen/Auth/NewPassowrdScreen.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/otp_res_model.dart';
import 'package:bluedip_restaurent/utils/shared_preference_utils.dart';
import 'package:bluedip_restaurent/viewModel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bluedip_restaurent/Styles/my_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import '../../Styles/my_colors.dart';
import '../../Styles/my_strings.dart';
import '../../Widget/Textfield.dart';
import '../../Widget/back_button.dart';
import '../../Widget/circular_progrss_indicator.dart';
import '../../Widget/common_blue_button.dart';
import '../../Widget/common_verify_blue_button.dart';
import '../../Widget/passwordtextfield.dart';
import '../../modal/apiModel/response_model/resend_otp_res_model.dart';
import '../../modal/apis/api_response.dart';
import '../AddRestoDetailScreen/AddDetailsScreen.dart';
import '../bottom_bar/LatestBottomNavigationScreen.dart';

class VerifyEmailOtpScreen extends StatefulWidget {
  int id;
  int? otp;
  String? emailId;
  VerifyEmailOtpScreen({required this.id, this.otp, this.emailId});

  @override
  State<VerifyEmailOtpScreen> createState() => _VerifyEmailOtpScreenState();
}

class _VerifyEmailOtpScreenState extends State<VerifyEmailOtpScreen> {
  bool isDataFill = false;
  AuthViewModel authViewModel = Get.find();
  TextEditingController? controllerPin = TextEditingController();
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 30;
  bool _isRunning = false;
  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(1, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(1, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        print('currentSeconds===${currentSeconds}');
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  Timer? _timer;
  int _remainingTime = 30;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
          _isRunning = false;
        }
      });
    });
    _isRunning = true;
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _isRunning = false;
    }
  }

  @override
  void initState() {
    startTimeout();
    _startTimer();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _stopTimer();
    // TODO: implement dispose
    super.dispose();
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Stack(
            children: [
              // Text('djfkoe')
              Column(
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
                        Text(strVerifyEmail,
                            style: TextStyle(
                                color: black_354356,
                                fontWeight: FontWeight.w700,
                                fontFamily: fontJosefinSansBold,
                                fontStyle: FontStyle.normal,
                                fontSize: 28.sp),
                            textAlign: TextAlign.left),

                        SizedBox(
                          height: 18.h,
                        ),
                        Text('Your Otp is: ${widget.otp}',
                            style: TextStyle(
                                color: black_354356,
                                fontWeight: FontWeight.w700,
                                fontFamily: fontJosefinSansBold,
                                fontStyle: FontStyle.normal,
                                fontSize: 28.sp),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 18.h,
                        ),
                        // 4 digit verification code sent on below email john@xyz.com
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              style: TextStyle(
                                  color: black_354356,
                                  fontFamily: fontMavenProRegular,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp),
                              text:
                                  "4 digit verification code sent on below email"),
                          TextSpan(
                              style: TextStyle(
                                  color: blue_3653f6,
                                  fontFamily: fontMavenProRegular,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp),
                              text: "\n${widget.emailId}")
                        ])),
                        SizedBox(
                          height: 24.h,
                        ),
                        Container(
                          width: Get.width,
                          child: Theme(
                            data: ThemeData(
                              primaryColor: Colors.black,
                              primaryColorDark: Colors.black,
                              focusColor: Colors.black,
                              textSelectionTheme: const TextSelectionThemeData(
                                cursorColor: Colors.black, //thereby
                              ),
                            ),
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontJosefinSansBold,
                                  fontSize: 24.sp),
                              length: 6,
                              controller: controllerPin,
                              obscureText: false,
                              obscuringCharacter: '*',
                              obscuringWidget: null,
                              blinkWhenObscuring: true,
                              animationType: AnimationType.fade,
                              enablePinAutofill: true,
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(15.r),
                                  fieldHeight: 54,
                                  fieldWidth: 54,
                                  borderWidth: 1,
                                  activeFillColor: Colors.white,
                                  inactiveColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  errorBorderColor: Colors.red,
                                  activeColor: Colors.white,
                                  selectedColor: blue_3653f6,
                                  selectedFillColor: Colors.white),
                              cursorColor: blue_3653f6,
                              cursorWidth: 2,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              keyboardType: TextInputType.number,
                              boxShadows: const [
                                BoxShadow(
                                  color: shadow_e5ebf6,
                                  offset: Offset(
                                    0.0,
                                    6.0,
                                  ),
                                  blurRadius: 8.0,
                                  spreadRadius: 0.0,
                                )
                              ],
                              onCompleted: (v) {
                                print("Completed");
                                setState(() {
                                  isDataFill = true;
                                });
                              },
                              onChanged: (value) {
                                print(value);
                                if (value.length == 6) {
                                  setState(() {
                                    isDataFill = true;
                                  });
                                } else {
                                  setState(() {
                                    isDataFill = false;
                                  });
                                }
                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Resend Email
                  Center(
                    child: currentSeconds != 30
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("You can resend OTP in",
                                  style: TextStyle(
                                      color: black_354356,
                                      fontFamily: fontMavenProRegular,
                                      fontSize: 15.sp),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                width: 7.w,
                              ),
                              Text(
                                timerText,
                                style: TextStyle(
                                    color: red_dc3642,
                                    fontFamily: fontMavenProRegular,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp),
                              ),
                            ],
                          )
                        : InkWell(
                            onTap: () async {
                              await authViewModel.resendOtpViewModel(
                                  type: widget.id == 1
                                      ? "new_registration"
                                      : "forgot_password",
                                  action: "resend_otp",
                                  emailId: widget.emailId);
                              ResendOtpResModel response =
                                  authViewModel.resendOtpApiResponse.data;

                              if (authViewModel.resendOtpApiResponse.status ==
                                  Status.COMPLETE) {
                                if (response.status == false) {
                                  Get.snackbar('', '${response.message}',
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Colors.white,
                                      backgroundColor: blue_3d56f0);
                                } else {
                                  widget.otp =
                                      int.parse(response.otp.toString());
                                  startTimeout();
                                  _startTimer();
                                }
                              }
                            },
                            child: Text(strResendOTP,
                                style: TextStyle(
                                    color: black_354356,
                                    fontFamily: fontMavenProRegular,
                                    fontSize: 15.sp),
                                textAlign: TextAlign.center),
                          ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  CommonVerifyBlueButton(strVerify.toUpperCase(), () async {
                    await authViewModel.otpViewModel(
                        type: widget.id == 1
                            ? "new_registration"
                            : "forgot_password",
                        action: "verify_otp",
                        emailId: widget.emailId,
                        secretOtp: controllerPin?.text);
                    OtpResModel response = authViewModel.otpApiResponse.data;

                    if (authViewModel.otpApiResponse.status ==
                        Status.COMPLETE) {
                      if (response.status == false) {
                        Get.snackbar('', '${response.message}',
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Colors.white,
                            backgroundColor: blue_3d56f0);
                      } else {
                        if (widget.id == 1) {
                          await PreferenceManagerUtils.setAlreadySignup(true);
                          PreferenceManagerUtils.getRestoDetailsAdd() == true
                              ? Get.offAll(const LatestBottomNavigationScreen())
                              : Get.offAll(const AddDetailsScreen());
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => AddDetailsScreen(),
                          //     ));
                        } else {
                          Get.offAll(NewPassowrdScreen(
                              email: widget.emailId!,
                              otpId: response.otpCode!));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => NewPassowrdScreen(
                          //           email: widget.emailId!,
                          //           otpId: response.otpCode!),
                          //     ));
                        }
                      }
                    }
                  }, isDataFill == true ? blue_3653f6 : grey_969da8),
                ],
              ),
              GetBuilder<AuthViewModel>(
                builder: (authViewModel) {
                  if (authViewModel.otpApiResponse.status == Status.LOADING ||
                      authViewModel.resendOtpApiResponse.status ==
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
