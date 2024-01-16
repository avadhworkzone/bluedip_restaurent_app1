class GetRestaurantLocation {
  bool? status;
  Data? data;

  GetRestaurantLocation({this.status, this.data});

  GetRestaurantLocation.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  var restoLocationId;
  var restaurantId;
  var geom;
  var country;
  var countryCode;
  var cityName;
  var state;
  var address;
  var pincode;
  var lat;
  var lang;
  var dateCreated;
  var dateModified;
  var status;
  var isDeleted;

  Data(
      {this.restoLocationId,
      this.restaurantId,
      this.geom,
      this.country,
      this.countryCode,
      this.cityName,
      this.state,
      this.address,
      this.pincode,
      this.lat,
      this.lang,
      this.dateCreated,
      this.dateModified,
      this.status,
      this.isDeleted});

  Data.fromJson(Map<String, dynamic> json) {
    restoLocationId = json['resto_location_id'];
    restaurantId = json['restaurant_id'];
    geom = json['geom'];
    country = json['country'];
    countryCode = json['country_code'];
    cityName = json['city_name'];
    state = json['state'];
    address = json['address'];
    pincode = json['pincode'];
    lat = json['lat'];
    lang = json['lang'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    status = json['status'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resto_location_id'] = this.restoLocationId;
    data['restaurant_id'] = this.restaurantId;
    data['geom'] = this.geom;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['city_name'] = this.cityName;
    data['state'] = this.state;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['lat'] = this.lat;
    data['lang'] = this.lang;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['status'] = this.status;
    data['is_deleted'] = this.isDeleted;
    return data;
  }
}
