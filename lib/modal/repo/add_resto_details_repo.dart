import 'dart:developer';

import 'package:bluedip_restaurent/modal/apiModel/request_model/add_resto_details_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/add_resto_details_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_category_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_rating_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_sub_facility_res_model.dart';
import 'package:bluedip_restaurent/modal/services/api_service.dart';
import 'package:bluedip_restaurent/modal/services/base_service.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';

class AddRestaurantsDetails extends BaseService {
  /// get category
  Future<dynamic> getCategoryRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: getCategory, body: body);
    log("=============RES:=========$response");
    if (response == null) {
      return null;
    }

    GetCategoryResModel getCategoryResModel =
        GetCategoryResModel.fromJson(response);
    return getCategoryResModel;
  }

  /// add resto details
  Future<dynamic> addRestoDetailRepo(
      {required AddRestaurantsDetailsReqModel model}) async {
    Map<String, dynamic> body = model.toJson();
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: addRestodetails, body: body);
    log("=============RES:=========$response");
    if (response == null) {
      return null;
    }

    AddResturentDetailsResModel addResturentDetailsResModel =
        AddResturentDetailsResModel.fromJson(response);
    return addResturentDetailsResModel;
  }

  /// get sub facility
  Future<dynamic> getSubFacilityRepo(
      {required Map<String, dynamic> body}) async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: getSubFacility, body: body);
    log("=============RES:=========$response");
    if (response == null) {
      return null;
    }

    GetSubFacilityResModel getSubFacilityResModel =
        GetSubFacilityResModel.fromJson(response);
    return getSubFacilityResModel;
  }

  /// get rating data
  Future<dynamic> getRatingRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        url: getRatingData,
        body: body,
        withToken: true);
    log("=============RES:=========$response");
    if (response == null) {
      return null;
    }

    GetRatingResModel getRatingResModel = GetRatingResModel.fromJson(response);
    return getRatingResModel;
  }
}
