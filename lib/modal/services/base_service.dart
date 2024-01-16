abstract class BaseService<T> {
  /// base url
  final String baseUrl =
      // 'https://fjxhgdvfzl.execute-api.ap-south-1.amazonaws.com/dev/';
      'https://8zngcsbdw9.execute-api.ap-south-1.amazonaws.com/dev/';

  /// auth url
  final String registerUrl = 'restaurant/register-restaurant';
  final String loginUrl = 'restaurant/restaurant-login';
  final String otpUrl = 'restaurant/otp';
  final String forgotPasswordUrl = 'restaurant/forgot-password';
  final String resetPasswordUrl = 'restaurant/reset-password';

  /// resto details
  final String getCategory = 'category/manage-category';
  final String addRestodetails = 'restaurant/manage-restaurant';
  final String getSubFacility = 'sub-facility/manage-sub-facility';
  final String getRatingData = 'restaurant/rating';

  /// offers
  final String manageOffer = 'offer/manage-offer';

  /// account flow
  final String getRestoLocation = "location/restaurant-location";
  final String addCharges = "charges/manage-charges";

  ///orderList
  final String getOrderList = 'restaurant/order';
  final String getBookingList = 'restaurant/booking-order';

  /// order history
  final String orderHistory = "restaurant/order-history";

  /// upload profile pic
  final String uploadProfilePic = "general/image/upload";
}
