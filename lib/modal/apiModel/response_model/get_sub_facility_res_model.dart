class GetSubFacilityResModel {
  bool? status;
  List<GetCategory>? getCategory;

  GetSubFacilityResModel({this.status, this.getCategory});

  GetSubFacilityResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['getCategory'] != null) {
      getCategory = <GetCategory>[];
      json['getCategory'].forEach((v) {
        getCategory!.add(new GetCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.getCategory != null) {
      data['getCategory'] = this.getCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetCategory {
  int? subFacilityId;
  String? subFacilityName;
  var dateCreated;
  var dateModified;
  String? status;
  int? isDeleted;

  GetCategory(
      {this.subFacilityId,
      this.subFacilityName,
      this.dateCreated,
      this.dateModified,
      this.status,
      this.isDeleted});

  GetCategory.fromJson(Map<String, dynamic> json) {
    subFacilityId = json['sub_facility_id'];
    subFacilityName = json['sub_facility_name'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    status = json['status'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_facility_id'] = this.subFacilityId;
    data['sub_facility_name'] = this.subFacilityName;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['status'] = this.status;
    data['is_deleted'] = this.isDeleted;
    return data;
  }
}
