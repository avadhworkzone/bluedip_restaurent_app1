class EditOfferReqModel {
  String? action;
  int? offerId;
  String? timeType;
  String? offerPercentage;
  TimePeriod? timePeriod;
  String? offerType;
  String? totalDeal;

  EditOfferReqModel(
      {this.action,
      this.offerId,
      this.timeType,
      this.offerPercentage,
      this.timePeriod,
      this.offerType,
      this.totalDeal});

  EditOfferReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    offerId = json['offer_id'];
    timeType = json['time_type'];
    offerPercentage = json['offer_percentage'];
    timePeriod = json['time_period'] != null
        ? new TimePeriod.fromJson(json['time_period'])
        : null;
    offerType = json['offer_type'];
    totalDeal = json['total_deal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['offer_id'] = this.offerId;
    data['time_type'] = this.timeType;
    data['offer_percentage'] = this.offerPercentage;
    if (this.timePeriod != null) {
      data['time_period'] = this.timePeriod!.toJson();
    }
    data['offer_type'] = this.offerType;
    data['total_deal'] = this.totalDeal;
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
