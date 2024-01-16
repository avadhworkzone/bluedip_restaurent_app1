import 'dart:developer';

import 'package:bluedip_restaurent/modal/apiModel/request_model/add_resto_details_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/add_resto_details_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_category_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_resto_detail_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/modal/repo/add_resto_details_repo.dart';
import 'package:get/get.dart';

import '../modal/apiModel/response_model/get_rating_res_model.dart';
import '../modal/apiModel/response_model/get_sub_facility_res_model.dart';
import '../modal/repo/get_resto_detail_repo.dart';

class AddRestaurantsViewModel extends GetxController {
  ApiResponse getCategoryApiResponse = ApiResponse.initial('Initial');
  ApiResponse addRestoDetailsApiResponse = ApiResponse.initial('Initial');
  ApiResponse getSubFacilityApiResponse = ApiResponse.initial('Initial');
  ApiResponse getRatingApiResponse = ApiResponse.initial('Initial');
  ApiResponse getRestoDetailApiResponse = ApiResponse.initial('Initial');

  /// get category view model
  Future<void> getCategoryViewModel({String? action}) async {
    getCategoryApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetCategoryResModel response = await AddRestaurantsDetails()
          .getCategoryRepo(body: {"action": action});
      getCategoryApiResponse = ApiResponse.complete(response);
      log("getCategoryApiResponse RES: $response");
    } catch (e) {
      log('getCategoryApiResponse.....$e');
      getCategoryApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// add resto details view model
  Future<void> addRestoDetails(
      {required AddRestaurantsDetailsReqModel model}) async {
    addRestoDetailsApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      AddResturentDetailsResModel response =
          await AddRestaurantsDetails().addRestoDetailRepo(model: model);
      addRestoDetailsApiResponse = ApiResponse.complete(response);
      log("addRestoDetailsApiResponse RES: $response");
    } catch (e) {
      log('addRestoDetailsApiResponse.....$e');
      addRestoDetailsApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// get sub facility
  Future<void> getSubFacilityViewModel({String? action}) async {
    getSubFacilityApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetSubFacilityResModel response = await AddRestaurantsDetails()
          .getSubFacilityRepo(body: {"action": action});
      getSubFacilityApiResponse = ApiResponse.complete(response);
      log("getSubFacilityApiResponse RES: $response");
    } catch (e) {
      log('getSubFacilityApiResponse.....$e');
      getSubFacilityApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// get rating data
  Future<void> getRatingViewModel({String? action}) async {
    getRatingApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetRatingResModel response =
          await AddRestaurantsDetails().getRatingRepo(body: {"action": action});
      getRatingApiResponse = ApiResponse.complete(response);
      log("getRatingApiResponse RES: $response");
    } catch (e) {
      log('getRatingApiResponse.....$e');
      getRatingApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// get resto detail
  Future<void> getRestoDetailViewModel() async {
    getRestoDetailApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetRestoDetailResModel response = await GetRestoDetailRepo()
          .getRestoDetailRepo(model: {"action": "get_restaurant"});
      getRestoDetailApiResponse = ApiResponse.complete(response);
      log("getRestoDetailApiResponse RES: $response");
    } catch (e) {
      log('getRestoDetailApiResponse.....$e');
      getRestoDetailApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
