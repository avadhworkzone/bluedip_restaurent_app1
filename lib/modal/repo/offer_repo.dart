import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/response_model/edit_offer_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_offer_res_model.dart';
import 'package:bluedip_restaurent/modal/services/base_service.dart';
import '../../utils/enum_utils.dart';
import '../apiModel/request_model/add_offer_req_model.dart';
import '../apiModel/request_model/edit_offer_req_model.dart';
import '../apiModel/response_model/common_res_model.dart';
import '../services/api_service.dart';

class ManageOfferRepo extends BaseService {
  /// add offer repo
  Future<dynamic> addOfferRepo({required AddOfferReqModel model}) async {
    Map<String, dynamic> body = model.toJson();
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: manageOffer,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    CommonResponseModel addOfferResModel =
        CommonResponseModel.fromJson(response);
    return addOfferResModel;
  }

  /// get offer repo
  Future<dynamic> getOfferRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: manageOffer,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    GetOfferResModel getOfferResModel = GetOfferResModel.fromJson(response);
    return getOfferResModel;
  }

  /// delete offer
  Future<dynamic> deleteOfferRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: manageOffer,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    CommonResponseModel deleteOfferResModel =
        CommonResponseModel.fromJson(response);
    return deleteOfferResModel;
  }

  /// edit offer
  Future<dynamic> editOfferRepo({required EditOfferReqModel model}) async {
    Map<String, dynamic> body = model.toJson();
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: manageOffer,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    EditOfferResModel editOfferResModel = EditOfferResModel.fromJson(response);
    return editOfferResModel;
  }
}
