class AddOfferReqModel {
  String? action;
  List<OfferData>? offerData;

  AddOfferReqModel({this.action, this.offerData});

  AddOfferReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    if (json['offer_data'] != null) {
      offerData = <OfferData>[];
      json['offer_data'].forEach((v) {
        offerData!.add(new OfferData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    if (this.offerData != null) {
      data['offer_data'] = this.offerData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OfferData {
  String? dealType;
  List<String>? day;
  String? offerPercentage;
  String? timeType;
  TimePeriod? timePeriod;
  String? offerType;
  String? totalDeal;
  String? minAmount;

  OfferData(
      {this.dealType,
      this.day,
      this.offerPercentage,
      this.timeType,
      this.timePeriod,
      this.offerType,
      this.totalDeal,
      this.minAmount});

  OfferData.fromJson(Map<String, dynamic> json) {
    dealType = json['deal_type'];
    day = json['day'].cast<String>();
    offerPercentage = json['offer_percentage'];
    timeType = json['time_type'];
    timePeriod = json['time_period'] != null
        ? new TimePeriod.fromJson(json['time_period'])
        : null;
    offerType = json['offer_type'];
    totalDeal = json['total_deal'];
    minAmount = json['min_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deal_type'] = this.dealType;
    data['day'] = this.day;
    data['offer_percentage'] = this.offerPercentage;
    data['time_type'] = this.timeType;
    if (this.timePeriod != null) {
      data['time_period'] = this.timePeriod!.toJson();
    }
    data['offer_type'] = this.offerType;
    data['total_deal'] = this.totalDeal;
    data['min_amount'] = this.minAmount;
    return data;
  }
}

class TimePeriod {
  String? start;
  String? end;

  TimePeriod({this.start, this.end});

  TimePeriod.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}
