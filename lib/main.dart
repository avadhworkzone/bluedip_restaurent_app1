import 'package:bluedip_restaurent/UiScreen/Splash%20screen/SplashScreen.dart';
import 'package:bluedip_restaurent/viewModel/offer_view_model.dart';
import 'package:bluedip_restaurent/viewModel/order_view_model.dart';
import 'package:bluedip_restaurent/viewModel/restuarant_loaction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'UiScreen/AddRestoDetailScreen/AddDetailsScreen.dart';
import 'UiScreen/AddRestoDetailScreen/add_resto_location.dart';
import 'UiScreen/AddRestoDetailScreen/map_screen.dart';
import 'viewModel/account_view_model.dart';
import 'viewModel/add_resto_detail_view_model.dart';
import 'viewModel/auth_view_model.dart';
import 'viewModel/bottom_view_model.dart';
import 'viewModel/dine_in_order_view_model.dart';
import 'viewModel/order_history_view_model.dart';
import 'viewModel/upload_image_view_model.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen(),
            // home: AddDetailsScreen(),
          );
        });
  }

  AuthViewModel authViewModel = Get.put(AuthViewModel());
  RestaurantsLocationViewModel restaurantsLocationViewModel =
      Get.put(RestaurantsLocationViewModel());
  AddRestaurantsViewModel addRestaurantsViewModel =
      Get.put(AddRestaurantsViewModel());
  ManageOfferViewModel manageOfferViewModel = Get.put(ManageOfferViewModel());
  AccountViewModel accountViewModel = Get.put(AccountViewModel());
  OrderViewModel orderViewModel = Get.put(OrderViewModel());
  BottomViewModel bottomViewModel = Get.put(BottomViewModel());
  DineInOrderViewModel dineInOrderViewModel = Get.put(DineInOrderViewModel());
  OrderHistoryViewModel orderHistoryViewModel =
      Get.put(OrderHistoryViewModel());
  UploadImageViewModel uploadImageViewModel = Get.put(UploadImageViewModel());
}
