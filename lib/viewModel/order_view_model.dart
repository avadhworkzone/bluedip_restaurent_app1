import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/response_model/add_more_time_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_late_order_list.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_order_count_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/tackaway_order_detail_res_model.dart';
import 'package:bluedip_restaurent/modal/repo/add_more_time_repo.dart';
import 'package:get/get.dart';
import '../modal/apiModel/response_model/common_res_model.dart';
import '../modal/apiModel/response_model/get_order_list_res_model.dart';
import '../modal/apis/api_response.dart';
import '../modal/repo/get_order_list_repo.dart';
import '../modal/repo/order_repo.dart';

class OrderViewModel extends GetxController {
  ApiResponse orderListApiResponse = ApiResponse.initial('Initial');
  ApiResponse orderRejectApiResponse = ApiResponse.initial('Initial');
  ApiResponse orderAcceptApiResponse = ApiResponse.initial('Initial');
  ApiResponse orderReadyPickUpApiResponse = ApiResponse.initial('Initial');
  ApiResponse getOrderCountApiResponse = ApiResponse.initial('Initial');
  ApiResponse addMoreTimeApiResponse = ApiResponse.initial('Initial');
  ApiResponse tackAwayOrderDetailApiResponse = ApiResponse.initial('Initial');
  ApiResponse getLateOrderApiResponse = ApiResponse.initial('Initial');

  /// add offer view model
  Future<void> getOrderListViewModel(
      {required String orderStatus, String? keyword}) async {
    orderListApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetOrderListResponseModel response =
          await OrderListRepo().getOrderListRepoModel(body: {
        "action": "get_order_list",
        "order_status": orderStatus,
        "keyword": keyword ?? ""
      });
      orderListApiResponse = ApiResponse.complete(response);
      log("orderListApiResponse RES: $response");
    } catch (e) {
      log('orderListApiResponse.....$e');
      orderListApiResponse = ApiResponse.error('error');
    }
    update();
  }

  ///reject order view model
  Future<void> orderRejectViewModel(
      {String? id, String? orderStatus, String? reason}) async {
    orderRejectApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      CommonResponseModel response =
          await ManageOrderRepo().rejectOrderRepo(body: {
        "action": 'change_status',
        "order_id": id,
        "order_status": orderStatus,
        "rejected_reason": reason
      });
      orderRejectApiResponse = ApiResponse.complete(response);
      log("orderRejectApiResponse RES: $response");
    } catch (e) {
      log('orderRejectApiResponse.....$e');
      orderRejectApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// accept order view model
  Future<void> acceptOrderViewModel(
      {required String orderId,
      required String orderPreparationTime,
      required String totalPreparationTime}) async {
    orderAcceptApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      CommonResponseModel response =
          await ManageOrderRepo().acceptOrderRepo(body: {
        "action": "change_status",
        "order_id": orderId,
        "order_status": "ACCEPT",
        "order_preparation_time": orderPreparationTime,
        "total_preparation_time": totalPreparationTime
      });
      orderAcceptApiResponse = ApiResponse.complete(response);
      log("orderAcceptApiResponse RES: $response");
    } catch (e) {
      log('orderAcceptApiResponse.....$e');
      orderAcceptApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// order ready / pickup view model
  Future<void> orderReadyPickViewModel(
      {required String orderId, required String orderStatus}) async {
    orderReadyPickUpApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      CommonResponseModel response = await ManageOrderRepo().acceptOrderRepo(
          body: {
            "action": "change_status",
            "order_id": orderId,
            "order_status": orderStatus
          });
      orderReadyPickUpApiResponse = ApiResponse.complete(response);
      log("orderReadyPickUpApiResponse RES: $response");
    } catch (e) {
      log('orderReadyPickUpApiResponse.....$e');
      orderReadyPickUpApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// get order count
  Future<void> getOrderCountViewModel() async {
    getOrderCountApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetOrderCountResModel response = await ManageOrderRepo()
          .orderCountRepo(body: {"action": "get_order_count"});
      getOrderCountApiResponse = ApiResponse.complete(response);
      log("getOrderCountApiResponse RES: $response");
    } catch (e) {
      log('getOrderCountApiResponse.....$e');
      getOrderCountApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// add more time
  Future<void> addMoreTimeViewModel(
      {required String orderId,
      required int moreTime,
      required dynamic orderPreparationTime,
      required dynamic totalPreparationTime}) async {
    addMoreTimeApiResponse = ApiResponse.loading('Loading');
    try {
      AddMoreTimeResModel response = await AddMoreTimeRepo().addMoreTime(body: {
        "action": "need_more_time",
        "order_id": orderId,
        "need_more_time": moreTime,
        "order_preparation_time": orderPreparationTime.toString(),
        "total_preparation_time": totalPreparationTime.toString()
      });
      addMoreTimeApiResponse = ApiResponse.complete(response);
      log("addMoreTimeApiResponse RES: $response");
    } catch (e) {
      log('addMoreTimeApiResponse.....$e');
      addMoreTimeApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// take away order detail
  Future<void> tackAwayOrderDetailViewModel({required String orderId}) async {
    tackAwayOrderDetailApiResponse = ApiResponse.loading('Loading');
    try {
      TakeAwayOrderDetailResModel response = await ManageOrderRepo()
          .tackAwayOrderDetailRepo(
              body: {"action": "get_order_details", "order_id": orderId});
      tackAwayOrderDetailApiResponse = ApiResponse.complete(response);
      log("tackAwayOrderDetailApiResponse RES: $response");
    } catch (e) {
      log('tackAwayOrderDetailApiResponse.....$e');
      tackAwayOrderDetailApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// get late order list
  Future<void> getLateOrderViewModel() async {
    getLateOrderApiResponse = ApiResponse.loading('Loading');
    try {
      GetLateOrderListResModel response = await ManageOrderRepo()
          .getLateOrderListRepo(
              body: {"action":"get_late_order_list"});
      getLateOrderApiResponse = ApiResponse.complete(response);
      log("getLateOrderApiResponse RES: $response");
    } catch (e) {
      log('getLateOrderApiResponse.....$e');
      getLateOrderApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
