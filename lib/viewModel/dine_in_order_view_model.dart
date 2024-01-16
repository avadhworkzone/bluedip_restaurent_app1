import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/response_model/booking_order_count_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_booking_order_detail_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_booking_order_list.dart';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/modal/repo/dine_in_order_repo.dart';
import 'package:get/get.dart';
import '../modal/apiModel/response_model/common_res_model.dart';

class DineInOrderViewModel extends GetxController {
  ApiResponse getBookingOrderListApiResponse = ApiResponse.initial('Initial');
  ApiResponse getBookingOrderDetailApiResponse = ApiResponse.initial('Initial');
  ApiResponse rejectOrderStatusApiResponse = ApiResponse.initial('Initial');
  ApiResponse changeStatusApiResponse = ApiResponse.initial('Initial');
  ApiResponse bookingOrderCountApiResponse = ApiResponse.initial('Initial');

  /// get booking order list
  Future<void> getBookingOrderListViewModel(
      {required String orderStatus, String? keyWord}) async {
    getBookingOrderListApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetBookingOrderListResModel response =
          await DineInOrderRepo().getBookingOrderRepo(body: {
        "action": "get_booking_order_list",
        "order_status": orderStatus,
        "keyword": keyWord ?? ""
      });
      getBookingOrderListApiResponse = ApiResponse.complete(response);
      log("getBookingOrderListApiResponse RES: $response");
    } catch (e) {
      log('getBookingOrderListApiResponse.....$e');
      getBookingOrderListApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// get booking order detail
  Future<void> getBookingOrderDetailViewModel({required String orderId}) async {
    getBookingOrderDetailApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetBookingOrderDetailResModel response = await DineInOrderRepo()
          .getBookingOrderDetailRepo(body: {
        "action": "get_booking_order_details",
        "order_id": orderId
      });
      getBookingOrderDetailApiResponse = ApiResponse.complete(response);
      log("getBookingOrderDetailApiResponse RES: $response");
    } catch (e) {
      log('getBookingOrderDetailApiResponse.....$e');
      getBookingOrderDetailApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// reject order status
  Future<void> rejectOrderStatusViewModel(
      {required String orderId, required String rejectReason}) async {
    rejectOrderStatusApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      CommonResponseModel response =
          await DineInOrderRepo().rejectOrderRepo(body: {
        "action": "booking_order_change_status",
        "order_id": orderId,
        "order_status": 'REJECT',
        "rejected_reason": rejectReason
      });
      rejectOrderStatusApiResponse = ApiResponse.complete(response);
      log("rejectOrderStatusApiResponse RES: $response");
    } catch (e) {
      log('rejectOrderStatusApiResponse.....$e');
      rejectOrderStatusApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// change order status
  Future<void> changeOrderStatusViewModel(
      {required String orderId, required String orderStatus}) async {
    changeStatusApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      CommonResponseModel response =
          await DineInOrderRepo().rejectOrderRepo(body: {
        "action": "booking_order_change_status",
        "order_id": orderId,
        "order_status": orderStatus
      });
      changeStatusApiResponse = ApiResponse.complete(response);
      log("changeStatusApiResponse RES: $response");
    } catch (e) {
      log('changeStatusApiResponse.....$e');
      changeStatusApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// booking order count
  Future<void> bookingOrderCountViewModel() async {
    bookingOrderCountApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetBookingOrderCountResModel response = await DineInOrderRepo()
          .bookingOrderCountRepo(body: {"action": "get_booking_order_count"});
      bookingOrderCountApiResponse = ApiResponse.complete(response);
      log("bookingOrderCountApiResponse RES: $response");
    } catch (e) {
      log('bookingOrderCountApiResponse.....$e');
      bookingOrderCountApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
