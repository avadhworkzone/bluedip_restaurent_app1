import 'dart:developer';

import '../../utils/enum_utils.dart';
import 'package:bluedip_restaurent/modal/services/api_service.dart';
import '../apiModel/response_model/get_order_list_res_model.dart';
import '../services/base_service.dart';

class OrderListRepo extends BaseService {
  Future<dynamic> getOrderListRepoModel(
      {required Map<String, dynamic> body}) async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: getOrderList, body: body);
    log("=============RES:=========$response");
    if (response == null) {
      return null;
    }

    GetOrderListResponseModel getOrderListResponseModel =
        GetOrderListResponseModel.fromJson(response);
    return getOrderListResponseModel;
  }
}
