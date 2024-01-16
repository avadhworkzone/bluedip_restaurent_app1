class AddRestoLocationReqModel {
  String? action;
  String? country;
  String? countryCode;
  String? cityName;
  String? state;
  String? address;
  String? pincode;
  String? lat;
  String? lang;

  AddRestoLocationReqModel(
      {this.action,
      this.country,
      this.countryCode,
      this.cityName,
      this.state,
      this.address,
      this.pincode,
      this.lat,
      this.lang});

  AddRestoLocationReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    country = json['country'];
    countryCode = json['country_code'];
    cityName = json['city_name'];
    state = json['state'];
    address = json['address'];
    pincode = json['pincode'];
    lat = json['lat'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['city_name'] = this.cityName;
    data['state'] = this.state;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['lat'] = this.lat;
    data['lang'] = this.lang;
    return data;
  }
}
