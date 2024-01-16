import 'dart:developer';
import 'package:bluedip_restaurent/modal/services/api_service.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';
import '../../UiScreen/AddRestoDetailScreen/add_resto_location.dart';
import '../apiModel/request_model/add_resto_location_req_model.dart';
import '../apiModel/request_model/edit_location_req_model.dart';
import '../apiModel/response_model/common_res_model.dart';
import '../services/base_service.dart';

class EditLocationRepo extends BaseService {
  /// post user location
  Future<dynamic> editUserLocationRepo(
      {required EditLocationReqModel model}) async {
    Map<String, dynamic> body = model.toJson();
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getRestoLocation,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    CommonResponseModel userLocationResModel =
        CommonResponseModel.fromJson(response);
    return userLocationResModel;
  }

  /// add user location
  Future<dynamic> addUserLocationRepo(
      {required AddRestoLocationReqModel model}) async {
    Map<String, dynamic> body = model.toJson();
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getRestoLocation,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    CommonResponseModel userLocationResModel =
        CommonResponseModel.fromJson(response);
    return userLocationResModel;
  }
}
