// class AddRestaurantsDetailsReqModel {
//   String? action;
//   List<String>? restaurantCategory;
//   List<String>? cuisine;
//   String? averageCost;
//   MenuItems? menuItems;
//   SeatingCapacity? seatingCapacity;
//   DineInRating? dineInRating;
//   DineInRating? deliveryRating;
//   String? monthlyRevenueGoal;
//   String? priceRange;
//   List<String>? subFacility;
//   List<String>? restaurantType;
//
//   AddRestaurantsDetailsReqModel({
//     this.action,
//     this.restaurantCategory,
//     this.cuisine,
//     this.averageCost,
//     this.menuItems,
//     this.seatingCapacity,
//     this.dineInRating,
//     this.deliveryRating,
//     this.monthlyRevenueGoal,
//     this.priceRange,
//     this.subFacility,
//     this.restaurantType,
//   });
//
//   AddRestaurantsDetailsReqModel.fromJson(Map<String, dynamic> json) {
//     action = json['action'];
//
//     restaurantCategory = json['restaurant_category'].cast<String>();
//     cuisine = json['cuisine'].cast<String>();
//     averageCost = json['average_cost'];
//     menuItems = json['menu_items'] != null
//         ? new MenuItems.fromJson(json['menu_items'])
//         : null;
//     seatingCapacity = json['seating_capacity'] != null
//         ? new SeatingCapacity.fromJson(json['seating_capacity'])
//         : null;
//     dineInRating = json['dine_in_rating'] != null
//         ? new DineInRating.fromJson(json['dine_in_rating'])
//         : null;
//     deliveryRating = json['delivery_rating'] != null
//         ? new DineInRating.fromJson(json['delivery_rating'])
//         : null;
//     monthlyRevenueGoal = json['monthly_revenue_goal'];
//     priceRange = json['price_range'];
//     subFacility = json['sub_facility'].cast<String>();
//     restaurantType = json['restaurant_type'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['action'] = this.action;
//
//     data['restaurant_category'] = this.restaurantCategory;
//     data['cuisine'] = this.cuisine;
//     data['average_cost'] = this.averageCost;
//     if (this.menuItems != null) {
//       data['menu_items'] = this.menuItems!.toJson();
//     }
//     if (this.seatingCapacity != null) {
//       data['seating_capacity'] = this.seatingCapacity!.toJson();
//     }
//     if (this.dineInRating != null) {
//       data['dine_in_rating'] = this.dineInRating!.toJson();
//     }
//     if (this.deliveryRating != null) {
//       data['delivery_rating'] = this.deliveryRating!.toJson();
//     }
//     data['monthly_revenue_goal'] = this.monthlyRevenueGoal;
//     data['price_range'] = this.priceRange;
//     data['sub_facility'] = this.subFacility;
//     data['restaurant_type'] = this.restaurantType;
//     return data;
//   }
// }
//
// class MenuItems {
//   String? min;
//   String? max;
//
//   MenuItems({this.min, this.max});
//
//   MenuItems.fromJson(Map<String, dynamic> json) {
//     min = json['min'];
//     max = json['max'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['min'] = this.min ?? "";
//     data['max'] = this.max ?? "";
//     return data;
//   }
// }
//
// class SeatingCapacity {
//   String? min;
//   String? max;
//
//   SeatingCapacity({this.min, this.max});
//
//   SeatingCapacity.fromJson(Map<String, dynamic> json) {
//     min = json['min'];
//     max = json['max'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['min'] = this.min ?? "";
//     data['max'] = this.max ?? "";
//     return data;
//   }
// }
//
// class DineInRating {
//   String? rating;
//   String? count;
//
//   DineInRating({this.rating, this.count});
//
//   DineInRating.fromJson(Map<String, dynamic> json) {
//     rating = json['rating'];
//     count = json['count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['rating'] = this.rating;
//     data['count'] = this.count;
//     return data;
//   }
// }

/// new req model
class AddRestaurantsDetailsReqModel {
  String? action;
  List<String>? category;
  List<String>? cuisine;
  List<String>? restaurantCategory;
  String? averageCost;
  MenuItems? menuItems;
  SeatingCapacity? seatingCapacity;
  String? monthlyRevenueGoal;
  String? priceRange;
  List<String>? subFacilities;
  String? restaurantImg;
  List<Hours>? hours;
  String? restaurantName;
  String? mobileNumber;
  List<String>? restaurantType;

  AddRestaurantsDetailsReqModel(
      {this.action,
      this.category,
      this.cuisine,
      this.restaurantCategory,
      this.averageCost,
      this.menuItems,
      this.seatingCapacity,
      this.monthlyRevenueGoal,
      this.priceRange,
      this.subFacilities,
      this.restaurantImg,
      this.hours,
      this.restaurantName,
      this.mobileNumber,
      this.restaurantType});

  AddRestaurantsDetailsReqModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    category = json['category'].cast<String>();
    cuisine = json['cuisine'].cast<String>();
    restaurantCategory = json['restaurant_category'].cast<String>();
    averageCost = json['average_cost'];
    menuItems = json['menu_items'] != null
        ? new MenuItems.fromJson(json['menu_items'])
        : null;
    seatingCapacity = json['seating_capacity'] != null
        ? new SeatingCapacity.fromJson(json['seating_capacity'])
        : null;
    monthlyRevenueGoal = json['monthly_revenue_goal'];
    priceRange = json['price_range'];
    subFacilities = json['sub_facilities'].cast<String>();
    restaurantImg = json['restaurant_img'];
    if (json['hours'] != null) {
      hours = <Hours>[];
      json['hours'].forEach((v) {
        hours!.add(new Hours.fromJson(v));
      });
    }
    restaurantName = json['restaurant_name'];
    mobileNumber = json['mobile_number'];
    restaurantType = json['restaurant_type'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['category'] = this.category;
    data['cuisine'] = this.cuisine;
    data['restaurant_category'] = this.restaurantCategory;
    data['average_cost'] = this.averageCost;
    if (this.menuItems != null) {
      data['menu_items'] = this.menuItems!.toJson();
    }
    if (this.seatingCapacity != null) {
      data['seating_capacity'] = this.seatingCapacity!.toJson();
    }
    data['monthly_revenue_goal'] = this.monthlyRevenueGoal;
    data['price_range'] = this.priceRange;
    data['sub_facilities'] = this.subFacilities;
    data['restaurant_img'] = this.restaurantImg;
    if (this.hours != null) {
      data['hours'] = this.hours!.map((v) => v.toJson()).toList();
    }
    data['restaurant_name'] = this.restaurantName;
    data['mobile_number'] = this.mobileNumber;
    data['restaurant_type'] = this.restaurantType;
    return data;
  }
}

class MenuItems {
  String? min;
  String? max;

  MenuItems({this.min, this.max});

  MenuItems.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    return data;
  }
}

class SeatingCapacity {
  String? min;
  String? max;

  SeatingCapacity({this.min, this.max});

  SeatingCapacity.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    return data;
  }
}

class Hours {
  Monday? monday;
  Monday? thusday;
  Monday? wednsday;
  Monday? thursday;
  Monday? friday;
  Monday? saturday;
  Monday? sunday;

  Hours(
      {this.monday,
      this.thusday,
      this.wednsday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday});

  Hours.fromJson(Map<String, dynamic> json) {
    monday =
        json['monday'] != null ? new Monday.fromJson(json['monday']) : null;
    thusday =
        json['thusday'] != null ? new Monday.fromJson(json['thusday']) : null;
    wednsday =
        json['wednsday'] != null ? new Monday.fromJson(json['wednsday']) : null;
    thursday =
        json['thursday'] != null ? new Monday.fromJson(json['thursday']) : null;
    friday =
        json['friday'] != null ? new Monday.fromJson(json['friday']) : null;
    saturday =
        json['saturday'] != null ? new Monday.fromJson(json['saturday']) : null;
    sunday =
        json['sunday'] != null ? new Monday.fromJson(json['sunday']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.monday != null) {
      data['monday'] = this.monday!.toJson();
    }
    if (this.thusday != null) {
      data['thusday'] = this.thusday!.toJson();
    }
    if (this.wednsday != null) {
      data['wednsday'] = this.wednsday!.toJson();
    }
    if (this.thursday != null) {
      data['thursday'] = this.thursday!.toJson();
    }
    if (this.friday != null) {
      data['friday'] = this.friday!.toJson();
    }
    if (this.saturday != null) {
      data['saturday'] = this.saturday!.toJson();
    }
    if (this.sunday != null) {
      data['sunday'] = this.sunday!.toJson();
    }
    return data;
  }
}

class Monday {
  String? from;
  String? to;

  Monday({this.from, this.to});

  Monday.fromJson(Map<String, dynamic> json) {
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
