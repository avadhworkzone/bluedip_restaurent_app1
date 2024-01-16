import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_late_order_list.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_order_count_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_order_list_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/tackaway_order_detail_res_model.dart';
import 'package:bluedip_restaurent/modal/services/base_service.dart';
import '../../utils/enum_utils.dart';
import '../apiModel/response_model/common_res_model.dart';
import '../services/api_service.dart';

class ManageOrderRepo extends BaseService {
  /// reject order
  Future<dynamic> rejectOrderRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getOrderList,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    CommonResponseModel commonResModel = CommonResponseModel.fromJson(response);
    return commonResModel;
  }

  /// prepare order
  Future<dynamic> prepareOrderRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getOrderList,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    GetOrderListResponseModel getOrderListResponseModel =
        GetOrderListResponseModel.fromJson(response);
    return getOrderListResponseModel;
  }

  /// accept oreder
  Future<dynamic> acceptOrderRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getOrderList,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    CommonResponseModel commonResModel = CommonResponseModel.fromJson(response);
    return commonResModel;
  }

  /// order count
  Future<dynamic> orderCountRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getOrderList,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    GetOrderCountResModel getOrderCountResModel =
        GetOrderCountResModel.fromJson(response);
    return getOrderCountResModel;
  }

  /// tack away order detail
  Future<dynamic> tackAwayOrderDetailRepo(
      {required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getOrderList,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    TakeAwayOrderDetailResModel takeAwayOrderDetailResModel =
        TakeAwayOrderDetailResModel.fromJson(response);
    return takeAwayOrderDetailResModel;
  }

  /// get late order list
  Future<dynamic> getLateOrderListRepo(
      {required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: getOrderList,
      body: body,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    GetLateOrderListResModel getLateOrderListResModel =
        GetLateOrderListResModel.fromJson(response);
    return getLateOrderListResModel;
  }
}
