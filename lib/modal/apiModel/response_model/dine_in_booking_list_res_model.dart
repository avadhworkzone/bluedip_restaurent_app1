class DineInBookingListResModel {
  bool? status;
  String? message;
  List<Data>? data;

  DineInBookingListResModel({this.status, this.message, this.data});

  DineInBookingListResModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? orderStatus;
  String? userFullName;
  String? mobileNumber;
  String? bookingTime;
  int? noOfGuest;
  String? dateCreated;

  Data(
      {this.bookingId,
      this.randomBookingId,
      this.userId,
      this.orderStatus,
      this.userFullName,
      this.mobileNumber,
      this.bookingTime,
      this.noOfGuest,
      this.dateCreated});

  Data.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    randomBookingId = json['random_booking_id'];
    userId = json['user_id'];
    orderStatus = json['order_status'];
    userFullName = json['user_full_name'];
    mobileNumber = json['mobile_number'];
    bookingTime = json['booking_time'];
    noOfGuest = json['no_of_guest'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['random_booking_id'] = this.randomBookingId;
    data['user_id'] = this.userId;
    data['order_status'] = this.orderStatus;
    data['user_full_name'] = this.userFullName;
    data['mobile_number'] = this.mobileNumber;
    data['booking_time'] = this.bookingTime;
    data['no_of_guest'] = this.noOfGuest;
    data['date_created'] = this.dateCreated;
    return data;
  }
}
