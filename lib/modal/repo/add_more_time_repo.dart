import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/response_model/add_more_time_res_model.dart';
import 'package:bluedip_restaurent/modal/services/api_service.dart';
import 'package:bluedip_restaurent/modal/services/base_service.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';

class AddMoreTimeRepo extends BaseService {
  /// add more time
  Future<dynamic> addMoreTime({required Map<String, dynamic> body}) async {
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
    AddMoreTimeResModel addMoreTimeResModel =
        AddMoreTimeResModel.fromJson(response);
    return addMoreTimeResModel;
  }
}
