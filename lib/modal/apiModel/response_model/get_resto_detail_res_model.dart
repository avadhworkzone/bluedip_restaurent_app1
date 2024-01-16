class GetRestoDetailResModel {
  bool? status;
  String? message;
  Data? data;

  GetRestoDetailResModel({this.status, this.message, this.data});

  GetRestoDetailResModel.fromJson(Map<String, dynamic> json) {
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
  String? restaurantId;
  String? restaurantName;
  var restaurantImg;
  var restaurantMobileNumber;
  String? dateCreated;
  var avg;

  Data(
      {this.restaurantId,
      this.restaurantName,
      this.restaurantImg,
      this.restaurantMobileNumber,
      this.dateCreated,
      this.avg});

  Data.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    restaurantName = json['restaurant_name'];
    restaurantImg = json['restaurant_img'];
    restaurantMobileNumber = json['restaurant_mobile_number'];
    dateCreated = json['date_created'];
    avg = json['avg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_id'] = this.restaurantId;
    data['restaurant_name'] = this.restaurantName;
    data['restaurant_img'] = this.restaurantImg;
    data['restaurant_mobile_number'] = this.restaurantMobileNumber;
    data['date_created'] = this.dateCreated;
    data['avg'] = this.avg;
    return data;
  }
}
