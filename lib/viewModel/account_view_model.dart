import 'dart:developer';
import 'package:bluedip_restaurent/modal/apis/api_response.dart';
import 'package:bluedip_restaurent/modal/repo/account_repo.dart';
import 'package:get/get.dart';

import '../modal/apiModel/response_model/common_res_model.dart';

class AccountViewModel extends GetxController {
  ApiResponse addChargesApiResponse = ApiResponse.initial('Initial');

  /// add charges view model
  Future<void> addChargesViewModel(
      {required String packingCharge,
      required String gst,
      required String cGst,
      required String sGst}) async {
    addChargesApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      CommonResponseModel response = await AccountRepo().addChargesRepo(body: {
        "action": "add_charges",
        "packing_charges": packingCharge,
        "gst": gst,
        "cgst": cGst,
        "sgst": sGst,
      });
      addChargesApiResponse = ApiResponse.complete(response);
      log("addChargesApiResponse RES: $response");
    } catch (e) {
      log('addChargesApiResponse.....$e');
      addChargesApiResponse = ApiResponse.error('error');
    }
    update();
  }
}
