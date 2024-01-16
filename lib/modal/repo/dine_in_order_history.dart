import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/request_model/dine_in_history_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/dine_in_booking_list_res_model.dart';
import 'package:bluedip_restaurent/modal/services/api_service.dart';
import 'package:bluedip_restaurent/modal/services/base_service.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';

import '../apiModel/response_model/dine_in_order_history.dart';

class DineInOrderHistory extends BaseService {
  ///  dine in order history
  Future<dynamic> dineInHistoryRepo(
      {required DineInOrderHistoryListReqModel model}) async {
    Map<String, dynamic> body = model.toJson();
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: orderHistory,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    DineInBookingListResModel res =
        DineInBookingListResModel.fromJson(response);
    return res;
  }

  /// dine in history detail
  Future<dynamic> dineInHistoryDetailRepo(
      {required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: orderHistory,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    DineInHistoryDetailResModel res =
        DineInHistoryDetailResModel.fromJson(response);
    return res;
  }
}
