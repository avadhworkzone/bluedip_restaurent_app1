import 'package:get_storage/get_storage.dart';

class PreferenceManagerUtils {
  static GetStorage getStorage = GetStorage();

  static String token = 'token';
  static String loggedin = 'loggedin';
  static String signup = 'signup';
  static String addRestoDetails = 'addRestoDetails';
  static String restoImage = 'restoImage';

  ///TOKEN
  static Future setToken(String? value) async {
    await getStorage.write(token, value);
  }

  static String getToken() {
    return getStorage.read(token) ?? '';
  }

  /// ALREADY LOGIN
  static Future setAlreadyLogin(bool? value) async {
    await getStorage.write(loggedin, value);
  }

  static bool getAlreadyLogin() {
    return getStorage.read(loggedin) ?? false;
  }

  /// preparing manage time
  static Future setOrderTimer({required String key, required int value}) async {
    await getStorage.write(key, value);
  }

  static int getOrderTimer(String key) {
    return getStorage.read(key) ?? 0;
  }

  /// ALREADY SIGNUP
  static Future setAlreadySignup(bool? value) async {
    await getStorage.write(signup, value);
  }

  static bool getAlreadySignup() {
    return getStorage.read(signup) ?? false;
  }

  /// add resto details
  static Future setRestoDetailsAdd(bool? value) async {
    await getStorage.write(addRestoDetails, value);
  }

  static bool getRestoDetailsAdd() {
    return getStorage.read(addRestoDetails) ?? false;
  }

  /// resto image
  static Future setRestoImage(String? value) async {
    await getStorage.write(restoImage, value);
  }

  static String getRestoImage() {
    return getStorage.read(restoImage) ?? "";
  }

  ///logout

  static Future clearPreference() async {
    // FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    // await firebaseMessaging.deleteToken();
    await getStorage.erase();
    // await NotificationMethods.getFcmToken();
  }
}
