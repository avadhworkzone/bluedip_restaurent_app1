import 'dart:developer';

import 'package:bluedip_restaurent/modal/services/api_service.dart';
import 'package:bluedip_restaurent/modal/services/base_service.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';

import '../apiModel/response_model/common_res_model.dart';

class AccountRepo extends BaseService {
  /// charges repo
  Future<dynamic> addChargesRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: addCharges,
      body: body,
      withToken: true,
    );
    log("=============RES:=========$response");
    if (response == null) {
      return null;
    }
    CommonResponseModel addChargesResModel =
    CommonResponseModel.fromJson(response);
    return addChargesResModel;
  }
}
