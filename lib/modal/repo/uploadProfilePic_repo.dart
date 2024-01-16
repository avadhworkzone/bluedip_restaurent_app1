import 'dart:developer';

import 'package:bluedip_restaurent/modal/apiModel/request_model/upload_profile_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/upload_profile_pic_res_model.dart';
import 'package:bluedip_restaurent/modal/services/api_service.dart';
import 'package:bluedip_restaurent/modal/services/base_service.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';

class ProfilePicRepo extends BaseService {
  /// profile pic

  Future<dynamic> profilePicRepo(
      {required UploadProfilePicReqModel body}) async {
    Map<String, dynamic> model = body.toJson();
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: uploadProfilePic,
      body: model,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }

    UploadProfilePicResModel uploadProfilePicResModel =
        UploadProfilePicResModel.fromJson(response);
    return uploadProfilePicResModel;
  }
}
