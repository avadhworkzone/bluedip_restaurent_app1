class AddMoreTimeResModel {
  bool? status;
  String? message;
  Data? data;

  AddMoreTimeResModel({this.status, this.message, this.data});

  AddMoreTimeResModel.fromJson(Map<String, dynamic> json) {
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
  int? orderId;
  int? randomOrderId;
  String? userId;
  String? restaurantId;
  int? offerId;
  String? orderType;
  String? userFullName;
  String? mobileNumber;
  String? time;
  String? specialRequest;
  var noOfGuest;
  String? orderStatus;
  int? orderPreparationTime;
  String? orderAcceptedTime;
  var rejectedReason;
  String? dateCreated;
  String? dateModified;
  int? isDeleted;
  String? status;
  int? isNeedMoreTime;
  int? isOrder;
  String? orderReadyTime;
  String? orderPickupTime;
  var orderRejectedTime;

  Data(
      {this.orderId,
      this.randomOrderId,
      this.userId,
      this.restaurantId,
      this.offerId,
      this.orderType,
      this.userFullName,
      this.mobileNumber,
      this.time,
      this.specialRequest,
      this.noOfGuest,
      this.orderStatus,
      this.orderPreparationTime,
      this.orderAcceptedTime,
      this.rejectedReason,
      this.dateCreated,
      this.dateModified,
      this.isDeleted,
      this.status,
      this.isNeedMoreTime,
      this.isOrder,
      this.orderReadyTime,
      this.orderPickupTime,
      this.orderRejectedTime});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    randomOrderId = json['random_order_id'];
    userId = json['user_id'];
    restaurantId = json['restaurant_id'];
    offerId = json['offer_id'];
    orderType = json['order_type'];
    userFullName = json['user_full_name'];
    mobileNumber = json['mobile_number'];
    time = json['time'];
    specialRequest = json['special_request'];
    noOfGuest = json['no_of_guest'];
    orderStatus = json['order_status'];
    orderPreparationTime = json['order_preparation_time'];
    orderAcceptedTime = json['order_accepted_time'];
    rejectedReason = json['rejected_reason'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    isDeleted = json['is_deleted'];
    status = json['status'];
    isNeedMoreTime = json['is_need_more_time'];
    isOrder = json['is_order'];
    orderReadyTime = json['order_ready_time'];
    orderPickupTime = json['order_pickup_time'];
    orderRejectedTime = json['order_rejected_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['random_order_id'] = this.randomOrderId;
    data['user_id'] = this.userId;
    data['restaurant_id'] = this.restaurantId;
    data['offer_id'] = this.offerId;
    data['order_type'] = this.orderType;
    data['user_full_name'] = this.userFullName;
    data['mobile_number'] = this.mobileNumber;
    data['time'] = this.time;
    data['special_request'] = this.specialRequest;
    data['no_of_guest'] = this.noOfGuest;
    data['order_status'] = this.orderStatus;
    data['order_preparation_time'] = this.orderPreparationTime;
    data['order_accepted_time'] = this.orderAcceptedTime;
    data['rejected_reason'] = this.rejectedReason;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['is_deleted'] = this.isDeleted;
    data['status'] = this.status;
    data['is_need_more_time'] = this.isNeedMoreTime;
    data['is_order'] = this.isOrder;
    data['order_ready_time'] = this.orderReadyTime;
    data['order_pickup_time'] = this.orderPickupTime;
    data['order_rejected_time'] = this.orderRejectedTime;
    return data;
  }
}
