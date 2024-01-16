class GetBookingOrderCountResModel {
  bool? status;
  String? message;
  Data? data;

  GetBookingOrderCountResModel({this.status, this.message, this.data});

  GetBookingOrderCountResModel.fromJson(Map<String, dynamic> json) {
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
  int? incoming;
  int? accept;
  int? ongoing;

  Data({this.incoming, this.accept, this.ongoing});

  Data.fromJson(Map<String, dynamic> json) {
    incoming = json['incoming'];
    accept = json['accept'];
    ongoing = json['ongoing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['incoming'] = this.incoming;
    data['accept'] = this.accept;
    data['ongoing'] = this.ongoing;
    return data;
  }
}
