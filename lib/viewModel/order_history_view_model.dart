import 'dart:developer';

import 'package:bluedip_restaurent/modal/apiModel/request_model/dine_in_history_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/request_model/tack_order_history_req_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/dine_in_booking_list_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/tackaway_history_order_list.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/tackaway_order_detail_res_model.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/modal/repo/dine_in_order_history.dart';
import 'package:bluedip_restaurent/modal/repo/dine_in_order_repo.dart';
import 'package:get/get.dart';

import '../modal/apiModel/response_model/dine_in_order_history.dart';
import '../modal/apiModel/response_model/order_history_detail_res_model.dart';
import '../modal/repo/tack_order_history_repo.dart';

class OrderHistoryViewModel extends GetxController {
  ApiResponse tOrderHistoryApiResponse = ApiResponse.initial('Initial');
  ApiResponse dOrderHistoryApiResponse = ApiResponse.initial('Initial');
  ApiResponse tHistoryDetailApiResponse = ApiResponse.initial('Initial');
  ApiResponse dHistoryDetailApiResponse = ApiResponse.initial('Initial');

  ///tack away view model
  Future<void> tOrderHistoryViewModel(
      {required TackAwayOrderHistoryListReqModel body}) async {
    tOrderHistoryApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      TackAwayOrderHistoryListResModel response =
          await TackAwayOrderHistory().tackOrderHistoryRepo(model: body);
      tOrderHistoryApiResponse = ApiResponse.complete(response);
      log("tOrderHistoryApiResponse RES: $response");
    } catch (e) {
      log('tOrderHistoryApiResponse.....$e');
      tOrderHistoryApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// dine in view model
  Future<void> dOrderHistoryViewModel(
      {required DineInOrderHistoryListReqModel body}) async {
    dOrderHistoryApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      DineInBookingListResModel response =
          await DineInOrderHistory().dineInHistoryRepo(model: body);
      dOrderHistoryApiResponse = ApiResponse.complete(response);
      log("dOrderHistoryApiResponse RES: $response");
    } catch (e) {
      log('dOrderHistoryApiResponse.....$e');
      dOrderHistoryApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// tack away history detail view model
  Future<void> tOrderHistoryDetailViewModel({required String orderId}) async {
    tHistoryDetailApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      OrderHistoryDetailResModel response = await TackAwayOrderHistory()
          .tackOrderHistoryDetailRepo(body: {
        "action": "takeaway_history_order_details",
        "order_id": orderId
      });
      tHistoryDetailApiResponse = ApiResponse.complete(response);
      log("tHistoryDetailApiResponse RES: $response");
    } catch (e) {
      log('tHistoryDetailApiResponse.....$e');
      tHistoryDetailApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// dine in history detail view model
  Future<void> dOrderHistoryDetailViewModel({required String orderId}) async {
    dHistoryDetailApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      DineInHistoryDetailResModel response = await DineInOrderHistory()
          .dineInHistoryDetailRepo(body: {
        "action": "dine_in_history_booking_details",
        "order_id": orderId
      });
      dHistoryDetailApiResponse = ApiResponse.complete(response);
      log("dHistoryDetailApiResponse RES: $response");
    } catch (e) {
      log('dHistoryDetailApiResponse.....$e');
      dHistoryDetailApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
