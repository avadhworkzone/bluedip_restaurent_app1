import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/response_model/forgot_pass_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/otp_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/resend_otp_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/sign_up_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/modal/repo/auth_repo.dart';
import 'package:get/get.dart';

import '../modal/apiModel/response_model/common_res_model.dart';
import '../modal/apiModel/response_model/sign_in_res_model.dart';

class AuthViewModel extends GetxController {
  ApiResponse signUpApiResponse = ApiResponse.initial('Initial');
  ApiResponse signInApiResponse = ApiResponse.initial('Initial');
  ApiResponse otpApiResponse = ApiResponse.initial('Initial');
  ApiResponse forgotPasswordApiResponse = ApiResponse.initial('Initial');
  ApiResponse resetPasswordApiResponse = ApiResponse.initial('Initial');
  ApiResponse resendOtpApiResponse = ApiResponse.initial('Initial');

  ///  sign up view model

  Future<void> signupViewModel({String? email, String? password}) async {
    signUpApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      SignUpResModel response = await AuthRepo()
          .signupRepo({"email_id": email, "password": password});
      signUpApiResponse = ApiResponse.complete(response);
      log("signUpApiResponse RES: $response");
    } catch (e) {
      log('signUpApiResponse.....$e');
      signUpApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///  sign in view model

  Future<void> signInViewModel({String? email, String? password}) async {
    signInApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      SignInResModel response = await AuthRepo()
          .signInRepo({"email_id": email, "password": password});
      signInApiResponse = ApiResponse.complete(response);
      log("signInApiResponse RES: $response");
    } catch (e) {
      log('signInApiResponse.....$e');
      signInApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///  otp view model

  Future<void> otpViewModel(
      {String? action,
      String? type,
      String? emailId,
      String? secretOtp}) async {
    otpApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      OtpResModel response = await AuthRepo().otpRepo({
        "action": action,
        "type": type,
        "email_id": emailId,
        "secret_otp": secretOtp
      });
      otpApiResponse = ApiResponse.complete(response);
      log("otpApiResponse RES: $response");
    } catch (e) {
      log('otpApiResponse.....$e');
      otpApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// resend otp
  Future<void> resendOtpViewModel(
      {String? action, String? type, String? emailId}) async {
    resendOtpApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      ResendOtpResModel response = await AuthRepo()
          .resendOtpRepo({"action": action, "type": type, "email_id": emailId});
      resendOtpApiResponse = ApiResponse.complete(response);
      log("resendOtpApiResponse RES: $response");
    } catch (e) {
      log('resendOtpApiResponse.....$e');
      resendOtpApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///  forgot password view model

  Future<void> forgotPasswordViewModel({String? emailId}) async {
    forgotPasswordApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      ForgotPasswordResModel response =
          await AuthRepo().forgotPasswordRepo({"email_id": emailId});
      forgotPasswordApiResponse = ApiResponse.complete(response);
      log("forgotPasswordApiResponse RES: $response");
    } catch (e) {
      log('forgotPasswordApiResponse.....$e');
      forgotPasswordApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///  reset password view model

  Future<void> resetPasswordViewModel(
      {String? emailId, String? otpId, String? newPassword}) async {
    resetPasswordApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      CommonResponseModel response = await AuthRepo().resetPasswordRepo(
          {"email_id": emailId, "otp_id": otpId, "new_password": newPassword});
      resetPasswordApiResponse = ApiResponse.complete(response);
      log("resetPasswordApiResponse RES: $response");
    } catch (e) {
      log('resetPasswordApiResponse.....$e');
      resetPasswordApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
