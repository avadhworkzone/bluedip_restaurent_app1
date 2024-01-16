class GetLateOrderListResModel {
  bool? status;
  String? message;
  List<Data>? data;

  GetLateOrderListResModel({this.status, this.message, this.data});

  GetLateOrderListResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
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
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? orderId;
  int? randomOrderId;
  String? userId;
  String? restaurantId;
  int? offerId;
  String? orderType;
  String? userFullName;
  String? mobileNumber;
  String? time;
  String? specialRequest;
  String? orderStatus;
  int? orderPreparationTime;
  int? totalPreparationTime;
  String? orderAcceptedTime;
  int? isNeedMoreTime;
  String? dateCreated;
  String? dishes;
  String? coldDrinks;
  PaymentData? paymentData;
  UserData? userData;
  List<CartData>? cartData;

  Data(
      {this.orderId,
      this.randomOrderId,
      this.userId,
      this.restaurantId,
      this.offerId,
      this.orderType,
      this.userFullName,
      this.mobileNumber,
      this.time,
      this.specialRequest,
      this.orderStatus,
      this.orderPreparationTime,
      this.totalPreparationTime,
      this.orderAcceptedTime,
      this.isNeedMoreTime,
      this.dateCreated,
      this.dishes,
      this.coldDrinks,
      this.paymentData,
      this.userData,
      this.cartData});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    randomOrderId = json['random_order_id'];
    userId = json['user_id'];
    restaurantId = json['restaurant_id'];
    offerId = json['offer_id'];
    orderType = json['order_type'];
    userFullName = json['user_full_name'];
    mobileNumber = json['mobile_number'];
    time = json['time'];
    specialRequest = json['special_request'];
    orderStatus = json['order_status'];
    orderPreparationTime = json['order_preparation_time'];
    totalPreparationTime = json['total_preparation_time'];
    orderAcceptedTime = json['order_accepted_time'];
    isNeedMoreTime = json['is_need_more_time'];
    dateCreated = json['date_created'];
    dishes = json['dishes'];
    coldDrinks = json['cold_drinks'];
    paymentData = json['payment_data'] != null
        ? new PaymentData.fromJson(json['payment_data'])
        : null;
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    if (json['cart_data'] != null) {
      cartData = <CartData>[];
      json['cart_data'].forEach((v) {
        cartData!.add(new CartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['random_order_id'] = this.randomOrderId;
    data['user_id'] = this.userId;
    data['restaurant_id'] = this.restaurantId;
    data['offer_id'] = this.offerId;
    data['order_type'] = this.orderType;
    data['user_full_name'] = this.userFullName;
    data['mobile_number'] = this.mobileNumber;
    data['time'] = this.time;
    data['special_request'] = this.specialRequest;
    data['order_status'] = this.orderStatus;
    data['order_preparation_time'] = this.orderPreparationTime;
    data['total_preparation_time'] = this.totalPreparationTime;
    data['order_accepted_time'] = this.orderAcceptedTime;
    data['is_need_more_time'] = this.isNeedMoreTime;
    data['date_created'] = this.dateCreated;
    data['dishes'] = this.dishes;
    data['cold_drinks'] = this.coldDrinks;
    if (this.paymentData != null) {
      data['payment_data'] = this.paymentData!.toJson();
    }
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    if (this.cartData != null) {
      data['cart_data'] = this.cartData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentData {
  int? paymentId;
  int? netPayable;
  String? paymentStatus;

  PaymentData({this.paymentId, this.netPayable, this.paymentStatus});

  PaymentData.fromJson(Map<String, dynamic> json) {
    paymentId = json['payment_id'];
    netPayable = json['net_payable'];
    paymentStatus = json['payment_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_id'] = this.paymentId;
    data['net_payable'] = this.netPayable;
    data['payment_status'] = this.paymentStatus;
    return data;
  }
}

class UserData {
  String? userId;
  Null? userImg;
  String? dateCreated;

  UserData({this.userId, this.userImg, this.dateCreated});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userImg = json['user_img'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_img'] = this.userImg;
    data['date_created'] = this.dateCreated;
    return data;
  }
}

class CartData {
  int? orderId;
  int? quantity;
  String? menuType;
  String? cartItemId;
  String? dateCreated;
  int? savingPrice;
  int? totalAmount;
  List<SubMenuItem>? subMenuItem;
  int? discountPrice;
  MenuItemName? menuItemName;
  int? totalDiscountPrice;

  CartData(
      {this.orderId,
      this.quantity,
      this.menuType,
      this.cartItemId,
      this.dateCreated,
      this.savingPrice,
      this.totalAmount,
      this.subMenuItem,
      this.discountPrice,
      this.menuItemName,
      this.totalDiscountPrice});

  CartData.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    quantity = json['quantity'];
    menuType = json['menu_type'];
    cartItemId = json['cart_item_id'];
    dateCreated = json['date_created'];
    savingPrice = json['saving_price'];
    totalAmount = json['total_amount'];
    if (json['sub_menu_item'] != null) {
      subMenuItem = <SubMenuItem>[];
      json['sub_menu_item'].forEach((v) {
        subMenuItem!.add(new SubMenuItem.fromJson(v));
      });
    }
    discountPrice = json['discount_price'];
    menuItemName = json['menu_item_name'] != null
        ? new MenuItemName.fromJson(json['menu_item_name'])
        : null;
    totalDiscountPrice = json['total_discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['quantity'] = this.quantity;
    data['menu_type'] = this.menuType;
    data['cart_item_id'] = this.cartItemId;
    data['date_created'] = this.dateCreated;
    data['saving_price'] = this.savingPrice;
    data['total_amount'] = this.totalAmount;
    if (this.subMenuItem != null) {
      data['sub_menu_item'] = this.subMenuItem!.map((v) => v.toJson()).toList();
    }
    data['discount_price'] = this.discountPrice;
    if (this.menuItemName != null) {
      data['menu_item_name'] = this.menuItemName!.toJson();
    }
    data['total_discount_price'] = this.totalDiscountPrice;
    return data;
  }
}

class SubMenuItem {
  String? id;
  String? name;
  String? type;
  String? price;

  SubMenuItem({this.id, this.name, this.type, this.price});

  SubMenuItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['price'] = this.price;
    return data;
  }
}

class MenuItemName {
  String? name;
  int? price;
  String? dateCreated;
  int? menuSubCategoryId;

  MenuItemName(
      {this.name, this.price, this.dateCreated, this.menuSubCategoryId});

  MenuItemName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    dateCreated = json['date_created'];
    menuSubCategoryId = json['menu_sub_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['date_created'] = this.dateCreated;
    data['menu_sub_category_id'] = this.menuSubCategoryId;
    return data;
  }
}
