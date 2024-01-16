class TakeAwayOrderDetailResModel {
  bool? status;
  String? message;
  OrderDetailData? data;

  TakeAwayOrderDetailResModel({this.status, this.message, this.data});

  TakeAwayOrderDetailResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new OrderDetailData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OrderDetailData {
  var orderId;
  var randomOrderId;
  String? userId;
  String? restaurantId;
  var offerId;
  String? orderType;
  String? userFullName;
  String? mobileNumber;
  String? time;
  String? specialRequest;
  String? orderStatus;
  var orderPreparationTime;
  var isNeedMoreTime;
  String? dateCreated;
  PaymentData? paymentData;
  UserData? userData;
  List<CartData>? cartData;
  var totalItems;

  OrderDetailData(
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
      this.isNeedMoreTime,
      this.dateCreated,
      this.paymentData,
      this.userData,
      this.cartData,
      this.totalItems});

  OrderDetailData.fromJson(Map<String, dynamic> json) {
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
    isNeedMoreTime = json['is_need_more_time'];
    dateCreated = json['date_created'];
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
    totalItems = json['total_items'];
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
    data['is_need_more_time'] = this.isNeedMoreTime;
    data['date_created'] = this.dateCreated;
    if (this.paymentData != null) {
      data['payment_data'] = this.paymentData!.toJson();
    }
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    if (this.cartData != null) {
      data['cart_data'] = this.cartData!.map((v) => v.toJson()).toList();
    }
    data['total_items'] = this.totalItems;
    return data;
  }
}

class PaymentData {
  var gst;
  double? cgst;
  double? sgst;
  var savings;
  String? userId;
  var orderId;
  var subTotal;
  double? gstAmount;
  var paymentId;
  double? grandTotal;
  var netPayable;
  String? dateCreated;
  String? paymentStatus;
  var packingCharges;

  PaymentData(
      {this.gst,
      this.cgst,
      this.sgst,
      this.savings,
      this.userId,
      this.orderId,
      this.subTotal,
      this.gstAmount,
      this.paymentId,
      this.grandTotal,
      this.netPayable,
      this.dateCreated,
      this.paymentStatus,
      this.packingCharges});

  PaymentData.fromJson(Map<String, dynamic> json) {
    gst = json['gst'];
    cgst = json['cgst'];
    sgst = json['sgst'];
    savings = json['savings'];
    userId = json['user_id'];
    orderId = json['order_id'];
    subTotal = json['sub_total'];
    gstAmount = json['gst_amount'];
    paymentId = json['payment_id'];
    grandTotal = json['grand_total'];
    netPayable = json['net_payable'];
    dateCreated = json['date_created'];
    paymentStatus = json['payment_status'];
    packingCharges = json['packing_charges'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gst'] = this.gst;
    data['cgst'] = this.cgst;
    data['sgst'] = this.sgst;
    data['savings'] = this.savings;
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['sub_total'] = this.subTotal;
    data['gst_amount'] = this.gstAmount;
    data['payment_id'] = this.paymentId;
    data['grand_total'] = this.grandTotal;
    data['net_payable'] = this.netPayable;
    data['date_created'] = this.dateCreated;
    data['payment_status'] = this.paymentStatus;
    data['packing_charges'] = this.packingCharges;
    return data;
  }
}

class UserData {
  String? userId;
  var userImg;
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
  var orderId;
  var quantity;
  String? cartItemId;
  String? dateCreated;
  var savingPrice;
  var totalAmount;
  List<SubMenuItem>? subMenuItem;
  var discountPrice;
  MenuItemName? menuItemName;
  var totalDiscountPrice;

  CartData(
      {this.orderId,
      this.quantity,
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
  var price;
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
