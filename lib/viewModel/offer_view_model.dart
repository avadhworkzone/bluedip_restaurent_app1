import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/response_model/edit_offer_res_model.dart';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_offer_res_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../modal/apiModel/request_model/add_offer_req_model.dart';
import '../modal/apiModel/request_model/edit_offer_req_model.dart';
import '../modal/apiModel/response_model/common_res_model.dart';
import '../modal/apis/api_response.dart';
import '../modal/repo/offer_repo.dart';

class ManageOfferViewModel extends GetxController {
  ApiResponse addOfferApiResponse = ApiResponse.initial('Initial');
  ApiResponse getOfferApiResponse = ApiResponse.initial('Initial');
  ApiResponse deleteOfferApiResponse = ApiResponse.initial('Initial');
  ApiResponse editOfferApiResponse = ApiResponse.initial('Initial');

  List<OffersData> offerDataList = [];
  int pageNumber = 1;

  clearResponse() {
    offerDataList.clear();
    pageNumber = 1;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });
  }

  /// add offer view model
  Future<void> addOfferViewModel({required AddOfferReqModel body}) async {
    addOfferApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      CommonResponseModel response =
          await ManageOfferRepo().addOfferRepo(model: body);
      addOfferApiResponse = ApiResponse.complete(response);
      log("addOfferApiResponse RES: $response");
    } catch (e) {
      log('addOfferApiResponse.....$e');
      addOfferApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// get offer view model
  Future<void> getOfferViewModel(
      {required String date,
      required String day,
      required int page,
      required int limit}) async {
    getOfferApiResponse = ApiResponse.loading('Loading');
    // update();
    try {
      GetOfferResModel response = await ManageOfferRepo().getOfferRepo(body: {
        "action": "get_offer",
        "date": date,
        "day": day,
        "page": page,
        "limit": limit
      });
      getOfferApiResponse = ApiResponse.complete(response);
      if (response.data == null) {
        offerDataList = [];
      } else {
        offerDataList.addAll(response.data!);
        log("getOfferApiResponse RES: $response");
      }
    } catch (e) {
      log('getOfferApiResponse.....$e');
      getOfferApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// delete offer view model
  Future<void> deleteOfferViewModel(
      {required String offerId, required String cancelReason}) async {
    deleteOfferApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      CommonResponseModel response = await ManageOfferRepo().deleteOfferRepo(
          body: {
            "action": "delete_offer",
            "offer_id": offerId,
            "cancel_reason": cancelReason
          });
      deleteOfferApiResponse = ApiResponse.complete(response);
      log("deleteOfferApiResponse RES: $response");
    } catch (e) {
      log('deleteOfferApiResponse.....$e');
      deleteOfferApiResponse = ApiResponse.error('error');
    }
    update();
  }

  /// edit offer view model
  Future<void> editOfferViewModel({required EditOfferReqModel body}) async {
    editOfferApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      EditOfferResModel response =
          await ManageOfferRepo().editOfferRepo(model: body);
      editOfferApiResponse = ApiResponse.complete(response);
      log("editOfferApiResponse RES: $response");
    } catch (e) {
      log('editOfferApiResponse.....$e');
      editOfferApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
