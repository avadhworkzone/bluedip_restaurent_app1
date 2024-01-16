class TackAwayOrderHistoryListReqModel {
  String? action;
  String? status;
  Filter? filter;
  String? keyword;

  TackAwayOrderHistoryListReqModel({this.action, this.status, this.filter});

  TackAwayOrderHistoryListReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    status = json['status'];
    keyword = json['keyword'];
    filter =
        json['filter'] != null ? new Filter.fromJson(json['filter']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['status'] = this.status;
    data['keyword'] = this.keyword;
    if (this.filter != null) {
      data['filter'] = this.filter!.toJson();
    }
    return data;
  }
}

class Filter {
  String? from;
  String? to;

  Filter({this.from, this.to});

  Filter.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}
