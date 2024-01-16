import 'dart:developer';
import 'package:bluedip_restaurent/modal/services/api_service.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';
import '../apiModel/response_model/get_restaurant_location_res_model.dart';
import '../services/base_service.dart';

class GetLocationRepo extends BaseService {
  /// get user location
  Future<dynamic> getUserLocationRepo(
      {required Map<String, dynamic> model}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getRestoLocation,
      body: model,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    GetRestaurantLocation getRestaurantLocation =
        GetRestaurantLocation.fromJson(response);
    return getRestaurantLocation;
  }
}
