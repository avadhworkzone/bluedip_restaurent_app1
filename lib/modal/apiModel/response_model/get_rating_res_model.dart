class GetRatingResModel {
  bool? status;
  List<Data>? data;

  GetRatingResModel({this.status, this.data});

  GetRatingResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? type;
  String? avg;

  Data({this.type, this.avg});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    avg = json['avg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['avg'] = this.avg;
    return data;
  }
}
