class GetBookingOrderDetailResModel {
  bool? status;
  String? message;
  Data? data;

  GetBookingOrderDetailResModel({this.status, this.message, this.data});

  GetBookingOrderDetailResModel.fromJson(Map<String, dynamic> json) {
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
  String? time;
  String? specialRequest;
  int? noOfGuest;
  String? orderStatus;
  String? dateCreated;
  var userImg;
  String? offerPercentage;

  Data(
      {this.bookingId,
      this.randomBookingId,
      this.offerId,
      this.orderType,
      this.userFullName,
      this.mobileNumber,
      this.time,
      this.specialRequest,
      this.noOfGuest,
      this.orderStatus,
      this.dateCreated,
      this.userImg,
      this.offerPercentage});

  Data.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    randomBookingId = json['random_booking_id'];
    offerId = json['offer_id'];
    orderType = json['order_type'];
    userFullName = json['user_full_name'];
    mobileNumber = json['mobile_number'];
    time = json['time'];
    specialRequest = json['special_request'];
    noOfGuest = json['no_of_guest'];
    orderStatus = json['order_status'];
    dateCreated = json['date_created'];
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
    data['time'] = this.time;
    data['special_request'] = this.specialRequest;
    data['no_of_guest'] = this.noOfGuest;
    data['order_status'] = this.orderStatus;
    data['date_created'] = this.dateCreated;
    data['user_img'] = this.userImg;
    data['offer_percentage'] = this.offerPercentage;
    return data;
  }
}
