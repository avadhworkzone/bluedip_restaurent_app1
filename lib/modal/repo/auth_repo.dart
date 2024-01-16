import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/response_model/forgot_pass_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/otp_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/resend_otp_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/sign_in_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/sign_up_res_model.dart';
import 'package:bluedip_restaurent/modal/services/api_service.dart';
import 'package:bluedip_restaurent/modal/services/base_service.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';

import '../apiModel/response_model/common_res_model.dart';

class AuthRepo extends BaseService {
  /// sign up repo
  Future<dynamic> signupRepo(Map<String, dynamic> body) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: registerUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    SignUpResModel signUpResModel = SignUpResModel.fromJson(response);
    return signUpResModel;
  }

  /// sign in repo
  Future<dynamic> signInRepo(Map<String, dynamic> body) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: loginUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    SignInResModel signInResModel = SignInResModel.fromJson(response);
    return signInResModel;
  }

  /// otp  repo
  Future<dynamic> otpRepo(Map<String, dynamic> body) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: otpUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    OtpResModel otpResModel = OtpResModel.fromJson(response);
    return otpResModel;
  }

  /// resend otp
  Future<dynamic> resendOtpRepo(Map<String, dynamic> body) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: otpUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    ResendOtpResModel resendOtpResModel = ResendOtpResModel.fromJson(response);
    return resendOtpResModel;
  }

  /// forgot password  repo
  Future<dynamic> forgotPasswordRepo(Map<String, dynamic> body) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: forgotPasswordUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    ForgotPasswordResModel forgotPasswordResModel =
        ForgotPasswordResModel.fromJson(response);
    return forgotPasswordResModel;
  }

  /// reset password repo

  Future<dynamic> resetPasswordRepo(Map<String, dynamic> body) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: resetPasswordUrl,
      body: body,
      withToken: false,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    CommonResponseModel resetPasswordResModel =
        CommonResponseModel.fromJson(response);
    return resetPasswordResModel;
  }
}
