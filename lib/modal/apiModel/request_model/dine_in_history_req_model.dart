class DineInOrderHistoryListReqModel {
  String? action;
  String? status;
  DFilter? filter;
  String? keyword;

  DineInOrderHistoryListReqModel({this.action, this.status, this.filter});

  DineInOrderHistoryListReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    status = json['status'];
    keyword = json['keyword'];
    filter =
        json['filter'] != null ? new DFilter.fromJson(json['filter']) : null;
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

class DFilter {
  String? from;
  String? to;

  DFilter({this.from, this.to});

  DFilter.fromJson(Map<String, dynamic> json) {
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
