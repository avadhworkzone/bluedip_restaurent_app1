class DineInHistoryDetailResModel {
  bool? status;
  String? message;
  Data? data;

  DineInHistoryDetailResModel({this.status, this.message, this.data});

  DineInHistoryDetailResModel.fromJson(Map<String, dynamic> json) {
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
  int? bookingId;
  int? randomBookingId;
  int? offerId;
  String? orderType;
  String? userFullName;
  String? mobileNumber;
  String? bookingTime;
  String? specialRequest;
  int? noOfGuest;
  String? orderStatus;
  var orderCompletedTime;
  String? dateCreated;
  var rejectedReason;
  var userImg;
  String? offerPercentage;

  Data(
      {this.bookingId,
      this.randomBookingId,
      this.offerId,
      this.orderType,
      this.userFullName,
      this.mobileNumber,
      this.bookingTime,
      this.specialRequest,
      this.noOfGuest,
      this.orderStatus,
      this.orderCompletedTime,
      this.dateCreated,
      this.rejectedReason,
      this.userImg,
      this.offerPercentage});

  Data.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    randomBookingId = json['random_booking_id'];
    offerId = json['offer_id'];
    orderType = json['order_type'];
    userFullName = json['user_full_name'];
    mobileNumber = json['mobile_number'];
    bookingTime = json['booking_time'];
    specialRequest = json['special_request'];
    noOfGuest = json['no_of_guest'];
    orderStatus = json['order_status'];
    orderCompletedTime = json['order_completed_time'];
    dateCreated = json['date_created'];
    rejectedReason = json['rejected_reason'];
    userImg = json['user_img'];
    offerPercentage = json['offer_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['random_booking_id'] = this.randomBookingId;
    data['offer_id'] = this.offerId;
    data['order_type'] = this.orderType;
    data['user_full_name'] = this.userFullName;
    data['mobile_number'] = this.mobileNumber;
    data['booking_time'] = this.bookingTime;
    data['special_request'] = this.specialRequest;
    data['no_of_guest'] = this.noOfGuest;
    data['order_status'] = this.orderStatus;
    data['order_completed_time'] = this.orderCompletedTime;
    data['date_created'] = this.dateCreated;
    data['rejected_reason'] = this.rejectedReason;
    data['user_img'] = this.userImg;
    data['offer_percentage'] = this.offerPercentage;
    return data;
  }
}
