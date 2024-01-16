class GetBookingOrderListResModel {
  bool? status;
  String? message;
  List<Data>? data;

  GetBookingOrderListResModel({this.status, this.message, this.data});

  GetBookingOrderListResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? bookingId;
  int? randomBookingId;
  String? orderType;
  String? userFullName;
  String? mobileNumber;
  String? time;
  String? specialRequest;
  int? noOfGuest;
  var orderStatus;
  String? dateCreated;

  Data(
      {this.bookingId,
      this.randomBookingId,
      this.orderType,
      this.userFullName,
      this.mobileNumber,
      this.time,
      this.specialRequest,
      this.noOfGuest,
      this.orderStatus,
      this.dateCreated});

  Data.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    randomBookingId = json['random_booking_id'];
    orderType = json['order_type'];
    userFullName = json['user_full_name'];
    mobileNumber = json['mobile_number'];
    time = json['time'];
    specialRequest = json['special_request'];
    noOfGuest = json['no_of_guest'];
    orderStatus = json['order_status'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['random_booking_id'] = this.randomBookingId;
    data['order_type'] = this.orderType;
    data['user_full_name'] = this.userFullName;
    data['mobile_number'] = this.mobileNumber;
    data['time'] = this.time;
    data['special_request'] = this.specialRequest;
    data['no_of_guest'] = this.noOfGuest;
    data['order_status'] = this.orderStatus;
    data['date_created'] = this.dateCreated;
    return data;
  }
}
