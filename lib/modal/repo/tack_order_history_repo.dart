import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/request_model/tack_order_history_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/tackaway_history_order_list.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/tackaway_order_detail_res_model.dart';
import 'package:bluedip_restaurent/modal/services/api_service.dart';
import 'package:bluedip_restaurent/modal/services/base_service.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';

import '../apiModel/response_model/order_history_detail_res_model.dart';

class TackAwayOrderHistory extends BaseService {
  /// get tack away order history list
  Future<dynamic> tackOrderHistoryRepo(
      {required TackAwayOrderHistoryListReqModel model}) async {
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
    TackAwayOrderHistoryListResModel res =
        TackAwayOrderHistoryListResModel.fromJson(response);
    return res;
  }

  /// tack away order history detail
  Future<dynamic> tackOrderHistoryDetailRepo(
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
    OrderHistoryDetailResModel historyDetailRes =
        OrderHistoryDetailResModel.fromJson(response);
    return historyDetailRes;
  }
}
