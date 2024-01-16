class GetOfferResModel {
  bool? status;
  List<OffersData>? data;

  GetOfferResModel({this.status, this.data});

  GetOfferResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <OffersData>[];
      json['data'].forEach((v) {
        data!.add(new OffersData.fromJson(v));
      });
    } else if (json['data'] == null) {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OffersData {
  int? offerId;
  int? randomOfferId;
  String? dealType;
  List<String>? day;
  String? timeType;
  TimePeriod? timePeriod;
  String? offerPercentage;
  String? offerType;
  int? totalDeal;
  String? dealDate;
  String? dateCreated;

  OffersData(
      {this.offerId,
      this.randomOfferId,
      this.dealType,
      this.day,
      this.timeType,
      this.timePeriod,
      this.offerPercentage,
      this.offerType,
      this.totalDeal,
      this.dealDate,
      this.dateCreated});

  OffersData.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    randomOfferId = json['random_offer_id'];
    dealType = json['deal_type'];
    day = json['day'].cast<String>();
    timeType = json['time_type'];
    timePeriod = json['time_period'] != null
        ? new TimePeriod.fromJson(json['time_period'])
        : null;
    offerPercentage = json['offer_percentage'];
    offerType = json['offer_type'];
    totalDeal = json['total_deal'];
    dealDate = json['deal_date'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offer_id'] = this.offerId;
    data['random_offer_id'] = this.randomOfferId;
    data['deal_type'] = this.dealType;
    data['day'] = this.day;
    data['time_type'] = this.timeType;
    if (this.timePeriod != null) {
      data['time_period'] = this.timePeriod!.toJson();
    }
    data['offer_percentage'] = this.offerPercentage;
    data['offer_type'] = this.offerType;
    data['total_deal'] = this.totalDeal;
    data['deal_date'] = this.dealDate;
    data['date_created'] = this.dateCreated;
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
