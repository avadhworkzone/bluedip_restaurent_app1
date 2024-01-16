import 'dart:developer';
import 'package:bluedip_restaurent/modal/apiModel/response_model/get_resto_detail_res_model.dart';
import 'package:bluedip_restaurent/modal/services/api_service.dart';
import 'package:bluedip_restaurent/modal/services/base_service.dart';
import 'package:bluedip_restaurent/utils/enum_utils.dart';

class GetRestoDetailRepo extends BaseService {
  Future<dynamic> getRestoDetailRepo(
      {required Map<String, dynamic> model}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: addRestodetails,
      body: model,
      withToken: true,
    );

    log("=============RES:=========$response");

    if (response == null) {
      return null;
    }
    GetRestoDetailResModel getRestoResModel =
        GetRestoDetailResModel.fromJson(response);
    return getRestoResModel;
  }
}
