import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/response_model/booking_order_count_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/common_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_booking_order_detail_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_booking_order_list.dart';
import 'package:bluedip_restaurent/modal/services/api_service.dart';
import 'package:bluedip_restaurent/modal/services/base_service.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';

class DineInOrderRepo extends BaseService {
  /// get booking order
  Future<dynamic> getBookingOrderRepo(
      {required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getBookingList,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    GetBookingOrderListResModel getBookingOrderListResModel =
        GetBookingOrderListResModel.fromJson(response);
    return getBookingOrderListResModel;
  }

  /// get booking order detail
  Future<dynamic> getBookingOrderDetailRepo(
      {required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getBookingList,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }

    GetBookingOrderDetailResModel getBookingOrderDetailResModel =
        GetBookingOrderDetailResModel.fromJson(response);
    return getBookingOrderDetailResModel;
  }

  /// reject order status
  Future<dynamic> rejectOrderRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getBookingList,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    CommonResponseModel commonResponseModel =
        CommonResponseModel.fromJson(response);
    return commonResponseModel;
  }

  /// change order status
  Future<dynamic> changeOrderStatusRepo(
      {required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getBookingList,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    CommonResponseModel commonResponseModel =
        CommonResponseModel.fromJson(response);
    return commonResponseModel;
  }

  /// order count
  Future<dynamic> bookingOrderCountRepo(
      {required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getBookingList,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    GetBookingOrderCountResModel countOrder =
        GetBookingOrderCountResModel.fromJson(response);
    return countOrder;
  }
}
