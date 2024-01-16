import 'dart:developer';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:get/get.dart';
import '../modal/apiModel/request_model/add_resto_location_req_model.dart';
import '../modal/apiModel/request_model/edit_location_req_model.dart';
import '../modal/apiModel/response_model/common_res_model.dart';
import '../modal/apiModel/response_model/get_restaurant_location_res_model.dart';
import '../modal/repo/get_location_repo.dart';
import '../modal/repo/restaurant_location_repo.dart';

class RestaurantsLocationViewModel extends GetxController {
  ApiResponse getRestaurantsLocationApiResponse =
      ApiResponse.initial('Initial');
  ApiResponse editRestaurantsLocationApiResponse =
      ApiResponse.initial('Initial');
  ApiResponse addRestaurantsLocationApiResponse =
      ApiResponse.initial('Initial');

  /// get Restaurant Location View Model
  Future<void> getRestaurantLocationViewModel() async {
    getRestaurantsLocationApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetRestaurantLocation response = await GetLocationRepo()
          .getUserLocationRepo(model: {"action": "get_resto_location"});
      getRestaurantsLocationApiResponse = ApiResponse.complete(response);
      log("getRestaurantsLocationApiResponse RES: $response");
    } catch (e) {
      log('getRestaurantsLocationApiResponse.....$e');
      getRestaurantsLocationApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// post Restaurant Location View Model
  Future<void> editRestaurantLocationViewModel(
      {EditLocationReqModel? model}) async {
    editRestaurantsLocationApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      CommonResponseModel response =
          await EditLocationRepo().editUserLocationRepo(model: model!);
      editRestaurantsLocationApiResponse = ApiResponse.complete(response);
      log("editRestaurantsLocationApiResponse RES: $response");
    } catch (e) {
      log('editRestaurantsLocationApiResponse.....$e');
      editRestaurantsLocationApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// add Location View Model
  Future<void> addRestaurantLocationViewModel(
      {AddRestoLocationReqModel? model}) async {
    addRestaurantsLocationApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      CommonResponseModel response =
          await EditLocationRepo().addUserLocationRepo(model: model!);
      addRestaurantsLocationApiResponse = ApiResponse.complete(response);
      log("addRestaurantsLocationApiResponse RES: $response");
    } catch (e) {
      log('addRestaurantsLocationApiResponse.....$e');
      addRestaurantsLocationApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
