class GetOrderCountResModel {
  bool? status;
  String? message;
  Data? data;

  GetOrderCountResModel({this.status, this.message, this.data});

  GetOrderCountResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? viewedOrderList;
  int? preparing;
  int? ready;
  int? pickedUp;

  Data({this.viewedOrderList, this.preparing, this.ready, this.pickedUp});

  Data.fromJson(Map<String, dynamic> json) {
    viewedOrderList = json['viewed_order_list'];
    preparing = json['preparing'];
    ready = json['ready'];
    pickedUp = json['picked_up'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['viewed_order_list'] = this.viewedOrderList;
    data['preparing'] = this.preparing;
    data['ready'] = this.ready;
    data['picked_up'] = this.pickedUp;
    return data;
  }
}
